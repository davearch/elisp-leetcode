;;; fibonacci.el --- Leetcode #509 -*- lexical-binding: t -*-

;;; Commentary:

;; The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,

;; F(0) = 0, F(1) = 1
;; F(n) = F(n - 1) + F(n - 2), for n > 1.

;; Given n, calculate F(n).

;;; Code:

(defun fibonacci (n)
  "Calculate the Nth fibonacci number."
  (if (<= n 1) n
    (let ((fib-list (list 1 0))
	  (count 2))
      (while (<= count n)
	(push (+ (nth 0 fib-list)
		 (nth 1 fib-list))
	      fib-list)
	(setq count (1+ count)))
      (car fib-list))))

(defun assert-equal (label expected actual)
  "Asserts that the ACTUAL result of LABEL equals EXPECTED."
  (if (not (equal expected actual))
      (message "FAIL %s: expected %s, got %s" label expected actual)
    (message "PASS %s" label)))

(assert-equal "n=2" 1 (fibonacci 2))
(assert-equal "n=3" 2 (fibonacci 3))
(assert-equal "n=4" 3 (fibonacci 4))
(assert-equal "n=30" 832040 (fibonacci 30))

;;; fibonacci.el ends here.
