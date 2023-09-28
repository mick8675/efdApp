#!/bin/sh

EFD_HOME=/h/efd_ss

source $EFD_HOME/bin/common_jars.sh

PORT=8002

$JAVA_HOME/bin/java -cp $CLASSPATH -Djava.util.logging.config.file=$EFD_HOME/conf/logging.properties com.solers.delivery.tools.LuceneExporter $SITE_DIR $PORT "$1"
