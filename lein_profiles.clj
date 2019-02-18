{:user {:dependencies [;[cljfmt "0.5.6"]
                       [jonase/eastwood "0.2.3" :exclusions [org.clojure/clojure]]
                       [slamhound "1.5.5"]
                       [pjstadig/humane-test-output "0.8.3"]
                       [com.cemerick/pomegranate "0.3.1"]]
        :plugins [[cider/cider-nrepl "0.8.1"]
                  [jonase/eastwood "0.2.3"]
                  [com.jakemccrary/lein-test-refresh "0.23.0"]
                  [lein-auto "0.1.3"]
                  ]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]}
 :repl {:dependencies [[nrepl/nrepl "0.4.4"]]}}
