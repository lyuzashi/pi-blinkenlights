#!/usr/bin/env bash

CONF_FILE=fcserver.json
REM_CONF=fcserver-$HOSTNAME.json
MEM_CONF=/mnt/memory/fadecandy/
LOC_CONF=/usr/local/bin/config/
FADECANDY_SERIAL=$(lsusb -d 1d50:607a -v | sed -En 's/\s+iSerial\s+.\s+([A-Z0-9]+)/\1/p')

rsync -avu $MEM_CONF $LOC_CONF
if [ -f $LOC_CONF$REM_CONF ] ; then
  sed -i "s/SERIAL/$FADECANDY_SERIAL/" $LOC_CONF$REM_CONF 2>/dev/null
  DIFF=$(diff $LOC_CONF$REM_CONF $LOC_CONF$CONF_FILE) 
  if [ "$DIFF" != "" ] 
  then
    mv $LOC_CONF$REM_CONF $LOC_CONF$CONF_FILE 2>/dev/null
  fi
fi