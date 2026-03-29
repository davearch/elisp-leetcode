;;; test-utils.el --- Shared test helpers -*- lexical-binding: t -*-
;;; Commentary:
;;; Test utils for the Elisp Practice repo.

;;; Code:

(defun assert-equal (label expected actual)
  "Assert that ACTUAL from LABEL equals EXPECTED."
  (if (not (equal expected actual))
      (message "FAIL %s: Got %s but expected %s." label actual expected)
    (message "PASS %s" label)))

;;; test-utils.el ends here.
