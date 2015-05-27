(require 'curl)

(defun get-xml (url)
  "This is kind of a shitty way of getting XML. But I am putting
minimal effort into this."
  (cdr (curl/http-recv 'GET url)))

(defun parse-xml (xml)
  "Given an XML, parse it and return a xml list."
  (with-temp-buffer
    (insert xml)
    (xml-parse-region (point-min) (point-max))))

(defun make-request (url &rest keys)
  (let* ((xml (get-xml url))
         (root (car (parse-xml xml)))
         (get (lambda (node &rest names)
                (if names
                    (apply get
                           (first (xml-get-children node (car names)))
                           (cdr names))
                  (first (last node))))))
    (apply get root keys)))

(defun cenx-release-url (project-name)
  (let* ((partial-cenx-release-url
          "http://nexus.cenx.localnet:8081/nexus/content/repositories/releases/cenx/%s/maven-metadata.xml"))
    (format partial-cenx-release-url project-name)))

(defun cenx-release-version (project-name &optional url)
  (let* ((cenx-release-url (or url (cenx-release-url project-name))))
    (message "Latest Cenx Release Version for '%s' is: %s"
             project-name
             (make-request cenx-release-url 'versioning 'release))))
