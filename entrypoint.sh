#!/bin/bash
########### SIGTERM handler ############
function _term() {
   echo "Stopping container."
   echo "SIGTERM received, shutting down the server!"
   ${DOMAIN_HOME}/bin/stopWebLogic.sh
}

########### SIGKILL handler ############
function _kill() {
   echo "SIGKILL received, shutting down the server!"
   kill -9 $childPID
}

# Set SIGTERM handler
trap _term SIGTERM

# Set SIGKILL handler
trap _kill SIGKILL

# wait for DB to come up 
echo "Waiting for database to be available..."
while ! nc database 1521 < /dev/null; do sleep 9; done
# sleep for some extra time for db setup
sleep 30

DOMAIN_HOME=/u01/oracle/domains/base_domain 

# Start Admin Server and tail the logs
${DOMAIN_HOME}/startWebLogic.sh &
childPID=$!
wait $childPID


