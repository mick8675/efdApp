#!/bin/sh
#STARTUP/SHUTDOWN SCRIPT

EFD_HOME=/h/efd_ss

source $EFD_HOME/bin/common_jars.sh

PID_FILE=$SITE_DIR/pids/web.pid
NAME="WebUI"

JAVA_OPTS="-Dlog4j1.compatibility=true -Defd.home=$EFD_HOME -Dsite.directory=$SITE_DIR -Dlogging.name=webui -Djava.util.logging.config.file=$EFD_HOME/conf/logging.properties"
JAVA_MAIN=com.solers.delivery.StartWeb

OS=`uname`

start() {
    echo "Starting $NAME"
    cd $EFD_HOME
    read PASSWD
    if [ "$OS" = "Linux" ]; then
        echo -ne "$PASSWD\\n$PASSWD\\n" | nohup $JAVA_HOME/bin/java $JAVA_OPTS -classpath $CLASSPATH $JAVA_MAIN 1>$SITE_DIR/logs/webui.out 2>$SITE_DIR/logs/webui.err &
    else
        echo "$PASSWD\n$PASSWD" | nohup $JAVA_HOME/bin/java $JAVA_OPTS -classpath $CLASSPATH $JAVA_MAIN 1>$SITE_DIR/logs/webui.out 2>$SITE_DIR/logs/webui.err &
    fi
    echo $! > $PID_FILE
}

stop() {
   if [ -f $PID_FILE ]; then
        pid=`cat $PID_FILE`
        if [ -d "/proc/$pid" ]; then
            echo "Stopping $NAME($pid)..."
            kill -TERM $pid
            sleep 5
            echo "$NAME($pid) stopped"
        fi
    fi
}

if [ "$1" = "start" ]; then
    if [ -f $PID_FILE ]; then
        pid=`cat $PID_FILE`
        if [ -d "/proc/$pid" ]; then
            echo "$NAME already started"
        else
            start
        fi
    else
        start
    fi
elif [ "$1" = "stop" ]; then
    stop
elif [ "$1" = "restart" ]; then
    stop
    echo "-------------------RESTART---------------------"
    start
else
    echo "Correct command line arguments are <start | stop | restart>"
fi
