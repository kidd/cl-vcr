(asdf:defsystem #:cl-vcr-tests
  :description "Test the cl-vcr library"
  :depends-on (:cl-vcr
               :prove)
  :defsystem-depends-on (:prove-asdf)
  :components ((:test-file "tests"))
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run) :prove) c)))
