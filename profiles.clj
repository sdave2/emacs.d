{:user {:jvm-opts ["-XX:-OmitStackTraceInFastThrow"]
        :plugins [[cider/cider-nrepl "0.14.0"]
                  [lein-droid "0.4.4"]
		  [lein-ancient "0.6.10"]]
        :dependencies [[org.clojure/tools.nrepl "0.2.12"]
                       [alembic "0.3.2"]
                       [org.clojure/clojure "1.8.0"]]}
 :android-user {:plugins [[cider/cider-nrepl "0.14.0"]]}}
