#!/bin/sh

EFD_HOME=/h/efd_ss

source $EFD_HOME/bin/common_jars.sh

JAVA_ARGS=""

$JAVA_HOME/bin/java $JAVA_ARGS -cp $CLASSPATH com.solers.delivery.tools.security.KeyStoreCreator
