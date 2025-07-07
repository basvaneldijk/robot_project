#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import PoseStamped
from hoofdprogramma.msg import KwastDetection
from hoofdprogramma.msg import PickAndPlaceAction, PickAndPlaceGoal
import actionlib

class Hoofdprogramma(object):
    def __init__(self):
        rospy.init_node('hoofdprogramma_node')

        # Interne flags
        self.start_cyclus = False
        self.kwast_ontvangen = False
        self.kwast_pose = None
        self.kwast_type = ""
        self.homing_done = False  
        self.vision_active = False

        # Publishers
        self.carousel_pub = rospy.Publisher('/carousel_command', String, queue_size=10)
        self.status_pub = rospy.Publisher('/status_light', String, queue_size=10)
        self.vision_enable_pub = rospy.Publisher('/vision_enable', String, queue_size=1)

        # Subscribers
        rospy.Subscriber('/carousel_status', String, self.carousel_status_cb)
        rospy.Subscriber('/kwast_detectie', KwastDetection, self.kwast_detectie_cb)
        rospy.Subscriber('/hmi_commands', String, self.hmi_command_cb)
        
        #Vision topics
        self.sub_vision_topics = [
            ('/kwast_norm', None),
            ('/kwast_dik', None),
            ('/kwast_rub', None),
            ('/kwast_pen', None)
        ]

        # Action client voor pick-and-place
        self.pick_client = actionlib.SimpleActionClient('/pick_and_place', PickAndPlaceAction)
        rospy.loginfo("Wachten op robot action server...")
        self.pick_client.wait_for_server()
        rospy.loginfo("Verbonden met robot action server")

        rospy.spin()

    def hmi_command_cb(self, msg):
        rospy.loginfo("Ontvangen HMI-commando: %s", msg.data)

        if msg.data == "home":
            rospy.loginfo("Home-commando ontvangen. Carousel gaat naar home.")
            self.carousel_pub.publish("home")

        elif msg.data == "single_start":
            self.start_cyclus = True
            self.carousel_pub.publish("single_start")   
            self.start_cyclusflow()

    def carousel_status_cb(self, msg):
        if msg.data == "cycle_done":
            rospy.logwarn("DEBUG: cyclus_done ontvangen")
            self.vision_active = True
            rospy.logwarn("DEBUG: vision_active = True gezet")
            self.start_vision_subscribers()
            rospy.logwarn("DEBUG: vision_subscribers gestart")
            self.vision_enable_pub.publish("aan")
            rospy.logwarn("DEBUG: vision_enable = AAN gepubliceerd")
            rospy.sleep(1.0)

            rospy.loginfo("Carrouselpositie bereikt. Wacht op kwastdetectie...")

            # Reset flags om nieuwe detectie mogelijk te maken
            self.kwast_ontvangen = False
            self.kwast_pose = None
            self.kwast_type = ""

            # Vision node moet nu actief zijn geen extra actie nodig
            # Hij detecteert en publiceert automatisch als hij actief draait
            
        elif msg.data == ">> Homing klaar.":
            rospy.loginfo("Homing is voltooid.")
            self.homing_done = True
    
    def vision_pose_cb(self, msg):
        if not self.vision_active:
            return  # negeer input van vision als het nog niet actief mag zijn

        if not self.kwast_ontvangen:
            topic = msg._connection_header['topic']
            kwast_type = topic.split("/")[-1].replace("kwast_", "")
            rospy.loginfo("Kwast ontvangen van vision node: %s", kwast_type)
            self.kwast_pose = msg.pose
            self.kwast_type = kwast_type
            self.kwast_ontvangen = True
            self.vision_active = False  # reset zodat hij niet meer verwerkt
            self.stop_vision_subscribers()
            self.vision_enable_pub.publish("uit")

    def kwast_detectie_cb(self, msg):
        rospy.loginfo("Kwast gedetecteerd: %s", msg.kwast_type)
        self.kwast_pose = msg.pose
        self.kwast_type = msg.kwast_type
        self.kwast_ontvangen = True

    def start_cyclusflow(self):
        # 0. Carousel naar home (alleen als het nog niet is gedaan)
        if not self.homing_done:
            rospy.loginfo("Stuur carousel naar home...")
            self.carousel_pub.publish("home")
            rospy.sleep(1.0)  # Geef tijd voor homing start
            return  # wacht eerst op homing voordat cyclus start

        # 1. Carrousel start
        rospy.loginfo("Start carrousel...")
        self.carousel_pub.publish("single_start")

        # 2. Wacht op kwastdetectie
        timeout = rospy.Time.now() + rospy.Duration(30.0)
        while not self.kwast_ontvangen and rospy.Time.now() < timeout:
            rospy.sleep(0.1)

        if not self.kwast_ontvangen:
            rospy.logwarn("Geen kwast gedetecteerd binnen timeout.")
            self.status_pub.publish("kwast_niet_gevonden")
            return

        # 3. Start pick-and-place
        rospy.loginfo("Kwast gevonden: type=%s, positie=(%.3f, %.3f, %.3f)", 
              self.kwast_type,
              self.kwast_pose.position.x,
              self.kwast_pose.position.y,
              self.kwast_pose.position.z)
        
        goal = PickAndPlaceGoal()
        goal.target_pose = self.kwast_pose
        goal.kwast_type = self.kwast_type

        rospy.loginfo("Start pick-and-place...")
        self.pick_client.send_goal(goal)
        self.pick_client.wait_for_result()

        result = self.pick_client.get_result()
        if result and result.success:
            rospy.loginfo("Pick-and-place geslaagd.")
            self.status_pub.publish("geslaagd")
        else:
            rospy.logwarn("Pick-and-place mislukt.")
            self.status_pub.publish("mislukt")

        # 4. Reset flags en terug naar home
        self.kwast_ontvangen = False
        self.start_cyclus = False

        # 5. Meld cyclus voltooid
        self.status_pub.publish("cyclus_voltooid")
        rospy.loginfo("Cyclus afgerond.")

    def start_vision_subscribers(self):
        for i, (topic, sub) in enumerate(self.sub_vision_topics):
            if sub is None:
                self.sub_vision_topics[i] = (topic, rospy.Subscriber(topic, PoseStamped, self.vision_pose_cb))

    def stop_vision_subscribers(self):
        for i, (topic, sub) in enumerate(self.sub_vision_topics):
            if sub is not None:
                sub.unregister()
                self.sub_vision_topics[i] = (topic, None)

if __name__ == '__main__':
    try:
        Hoofdprogramma()
    except rospy.ROSInterruptException:
        pass