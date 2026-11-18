#!/bin/bash -e

# MAKE SURE TO CHECK ALL ERRORS BEFORE PUSHING

source .env

# do a basic test
function test() {
    (docker exec -it "${ORG}-${PROJECT}" curl -s localhost | grep "PHP Documentation") > /dev/null
	echo $?
}

declare i=1;
declare DEAD=1
declare alive=$DEAD

while [ ! $alive -eq 0 ] && [ $i -lt 15 ]; do 
	alive=$(test)
	echo Waiting for Container... $i >&2; 
    ((i++)) 
	sleep 1;
done

exit $alive
