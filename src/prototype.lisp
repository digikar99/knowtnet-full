

(in-package :knowledge-transfer)
(named-readtables:in-readtable getv-chained)

;; ================================ DISCUSSION =================================

;;; Front page:
;;;   - a browse section as main screen, and register/login buttons in 
;;;     one corner, if not logged in
;;;   - if logged in, then, show the username, and logout buttons
;;;   - goes to register page, when clicked
;;;   - stays on the same page if log in fails
;;;   - refreshes if log in is successful
;;; No separate login page
;;; Signup page:
;;;   - stays on the same page, in case of errors
;;;   - first goes to signup server-page; then goes to front-page in case of no-errors
;;;   - contains username, password, theme choices, email, real name
;;;   - issues a POST request to "/" (front-page)
;;; (create-user)
;;;   - fills in defstruct format (see below)
;;; Sharelink page:
;;;   - separate page for sharing link is more ergonomic
;;;   - first goes to sharelink-server page
;;;   - then redirects to front-page on success
;;; Users get to sharelinks, only once they cover 80% of the links in that theme
;;; Users get to create themes, only once they have covered "enough" links in
;;;   "enough" of the themes
;;; Users can upvote/downvote/mark-as-known/share-to-other-social-media
;;;   /suggest-changes(?)

;;; Data:
;;; Users
;;; Links
;;; Themes

;; ============================== SUPPORT PARTS ================================






(defun get-theme-list (post-parameters)
  (mapcar (lambda (elt) (subseq (cdr elt) (length "theme-")))
          (nthcdr 3 post-parameters)))


;; ============================== PERSISTENCE ==================================

(defun make-link-list-of-theme (theme)
  (with-open-file (f (concat +project-root+ "public_url/" theme))
    (iter (for url = (read-line f nil))
          (while url)
          (for i from 0)
          (collect (make-link :url url :id i
                              :title (get-url-title url))))))




(defun save-link-list-of-theme (theme)
  (let ((link-list (getv *theme-links-hash-table* theme)))
    (with-open-file (f (concat +project-root+ "public_links/" theme)
                       :direction :output :if-exists :supersede
                       :if-does-not-exist :create)
      (with-standard-io-syntax
        (iter (for link in link-list) (print link f))))))

(defun load-link-list-of-theme (theme)
  (with-open-file (f (concat +project-root+ "public_links/" theme))
      (with-standard-io-syntax
        (iter (for link = (read f nil))
              (while link)
              (collect link)))))
