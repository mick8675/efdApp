#!/bin/sh

EFD_HOME=/h/efd_ss

source $EFD_HOME/bin/common_jars.sh

PWD_FILE=$SITE_DIR/conf/security/master_pwd.properties
OPTION=$1
PASSWD=$2

JAVA_OPTS=""

user=`id | cut -f2 -d'(' | cut -f1 -d')'`

if [ $user != "root" ]
then
    echo "You must be the superuser to run the EFD create password script" >&2
    exit 1
fi

if [ "$1" = "create" ] ;
then
	echo "Creating Password File"
	$JAVA_HOME/bin/java -cp $CLASSPATH com.solers.delivery.install.PasswordProviderConsole $PWD_FILE $OPTION
	chown efd $PWD_FILE
	chmod 600 $PWD_FILE
elif [ "$1" = "check" ] ;
then
	stty -echo 2>&1
    $JAVA_HOME/bin/java $JAVA_OPTS -cp $CLASSPATH com.solers.delivery.install.PasswordProviderConsole $PWD_FILE $OPTION $PASSWD
    stty echo 2>&1
else
	echo "Please enter a correct command [ create | check ]"
fi
