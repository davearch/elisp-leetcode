;;; remove-duplicates-from-sorted-array.el --- Leetcode #26 -*- lexical-binding: t -*-

;;; Commentary:

;; Given an integer array nums sorted in non-decreasing order, remove the
;; duplicates in-place such that each unique element appears only once.
;; Return the number of unique elements k.  The first k elements of nums
;; should contain the unique values in sorted order.

;;; Code:

(defun swap-in-place (arr first second)
  "Swap FIRST with SECOND in vector ARR."
  (let ((tmp (aref first arr)))
    (aset arr first second)
    (aset arr second tmp)))

(defun remove-duplicates (nums)
  "Remove duplicates from sorted vector NUMS in-place.
Return the number of unique elements k."
  (let ((ht (make-hash-table))
	(pointer 0))
    (dotimes (i (length nums) result-var)
      (let ((element (aref nums i)))
	(when (gethash element ht)
	  (unless (equal i 0)
	    (swap-in-place nums i element))
	  (setq pointer (+ 1 pointer))
	  (puthash element t ht)))
      (setq result-var (hash-table-count ht)))))


(defun assert-equal (label expected actual)
  "Asserts that the ACTUAL result of LABEL equals EXPECTED."
  (if (not (equal expected actual))
      (message "FAIL %s: expected %s, got %s" label expected actual)
    (message "PASS %s" label)))

(defun assert-remove-duplicates (label input expected-k expected-nums)
  "Run remove-duplicates on INPUT and check both k and mutated contents."
  (let* ((nums (vconcat input))
	 (k (remove-duplicates nums)))
    (assert-equal (format "%s: k" label) expected-k k)
    (dotimes (i expected-k)
      (assert-equal (format "%s: nums[%d]" label i)
		    (aref expected-nums i)
		    (aref nums i)))))

;; Example 1
(assert-remove-duplicates "basic duplicates"
			  [1 1 2]
			  2 [1 2])

;; Example 2
(assert-remove-duplicates "multiple duplicates"
			  [0 0 1 1 1 2 2 3 3 4]
			  5 [0 1 2 3 4])

;; Edge cases
(assert-remove-duplicates "single element"
			  [1]
			  1 [1])

(assert-remove-duplicates "no duplicates"
			  [1 2 3 4 5]
			  5 [1 2 3 4 5])

(assert-remove-duplicates "all same"
			  [7 7 7 7 7]
			  1 [7])

(assert-remove-duplicates "negative numbers"
			  [-3 -3 -1 0 0 2]
			  4 [-3 -1 0 2])

(assert-remove-duplicates "two elements same"
			  [1 1]
			  1 [1])

(assert-remove-duplicates "two elements different"
			  [1 2]
			  2 [1 2])

;;; remove-duplicates-from-sorted-array.el ends here.
