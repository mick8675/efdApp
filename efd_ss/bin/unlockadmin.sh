#!/bin/sh

EFD_HOME=/h/efd_ss

source $EFD_HOME/bin/common_jars.sh

PORT_FILE=$SITE_DIR/database/port
SEC_DIR=$SITE_DIR/conf/security

user=`id | cut -f2 -d'(' | cut -f1 -d')'`

if [ $user != "root" ]
then
    echo "You must be the root user." >&2
    exit 1
fi

if [ $# = 0 ]
then
    echo "Usage: ./unlockadmin.sh <admin username>"
    exit 1
fi


if [ -s "$PORT_FILE" ] 
then
    
    PORT=`cat $PORT_FILE`
    
    if [ -n "$PORT" ]
    then
        $JAVA_HOME/bin/java -cp $CLASSPATH com.solers.delivery.tools.UnlockAdminAccount $SEC_DIR $PORT $1
    else
        echo The port could not be read from $PORT_FILE
    fi
    
else
    echo The database is not running
fi
