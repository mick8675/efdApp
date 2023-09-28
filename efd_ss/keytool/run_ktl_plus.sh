#!/bin/sh
clear

EFD_HOME=/h/efd_ss

export DISPLAY="localhost:0.0"

source $EFD_HOME/bin/common_jars.sh

HOME_JAVA=$JAVA_HOME/bin/java
ARG_MEMORY="-Xms128m -Xmx196m"
PROP_POLICY=-D_rcp_.policy.extended=true
MAIN_JAR=rc15ktl.jar

_CMD_="${HOME_JAVA} ${ARG_MEMORY} ${PROP_POLICY} -jar ${MAIN_JAR}"
echo ${_CMD_}

${_CMD_}
