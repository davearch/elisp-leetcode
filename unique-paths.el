;;; unique-paths.el --- Leetcode #62 -*- lexical-binding: t -*-

;;; Commentary:
;; There's a robot that is initially located at the top-left corner of the grid.
;; The robot can only move right and down.
;; Given two integers m and n, return the number of possible unique paths that
;; the robot can take to reach the bottom-right corner.

;;; Code:
(load-file "./test-utils.el")
(require 'cl-lib)

(defun make-2d-array (m n &optional initial-elem)
  "Create a 2d array with M rows and N columns filled with INITIAL-ELEM."
  (let* ((new-array (make-vector m nil))
	 (initial-elem (if initial-elem
			   initial-elem
			 nil)))
    (dotimes (i m)
      (setf (aref new-array i) (make-vector n initial-elem)))
    new-array))

;; Recurrence relation is unique-paths(i) = dp[i - 1][j] + dp[i][j - 1].
(defun unique-paths (m n)
  "Find all unique paths from a grid with M rows and N columns."
  (let ((dp (make-2d-array m n 1)))
    (cl-loop for i from 1 below m do
	     (let ((row (aref dp i))
		   (prev-row (aref dp (1- i))))
	       (cl-loop for j from 1 below n do
			(setf (aref row j)
			      (+ (aref prev-row j)
				 (aref row (1- j)))))))
    (aref (aref dp (1- m)) (1- n))))


(assert-equal "m=3,n=7" 28 (unique-paths 3 7))

;;; unique-paths.el ends here
