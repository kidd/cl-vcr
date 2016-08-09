;;;; package.lisp

(defpackage #:cl-vcr
  (:use #:cl #:cl-store #:drakma #:fare-memoization)
  (:export :with-vcr))
