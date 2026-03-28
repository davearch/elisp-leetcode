;;; remove-element.el --- Leetcode #27 -*- lexical-binding: t -*-

;;; Commentary:

;; Given an integer vector nums and an integer val, remove all occurrences
;; of val in nums in-place.  The order of elements may change.  Return k,
;; the number of elements not equal to val, with those elements occupying
;; the first k positions of nums.

;;; Code:

(defun swap-in-place (arr i j)
  "Swap I and J in ARR."
  (let ((tmp (aref arr i)))
    (aset arr i (aref arr j))
    (aset arr j tmp)))


(defun remove-element (nums val)
  "Remove all occurrences of VAL from vector NUMS in-place.
Return the number of remaining elements k, with the first k
positions of NUMS containing the non-VAL elements."
  (unless (= 0 (length nums))
    (let ((left 0)
	  (right (- (length nums) 1)))
      (while (<= left right)
	(if (equal (aref nums right) val)
	    (setq right (1- right))
	  (cond
	   ((equal (aref nums left) val)
	    (swap-in-place nums left right)
	    (setq right (1- right)))
	   (t (setq left (1+ left))))))
      left)))


(defun assert-equal (label expected actual)
  "Asserts that the ACTUAL result of LABEL equals EXPECTED."
  (if (not (equal expected actual))
      (message "FAIL %s: expected %s, got %s" label expected actual)
    (message "PASS %s" label)))

(defun assert-remove-element (label input val expected-k expected-nums)
  "Run remove-element on INPUT with VAL and check k and first k elements.
The first k elements are sorted before comparison since order may differ."
  (let* ((nums (vconcat input))
	 (k (remove-element nums val)))
    (assert-equal (format "%s: k" label) expected-k k)
    (when (and k (> k 0))
      (let ((actual (sort (cl-coerce (substring nums 0 k) 'list) #'<))
	    (expect (sort (cl-coerce (vconcat expected-nums) 'list) #'<)))
	(assert-equal (format "%s: elements" label) expect actual)))))

;; Example 1: nums = [3,2,2,3], val = 3 → k = 2, nums = [2,2,_,_]
(assert-remove-element "example 1"
		       [3 2 2 3] 3
		       2 [2 2])

;; Example 2: nums = [0,1,2,2,3,0,4,2], val = 2 → k = 5, nums = [0,1,4,0,3,_,_,_]
(assert-remove-element "example 2"
		       [0 1 2 2 3 0 4 2] 2
		       5 [0 1 4 0 3])

;; Edge: empty array
(assert-remove-element "empty array"
		       [] 1
		       0 [])

;; Edge: no matches
(assert-remove-element "no matches"
		       [1 2 3 4] 5
		       4 [1 2 3 4])

;; Edge: all matches
(assert-remove-element "all matches"
		       [7 7 7] 7
		       0 [])

;; Edge: single element, matches
(assert-remove-element "single match"
		       [1] 1
		       0 [])

;; Edge: single element, no match
(assert-remove-element "single no match"
		       [1] 2
		       1 [1])

;;; remove-element.el ends here.
