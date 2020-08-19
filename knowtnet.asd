;; Requires cl-user to have :use-ed :iterate ;; TODO: Remove this need
(asdf:defsystem "knowtnet"
  :version "0.1.0"
  :author ""
  :license ""
  ;; :defsystem-depends-on (:trivia)
  :serial t
  :depends-on (:alexandria           ; more utilities
               :uniform-utilities    ; getv
               :hunchentoot          ; main server
               :cl-markup            ; generating html
               :hash-set             ; sets
               :cl-who
               ;; dot operators are said to deprecate but have been used
               ;; ps:*version* 2.7  works - this version is not
               ;; specified in asd file
               :parenscript          ; generating javascript
               :trivia               ; destructuring class slots
               :cl-utilities         ; split-sequence
               :plump                ; parsing html, to get tirtle
               :drakma               ; fetching html, to send title
               :cl-interpol          ; string interpolation
               :unix-opts
               ;; #-swank :swank
               :clsql
               :clsql-mysql
               :cl-arrows
               :reader
               :py4cl2
               :crypto-shortcuts
               :sanitize
               :cffi-grovel)
  :pathname "src"
  :components ((:file "package")
               (:module "dependencies"
                        :components ((:file "clsql-sys")
                                     (:file "sanitize")))
               (:module "utilities"
                        :components ((:file "utilities")))
               (:module "base"
                        :components ((:file "theme")
                                     (:file "user")
                                     (:file "link")
                                     (:file "persistent-cookie")))
               (:module "main"
                        :components ((:file "config")
                                     (:file "persistent-login")
                                     (:file "front-page")
                                     (:file "signup-page")
                                     (:file "user-page")
                                     (:file "sharelink-page")
                                     (:file "miscellaneous")
                                     (:file "about"))))
  :entry-point "knowledge-transfer::executable-entry-point"
  :description "")

;; (asdf:defsystem "knowledge-transfer/tests"
;;   :author ""
;;   :license ""
;;   :depends-on ("knowledge-transfer"
;;                "rove")
;;   :components ((:module "tests"
;;                 :components
;;                 ((:file "main"))))
;;   :description "Test system for knowledge-transfer"
;;   :perform (test-op (op c) (symbol-call :rove :run c)))
