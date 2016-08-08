;;;; cl-vcr.asd

(asdf:defsystem #:cl-vcr
  :description "Record your test suite's HTTP interactions and replay them during test runs"
  :author "Raimon Grau <raimonster@gmail.com>"
  :license "MIT"
  :depends-on (:cl-store
	       :drakma
	       :fare-memoization)
  :serial t
  :components ((:file "package")
               (:file "cl-vcr"))
  :in-order-to ((test-op (test-op cl-vcr-test))))

(asdf:defsystem #:cl-vcr-test
  :description "Test the cl-vcr library"
  :depends-on (:cl-vcr
               :prove)
  :defsystem-depends-on (:prove-asdf)
  :components ((:test-file "tests"))
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run) :prove) c)))
