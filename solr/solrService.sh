#!/bin/sh -e
 
# Starts, stops, and restarts solr
# chkconfig: 35 92 08
# description: Starts and stops Apache Solr
 
# FixMe: [correctness] Don't hard-code this
SOLR_DIR="/afs/cs.stanford.edu/u/bipins/scratch1/csmart/csmart_site/solr"
JAVA_OPTIONS="-DSTOP.PORT=8079 -DSTOP.KEY=stopkey -jar start.jar"
LOG_FILE="/var/log/solr.log"
JAVA="/usr/bin/java"
 
case $1 in
    start)
        echo "Starting Solr"
        cd $SOLR_DIR
        /usr/local/sbin/daemonize -v -e $LOG_FILE -o $LOG_FILE -c $SOLR_DIR $SOLR_DIR/scripts/run_solr.sh
        ;;
    stop)
        echo "Stopping Solr"
        cd $SOLR_DIR
        $JAVA $JAVA_OPTIONS --stop
        ;;
    restart)
        $0 stop
        sleep 1
        $0 start
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}" >&2
        exit 1
        ;;
esac
