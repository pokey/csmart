#!/bin/sh -e
 
# Starts, stops, and restarts solr
# chkconfig: 35 92 08
# description: Starts and stops Apache Solr
 
# FixMe: [correctness] Don't hard-code this
SOLR_DIR="/home/pokey/csmart_site/solr"
JAVA_OPTIONS="-DSTOP.PORT=8079 -DSTOP.KEY=stopkey -jar start.jar"
LOG_FILE="/var/log/solr.log"
JAVA="/usr/bin/java"
 
case $1 in
    start)
        echo "Starting Solr"
        cd $SOLR_DIR
        $JAVA $JAVA_OPTIONS 2> $LOG_FILE &
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
