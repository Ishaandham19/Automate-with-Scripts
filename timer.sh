#!/bin/bash
# The script is a timer that takes in an argument $1 in minutes
# and sounds an alarm at the end of this time, while displaying the passing time
# in HOURS:MINS:SECONDS Format

TIME_LIMIT=$(expr $1 "*" 60);
echo "Starting Timer for $1 minute(s)"; 

TEMP=$SECONDS;
while [[ "$SECONDS" -lt "$TIME_LIMIT" ]]; do
	if [[ "$SECONDS" -ne "$TEMP" ]]; then
		HOURS=$(expr $SECONDS "/" 3600);
		MINS=$(expr $(expr $SECONDS "%" 3600) "/" 60);
		echo -ne "$HOURS:$MINS:$(expr $SECONDS "%" 60)\r";
		TEMP=$SECONDS;
	fi
done;

echo -ne '\a';
echo "TIMER IS DONE!"

exit 0;
