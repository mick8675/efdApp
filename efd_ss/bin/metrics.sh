#!/bin/sh

umask 027

EFD_HOME=/h/efd_ss

source $EFD_HOME/bin/common_jars.sh

PID_FILE=$SITE_DIR/pids/metrics.pid
NAME="Metrics"

JAVA_OPTS="-Dlog4j1.compatibility=true -Defd.home=$EFD_HOME -Dsite.directory=$SITE_DIR -Dlogging.name=metrics -Djava.util.logging.config.file=$EFD_HOME/conf/logging.properties"
JAVA_MAIN=com.solers.delivery.reports.metrics.StartServer

OS=`uname`

start() {
    echo Enter Master Password:
    stty -echo 
    read PASSWD
    export PASSWD
    stty echo
   
    VERIFY_OUTPUT=`$EFD_HOME/bin/create_pwd_file.sh check $PASSWD`
    export VERIFY_OUTPUT
    OUTPUT=`perl -e 'if($ENV{"VERIFY_OUTPUT"} =~ /Password Verified/) {print "Password Verified"}'`
    if [ "$OUTPUT" != "Password Verified" ] ; 
    then
        echo "Master Password is Incorrect"
        exit;
    fi
    
    echo $PASSWD | su efd -c "$EFD_HOME/bin/metrics.sh doStart"
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

doStart() {
    echo "Starting $NAME"
    cd $EFD_HOME
    read PASSWD
    if [ "$OS" = "Linux" ]; then
        echo -ne "$PASSWD\\n$PASSWD\\n" | nohup $JAVA_HOME/bin/java $JAVA_OPTS -classpath $CLASSPATH $JAVA_MAIN 1>$SITE_DIR/logs/metrics.out 2>$SITE_DIR/logs/metrics.err &
    else
        echo "$PASSWD\n$PASSWD" | nohup $JAVA_HOME/bin/java $JAVA_OPTS -classpath $CLASSPATH $JAVA_MAIN 1>$SITE_DIR/logs/metrics.out 2>$SITE_DIR/logs/metrics.err &
    fi
    echo $! > $PID_FILE
}

if [ "$1" = "start" ]
then
    start
elif [ "$1" = "stop" ]
then
    stop
elif [ "$1" = "doStart" ]
then
    doStart
elif [ "$1" = "restart" ]
then
    stop
    start
else
    echo "Correct command line arguments are <start | stop | restart >"
fi
