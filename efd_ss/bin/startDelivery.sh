#!/bin/sh

EFD_HOME=/h/efd_ss

source $EFD_HOME/bin/common_jars.sh

PID_FILE=$SITE_DIR/pids/delivery.pid
NAME="Delivery"

DAEMON_HOME=$EFD_HOME/bin

JSVC_OPTS="-user efd -home $JAVA_HOME -jvm server -pidfile $PID_FILE -keepstdin -outfile $SITE_DIR/logs/delivery.out -errfile $SITE_DIR/logs/delivery.err"
JAVA_OPTS="-javaagent:$EFD_HOME/lib/aspectjweaver-1.9.19.jar -Xms256M -Xmx4096M -XX:+UseConcMarkSweepGC -XX:CompileCommandFile=$CONF/.hotspot_compiler"
DELIVERY_OPTS="-Dlog4j1.compatibility=true -Djava.util.logging.config.file=$EFD_HOME/conf/logging.properties -Dlogging.name=delivery -Djava.io.tmpdir=$SITE_DIR -Defd.home=$EFD_HOME -Dsite.directory=$SITE_DIR -Djava.security.manager -Djava.security.policy=$CONF/efd.security.policy"

umask 027

start() {
    echo "Starting $NAME"
    read PASSWD
    echo "$PASSWD" | $DAEMON_HOME/jsvc $JSVC_OPTS $DELIVERY_OPTS $JAVA_OPTS -classpath $CLASSPATH com.solers.delivery.Start &
}

stop() {
   if [ -f $PID_FILE ]; then
        pid=`cat $PID_FILE`
        if [ -d "/proc/$pid" ]; then
            echo "Stopping $NAME($pid)..."
            kill -INT $pid
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
