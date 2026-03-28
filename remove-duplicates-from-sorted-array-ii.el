;;; remove-duplicates-from-sorted-array-ii.el --- Leetcode #80 -*- lexical-binding: t -*-

;;; Commentary:

;; Given an integer array nums sorted in non-decreasing order, remove some
;; duplicates in-place such that each unique element appears at most twice.
;; The relative order of the elements should be kept the same.
;; Return k, the count of elements remaining, with the first k positions
;; of nums holding the final result.

;;; Code:

(defun remove-duplicates-ii (nums)
  "Remove duplicates from sorted vector NUMS in-place, allowing at most two of each.
Return the number of elements k in the result."
  (let ((p1 1)
	(p2 1)
	(count 1))
    (while (< p1 (length nums))
      (cond
       ((and (= (aref nums p1) (aref nums (1- p1)))
	     (> (setq count (1+ count)) 2))
	(setq p1 (1+ p1)))
       (t
	(unless (= (aref nums p1) (aref nums (1- p1)))
	  (setq count 1))
	(aset nums p2 (aref nums p1))
	(setq p1 (1+ p1))
	(setq p2 (1+ p2)))))))

(defun assert-equal (label expected actual)
  "Asserts that the ACTUAL result of LABEL equals EXPECTED."
  (if (not (equal expected actual))
      (message "FAIL %s: expected %s, got %s" label expected actual)
    (message "PASS %s" label)))

(defun assert-remove-duplicates-ii (label input expected-k expected-nums)
  "Run remove-duplicates-ii on INPUT and check both k and mutated contents."
  (let* ((nums (vconcat input))
	 (k (remove-duplicates-ii nums)))
    (assert-equal (format "%s: k" label) expected-k k)
    (dotimes (i expected-k)
      (assert-equal (format "%s: nums[%d]" label i)
		    (aref expected-nums i)
		    (aref nums i)))))

;; Example 1: [1,1,1,2,2,3] → k=5, [1,1,2,2,3]
(assert-remove-duplicates-ii "example 1"
			     [1 1 1 2 2 3]
			     5 [1 1 2 2 3])

;; Example 2: [0,0,1,1,1,1,2,3,3] → k=7, [0,0,1,1,2,3,3]
(assert-remove-duplicates-ii "example 2"
			     [0 0 1 1 1 1 2 3 3]
			     7 [0 0 1 1 2 3 3])

;; Edge: single element
(assert-remove-duplicates-ii "single element"
			     [1]
			     1 [1])

;; Edge: two same elements (both kept)
(assert-remove-duplicates-ii "two same"
			     [5 5]
			     2 [5 5])

;; Edge: three same elements (only two kept)
(assert-remove-duplicates-ii "three same"
			     [5 5 5]
			     2 [5 5])

;; Edge: no duplicates
(assert-remove-duplicates-ii "no duplicates"
			     [1 2 3 4 5]
			     5 [1 2 3 4 5])

;; Edge: all same
(assert-remove-duplicates-ii "all same"
			     [7 7 7 7 7]
			     2 [7 7])

;; Edge: each appears exactly twice
(assert-remove-duplicates-ii "all pairs"
			     [1 1 2 2 3 3]
			     6 [1 1 2 2 3 3])

;; Edge: negative numbers
(assert-remove-duplicates-ii "negatives"
			     [-3 -3 -3 -1 0 0 2]
			     6 [-3 -3 -1 0 0 2])

;;; remove-duplicates-from-sorted-array-ii.el ends here.
