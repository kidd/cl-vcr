;;;; cl-vcr.lisp

(in-package #:cl-vcr)

(defparameter *base-path* #P"/tmp/vcr/")

(defparameter *cache* (make-hash-table :test 'equal))

(defparameter *http-call* 'drakma:http-request)

(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

(defmacro with-vcr (tape &rest body)
  (with-gensyms (path)
   `(let* ((,path (merge-pathnames ,tape *base-path*))
           (*cache* (or (and (probe-file ,path) (restore ,path))
                        (make-hash-table :test 'equal))))
      (memoize *http-call* :table *cache*)
      (prog1
          (progn ,@body)
        (store *cache* ,path)
        (unmemoize *http-call*)))))

(defun testing (n)
  (with-vcr "zcache1"
    (let ((path n))
      (multiple-value-bind (c status)
          (http-request path)
        (format nil "~a~%~a~%" c status)))))

;; (defun main ()
;;   (make-pathname :directory '(:absolute "/tmp/")
;;                  :name "vcr")
;;   (memoize 'fib :table *cache*))

;;; "cl-vcr" goes here. Hacks and glory await!
