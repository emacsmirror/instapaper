;; instapaper.el - add URLs to instapaper from emacs
;; Copyright (C) 2011 Jason F. McBrayer

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(require 'url)

;; Adding URLs to an Instapaper account

;; URL: https://www.instapaper.com/api/add

;; Parameters:

;;     username and password (Or you can pass the username and password via HTTP Basic Auth.)
;;     url
;;     title — optional, plain text, no HTML, UTF-8. If omitted or empty, Instapaper will crawl the URL to detect a title.
;;     selection — optional, plain text, no HTML, UTF-8. Will show up as the description under an item in the interface. Some clients use this to describe where it came from, such as the text of the source Twitter post when sending a link from a Twitter client.
;;     redirect=close — optional. Specifies that, instead of returning the status code, the resulting page should show an HTML “Saved!” notification that attempts to close its own window with Javascript after a short delay. This is useful if you’re sending people directly to /api/add URLs from a web application.
;;     jsonp — optional. See JSONP.

(defvar instapaper-api-base "https://www.instapaper.com/api/"
  "Base URL for all instapaper API functions")
(defvar instapaper-auth-url (concat instapaper-api-base "authenticate")
  "URL for method for validating an instapaper username and password")
(defvar instapaper-add-url (concat instapaper-api-base "add")
  "URL for method for adding a URL to instapaper")

(defcustom instapaper-username ""
  "Username or email address to use for instapaper authentication"
  :type 'string
  :group 'instapaper)

(defcustom instapaper-password ""
  "Password (if any) to use for instapaper authentication"
  :type 'string
  :group 'instapaper)


(defun instapaper-add (url)
  "Add url to instapaper"
  (interactive "sURL: ")
  (url-retrieve instapaper-add-url 'instapaper-add-callback '(url)))

(defun instapaper-add-callback (status url &optional title selection)
  "Callback for url-retrieve to add a URL to instapaper.")
