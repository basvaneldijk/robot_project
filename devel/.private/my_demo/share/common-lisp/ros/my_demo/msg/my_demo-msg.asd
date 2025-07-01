
(cl:in-package :asdf)

(defsystem "my_demo-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BrushPoseAction" :depends-on ("_package_BrushPoseAction"))
    (:file "_package_BrushPoseAction" :depends-on ("_package"))
    (:file "BrushPoseActionFeedback" :depends-on ("_package_BrushPoseActionFeedback"))
    (:file "_package_BrushPoseActionFeedback" :depends-on ("_package"))
    (:file "BrushPoseActionGoal" :depends-on ("_package_BrushPoseActionGoal"))
    (:file "_package_BrushPoseActionGoal" :depends-on ("_package"))
    (:file "BrushPoseActionResult" :depends-on ("_package_BrushPoseActionResult"))
    (:file "_package_BrushPoseActionResult" :depends-on ("_package"))
    (:file "BrushPoseFeedback" :depends-on ("_package_BrushPoseFeedback"))
    (:file "_package_BrushPoseFeedback" :depends-on ("_package"))
    (:file "BrushPoseGoal" :depends-on ("_package_BrushPoseGoal"))
    (:file "_package_BrushPoseGoal" :depends-on ("_package"))
    (:file "BrushPoseResult" :depends-on ("_package_BrushPoseResult"))
    (:file "_package_BrushPoseResult" :depends-on ("_package"))
  ))