#!/bin/sh

EFD_HOME=/h/efd_ss

source $EFD_HOME/bin/common_jars.sh

PORT_FILE=$SITE_DIR/database/port
SEC_DIR=$SITE_DIR/conf/security

if [ -s "$PORT_FILE" ] 
then
    
    PORT=`cat $PORT_FILE`
    
    if [ -n "$PORT" ]
    then
        $JAVA_HOME/bin/java -cp $CLASSPATH com.solers.delivery.tools.database.DerbySqlTool $SEC_DIR $PORT
    else
        echo The port could not be read from $PORT_FILE
    fi
    
else
    echo The database is not running
fi
