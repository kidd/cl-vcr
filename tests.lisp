(in-package :cl-user)

(defpackage :cl-vcr-test
  (:use :cl :prove))

(in-package :cl-vcr-test)

(plan 1)

(ok t)

(finalize)
