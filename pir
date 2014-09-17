#! /bin/sh 
#
# Author: Eric Vandecasteele, 2014
# http://blog.onlinux.fr
#
# /etc/init.d/pir
#
### BEGIN INIT INFO
# Provides:          pir
# Required-Start:    
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: pir daemon drives the Passive Infra Red Motion Detector
# Description:       The pir daemon sends a http request on any Motion Detection Alarm
### END INIT INFO

# This next line determines what user the script runs as.
# Root generally not recommended but necessary if you are using the Raspberry Pi GPIO from Python.
DAEMON_USER=root

PATH=/bin:/usr/bin:/sbin:/usr/sbin
DAEMON=/usr/local/bin/pir.py

# The process ID of the script when it runs is stored here:
PIDFILE=/var/run/pir.pid

NAME=pir

test -x $DAEMON_OPTS || exit 0

. /lib/lsb/init-functions


do_start()
{
	# Return
	#   0 if daemon has been started
	#   1 if daemon was already running
	#   2 if daemon could not be started

	if pidofproc -p $PIDFILE "$DAEMON" > /dev/null 2>&1 ; then
	        return 1
	fi
}

case "$1" in
  start)
     log_daemon_msg "Starting $NAME"
     do_start
     RET_STATUS=$?
     case "$RET_STATUS" in
	1)
	   log_success_msg
           [ "$VERBOSE" != no ] && [ $RET_STATUS = 1 ] && log_warning_msg "Daemon was already running"
	;;
	*)
     	   start-stop-daemon --start  --background --oknodo --pidfile $PIDFILE --make-pidfile --user $DAEMON_USER --chuid $DAEMON_USER --exec $DAEMON  $DAEMON_OPTS 
           log_end_msg $?
        ;;
     esac
     ;;
  stop)
     log_daemon_msg "Stopping $NAME"
     start-stop-daemon --stop --pidfile $PIDFILE --retry 10
     log_end_msg $?
   ;;
  force-reload|restart)
     $0 stop
     $0 start
   ;;
  status)
     status_of_proc -p $PIDFILE $DAEMON $NAME  && exit 0 || exit $?
   ;;
 *)
   echo "Usage: /etc/init.d/pir {start|stop|restart|force-reload|status}"
   exit 1
  ;;
esac
exit 0
