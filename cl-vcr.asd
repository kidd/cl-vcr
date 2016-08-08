;;;; cl-vcr.asd

(asdf:defsystem #:cl-vcr
  :description "Record your test suite's HTTP interactions and replay them during test runs"
  :author "Raimon Grau <raimonster@gmail.com>"
  :license "MIT"
  :serial t
  :components ((:file "package")
               (:file "cl-vcr")))

