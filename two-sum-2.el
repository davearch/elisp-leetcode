;;; two-sum-2.el --- Summary: -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


(defun two-sum (nums target)
  "O(n^2)."
  (let ((ht (make-hash-table))
	(return-value '()))
    (dotimes (i (length nums))
      (let* ((num (elt nums i))
	     (diff (- target num)))
	(if (not (gethash diff ht))
	    (puthash num i ht)
	  (setq return-value (list (gethash diff ht) i)))))
    return-value))

(defun two-sum-2 (nums target)
  "O(n)."
  (let ((ht (make-hash-table))
	(index 0))
    (dolist (element nums value)
      (let ((diff (- target element)))
	(unless (gethash diff ht)
	  (setq value (list (gethash diff ht) index)))
	(puthash element diff ht)
	(setq index (1+ index))))))

(defun assert-equal (label expected actual)
  "Asserts that the ACTUAL result of LABEL equals EXPECTED."
  (if (not (equal expected actual))
      (message "assertion with label %s failed: %s != %s." label expected actual)
    (message "assertion passed")))

(assert-equal "first one" '(0 1) (two-sum '(2 7 8 3 8) 9))
(assert-equal "answer at end" '(3 4) (two-sum '(1 2 3 7 8) 15))
(assert-equal "negative numbers" '(0 2) (two-sum '(-3 5 4) 1))
(assert-equal "zeros" '(0 1) (two-sum '(0 0) 0))
(assert-equal "large target" '(0 1) (two-sum '(1000000 999999) 1999999))
(assert-equal "duplicate values pick first" '(1 3) (two-sum '(1 3 5 3) 6))

;;; two-sum-2.el ends here.
