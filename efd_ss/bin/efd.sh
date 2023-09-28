#!/bin/sh

umask 027
export umask

EFD_HOME=/h/efd_ss
SITE_DIR=/h/efd_ss/site

user=`id | cut -f2 -d'(' | cut -f1 -d')'`

if [ $user != "root" ]
then
    echo "You must be the superuser to run the EFD setup script" >&2
    exit 1
fi

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
    	
    SCRIPTING_ENGINE_ENABLED=`cat $EFD_HOME/site/conf/efd.properties | grep scripting.engine.enabled`

    if [ "$SCRIPTING_ENGINE_ENABLED" = "scripting.engine.enabled=true" ];
    then
        echo $PASSWD | $EFD_HOME/bin/startScript.sh start
    else
        echo Scripting Engine disabled.  EFD Scripting Service is not started.
    fi
    
    SCRIPTING_ENGINE_ENABLED=

    echo $PASSWD | $EFD_HOME/bin/startDelivery.sh start
    echo $PASSWD | su efd -c "$EFD_HOME/bin/startWeb.sh start"
   
    sleep 2
    cd $SITE_DIR/logs
    chown -R -f efd *
}

stop() {
   $EFD_HOME/bin/startWeb.sh stop
   $EFD_HOME/bin/startDelivery.sh stop
   $EFD_HOME/bin/startScript.sh stop
}

if [ "$1" = "start" ]
then
	echo "Starting EFD"
	start
elif [ "$1" = "stop" ]
then
	echo "Stopping EFD"
	stop
elif [ "$1" = "restart" ]
then
	stop
	echo "-------------------RESTART---------------------"
	start
elif [ "$1" = "listproc" ]
then 
        ps -ef | grep java | grep efd
else
	echo "Correct command line arguments are <start | stop | restart | listproc>"
fi
