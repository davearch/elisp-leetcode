;;; min-cost-climbing-stairs.el --- Leetcode #746 -*- lexical-binding: t -*-

;;; Commentary:

;;; You are given an array cost where cost[i] is the cost of the ith step
;;; on a stair case.  Once you pay the cost, you can either climb one or
;;; two steps.
;;; You can either start from one step with index 0, or the step with
;;; index 1.
;;; Return the minimum cost to reach the top of the floor.

;;; Code:
(defun min-cost-climbing-stairs (cost-list)
  "Calculate the minimum cost to reach the end of COST-LIST."
  (let ((a (nth 0 cost-list))
	(b (nth 1 cost-list)))
    (dolist (c (nthcdr 2 cost-list))
      (let ((next (+ c (min a b))))
	(setq a b
	      b next)))
    (min a b)))


(defun assert-equal (label expected actual)
  "Asserts that ACTUAL from LABEL equals EXPECTED."
  (if (not (equal expected actual))
      (message "FAIL %s: Got %s but expected %s." label actual expected)
    (message "PASS %s" label)))

(assert-equal "n=[10,15,20]" 15 (min-cost-climbing-stairs (list 10 15 20)))
(assert-equal "n=[1,100,1,1,1,100,1,1,100,1]" 6
	      (min-cost-climbing-stairs (list 1 100 1 1 1 100 1 1 100 1)))

;;; min-cost-climbing-stairs.el ends here.
