
(cl:in-package :asdf)

(defsystem "practica_servicios-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "geograsp" :depends-on ("_package_geograsp"))
    (:file "_package_geograsp" :depends-on ("_package"))
    (:file "position" :depends-on ("_package_position"))
    (:file "_package_position" :depends-on ("_package"))
  ))