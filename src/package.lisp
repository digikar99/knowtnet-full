(in-package :cl-user)
(defpackage :kt.utils
     (:use :cl :uniform-utilities :closer-mop :hash-set :cl-arrows)
     (:shadowing-import-from :closer-mop
                             "STANDARD-GENERIC-FUNCTION"
                             "DEFMETHOD"
                             "DEFGENERIC")
     (:export
      :concat
      :lm
      :->
      :$
      :html5
      :update-view-from-class
      :write-clos-object
      :read-clos-object)
     #.(cons :export (iter outer
                           (for package in `(:uniform-utilities :hash-set
                                                                :closer-mop
                                                                :cl
                                                                :cl-arrows))
                           (iter (for symbol in-package package external-only t)
                                 (in outer (collect symbol)))))
     (:export :split-sequence
              :@
              :chain
              :get-random-token)
     (:shadowing-import-from :closer-mop
                             "STANDARD-GENERIC-FUNCTION"
                             "DEFMETHOD"
                             "DEFGENERIC")
     (:shadowing-import-from :parenscript "@" "CHAIN")
     (:import-from :cl-utilities "SPLIT-SEQUENCE"))

(defpackage :kt.base
  (:use :kt.utils)
  (:export
   ;; theme.lisp
   ;; :add-to-user-theme-hash-table
   ;; :*theme-name-theme-hash-table*
   :make-theme
   :theme
   :theme-name-p
   :theme-name
   :theme-links
   :get-theme-with-name
   :theme-id
   :theme-list
   :initialize-database

   ;; user.lisp
   :make-user
   ;; :*username-user-hash-table*
   :check-password
   :change-password
   :user
   :user-username
   :user-salt
   :user-password
   :user-id
   :user-themes
   :user-known-links
   :get-salt
   :*salt-length*
   :get-password-with-salt
   :get-user-with-username
   :get-link-list-unknown-to-user
   :delete-user-with-username
   :user-add-to-known-links
   
   ;; link.lisp
   :url
   :url-p
   :level
   :level-p
   :link
   :link-url
   :link-title
   :link-newbie-p
   :link-level
   :link-id
   :link-description
   :link-themes
   :link-rater-user-ids
   :link-positive-rater-user-ids
   :make-link
   :get-link-with-id
   :get-link-with-url
   :link-count
   :link-rate
   :link-upvote-count
   :link-vote-count
   :link-upvoted-by-user-p
   :get-links
   :+link-description-length+

   ;; persistent-cookie.lisp
   :*persistent-cookie-duration*
   :persistent-cookie
   :check-persistent-cookie
   :make-persistent-cookie
   :update-persistent-cookie
   :get-user-with-persistent-cookie
   :delete-persistent-cookie
   :delete-all-persistent-cookies

   ;; necessary for trivia
   :id
   :title
   :url
   :newbie-p
   :description))

(defpackage :knowledge-transfer
  (:use :alexandria :kt.base :kt.utils :reader :py4cl2 :cl-who)
  (:shadowing-import-from :ps
                          "@" "CHAIN"))

(in-package :cl-user)




