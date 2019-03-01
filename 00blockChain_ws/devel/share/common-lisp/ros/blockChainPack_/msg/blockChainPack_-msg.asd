
(cl:in-package :asdf)

(defsystem "blockChainPack_-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "blockDetail" :depends-on ("_package_blockDetail"))
    (:file "_package_blockDetail" :depends-on ("_package"))
    (:file "lastHash" :depends-on ("_package_lastHash"))
    (:file "_package_lastHash" :depends-on ("_package"))
  ))