;;; tribonacci.el --- Leetcode #1137 -*- lexical-binding: t -*-

;;; Commentary:

;;; The Tribonacci sequence Tn is defined as follows:
;;; T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n>= 0.
;;; Given n, return the value of Tn.

;;; Code:

(defun tribonacci (n)
  "Calculates the Nth tribonacci number."
  (cond
   ((<= n 1) n)
   ((= n 2) 1)
   (t
    (let ((fib-list (list 1 1 0))
	  (count 3))
      (while (<= count n)
	(push (+ (nth 0 fib-list)
		 (nth 1 fib-list)
		 (nth 2 fib-list))
	      fib-list)
	(setq count (1+ count)))
      (car fib-list)))))


(defun assert-equal (label expected actual)
  "Asserts that EXPECTED from LABEL equals ACTUAL."
  (if (not (equal expected actual))
      (message "FAIL %s: expected %s, got %s" label expected actual)
    (message "PASS %s" label)))

(assert-equal "n=4" 4 (tribonacci 4))
(assert-equal "n=25" 1389537 (tribonacci 25))

;;; tribonacci.el ends here.
