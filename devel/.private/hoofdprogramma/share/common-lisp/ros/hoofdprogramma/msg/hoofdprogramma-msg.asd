
(cl:in-package :asdf)

(defsystem "hoofdprogramma-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "KwastDetection" :depends-on ("_package_KwastDetection"))
    (:file "_package_KwastDetection" :depends-on ("_package"))
    (:file "PickAndPlaceAction" :depends-on ("_package_PickAndPlaceAction"))
    (:file "_package_PickAndPlaceAction" :depends-on ("_package"))
    (:file "PickAndPlaceActionFeedback" :depends-on ("_package_PickAndPlaceActionFeedback"))
    (:file "_package_PickAndPlaceActionFeedback" :depends-on ("_package"))
    (:file "PickAndPlaceActionGoal" :depends-on ("_package_PickAndPlaceActionGoal"))
    (:file "_package_PickAndPlaceActionGoal" :depends-on ("_package"))
    (:file "PickAndPlaceActionResult" :depends-on ("_package_PickAndPlaceActionResult"))
    (:file "_package_PickAndPlaceActionResult" :depends-on ("_package"))
    (:file "PickAndPlaceFeedback" :depends-on ("_package_PickAndPlaceFeedback"))
    (:file "_package_PickAndPlaceFeedback" :depends-on ("_package"))
    (:file "PickAndPlaceGoal" :depends-on ("_package_PickAndPlaceGoal"))
    (:file "_package_PickAndPlaceGoal" :depends-on ("_package"))
    (:file "PickAndPlaceResult" :depends-on ("_package_PickAndPlaceResult"))
    (:file "_package_PickAndPlaceResult" :depends-on ("_package"))
  ))