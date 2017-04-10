{:user {:dependencies [;[cljfmt "0.5.6"]
                       [jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]
                       [slamhound "1.5.5"]
                       [pjstadig/humane-test-output "0.8.1"]
                       [com.cemerick/pomegranate "0.3.1"]]
        :plugins [[cider/cider-nrepl "0.14.0"]
                  [jonase/eastwood "0.2.3"]
                  [com.jakemccrary/lein-test-refresh "0.19.0"]]
                  ; [lein-auto "0.1.2"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]}}
