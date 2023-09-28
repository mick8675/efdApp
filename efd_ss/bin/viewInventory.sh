#!/bin/sh

EFD_HOME=/h/efd

source $EFD_HOME/bin/common_jars.sh

user=`id | cut -f2 -d'(' | cut -f1 -d')'`

if [ $user != "root" ]
then
    echo "You must be the superuser to run the Inventory script" >&2
    exit 1
fi

INV_DIR=$SITE_DIR/inventories/open
JAVA_ARGS="-Dlog4j1.compatibility=true -Dlog4j.configuration=log4j.viewer.properties"

#everything beyond first argument is optional.  see usage.
$JAVA_HOME/bin/java $JAVA_ARGS -cp $CLASSPATH com.solers.delivery.tools.inventory.InventoryViewer "$1" $2 $3 $4 $5 $6
