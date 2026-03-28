;;; climbing_stairs.el --- Leetcode #70 -*- lexical-binding: t -*-

;;; Commentary:

;; You are climbing a staircase.  It takes n steps to reach the top.
;; Each time you can either climb 1 or 2 steps.  In how many distinct
;; ways can you climb to the top?

;;; Code:

(defun climb-stairs (n)
  "Return the number of distinct ways to climb N stairs."
  (cond ((<= n 1) n)
	(t (let ((stairs (list 2 1))
		 (count 2))
	     (while (< count n)
	       (push (+ (nth 0 stairs)
			(nth 1 stairs))
		     stairs)
	       (setq count (1+ count)))
	     (car stairs)))))


(defun assert-equal (label expected actual)
  "Asserts that the ACTUAL result of LABEL equals EXPECTED."
  (if (not (equal expected actual))
      (message "FAIL %s: expected %s, got %s" label expected actual)
    (message "PASS %s" label)))


(climb-stairs 1)

;; Example 1: n = 2 → 2
(assert-equal "example 1" 2 (climb-stairs 2))
;; Example 2: n = 3 → 3
(assert-equal "example 2" 3 (climb-stairs 3))
;; Edge: n = 1 → 1
(assert-equal "n=1" 1 (climb-stairs 1))
;; n = 4 → 5
(assert-equal "n=4" 5 (climb-stairs 4))
;; n = 5 → 8
(assert-equal "n=5" 8 (climb-stairs 5))
;; Upper bound: n = 45 → 1836311903
(assert-equal "n=45" 1836311903 (climb-stairs 45))

;;; climbing_stairs.el ends here.
