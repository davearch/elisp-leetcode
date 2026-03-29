;;; house-robber.el --- Leetcode #198 -*- lexical-binding: t -*-

;;; Commentary:
;; You are a robber planning to rob houses along a street.  You can't rob two houses in a
;; row otherwise the police will be alerted.
;; Given an integer nums representing the amount of money of each house, return the maximum
;; amount of money you can rob tonight without alerting the police.

;;; Code:
(load-file "./test-utils.el")

(defun rob (nums-list)
  "Return the max money you can rob from NUMS-LIST."
  (if (cdr nums-list)
      (let ((a (nth 0 nums-list))
	    (b (max (nth 0 nums-list) (nth 1 nums-list)))
	    (next 0))
	(dolist (curr (nthcdr 2 nums-list))
	  (setq next (max (+ a curr) b)
		a b
		b next))
	b)
    (car nums-list)))


(assert-equal "n=[1]" 1 (rob (list 1)))
(assert-equal "n=[1,2,3,1]" 4 (rob (list 1 2 3 1)))
(assert-equal "n=[2,1,1,2]" 4 (rob (list 2 1 1 2)))

;;; house-robber.el ends here.
