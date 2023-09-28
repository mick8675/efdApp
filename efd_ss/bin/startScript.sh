#!/bin/sh

umask 027

EFD_HOME=/h/efd_ss

source $EFD_HOME/bin/common_jars.sh

PID_FILE=$SITE_DIR/pids/script.pid
NAME="Scripting Engine"
JAVA_MAIN=com.solers.delivery.scripting.StartScript
APP_OPTION=""

JAVA_OPTS="-javaagent:$ASPECT_JWEAVER -Xms256M -Xmx1024M -XX:+UseConcMarkSweepGC -XX:CompileCommandFile=$CONF/.hotspot_compiler"
JAVA_OPTS=$JAVA_OPTS" -Defd.home=$EFD_HOME -Dsite.directory=$SITE_DIR -Dlog4j.configuration=scripting-engine-log4j.properties"
JAVA_OPTS=$JAVA_OPTS" -Dlog4j1.compatibility=true -Djava.util.logging.config.file=$EFD_HOME/conf/logging.properties -Djava.security.manager"
JAVA_OPTS=$JAVA_OPTS" -Djava.security.policy=$CONF/efd.security.policy -Dlogging.name=scripting"
OS=`uname`

start() {
    su efd -c "$EFD_HOME/bin/startScript.sh doStart"
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
        echo -ne "$PASSWD\\n$PASSWD\\n" | nohup $JAVA_HOME/bin/java $JAVA_OPTS -classpath $CLASSPATH $JAVA_MAIN $APP_OPTION 1>$SITE_DIR/logs/startScript.out 2>$SITE_DIR/logs/startScript.err &
    else
        echo "$PASSWD\n$PASSWD" | nohup $JAVA_HOME/bin/java $JAVA_OPTS -classpath $CLASSPATH $JAVA_MAIN $APP_OPTION 1>$SITE_DIR/logs/startScript.out 2>$SITE_DIR/logs/startScript.err &
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
