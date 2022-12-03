;;;; Day 1

(defparameter *input-file* "input.txt")

(defparameter *totals* nil)

(defparameter *current-total* 0)

(let ((in (open *input-file*)))
  (loop for line = (read-line in nil)
        while line do
        (if (string= line "")
          ;; newline
          (progn
            (setf *totals* (cons *current-total* *totals*))
            (setf *current-total* 0))
          ;; value
          (setf *current-total* (+ *current-total* (parse-integer line))))))

;; Part 1
(format t "~a~%" (apply 'max *totals*))

;; Part 2
(format t "~a~%" (apply (function +) (subseq (sort *totals* '>) 0 3)))
