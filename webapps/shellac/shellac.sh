#!/bin/bash
set -e
DJANGO_WSGI_MODULE="sites.shellac.wsgi"
GUNICORN_CONF="/webapps/shellac/gunicorn.conf"
APPLICATION_PATH="/webapps/shellac/.virtualenvs/shellac/bin/gunicorn"
LOGDIR="/webapps/shellac/log/gunicorn"
ERRFILE="/gunicorn_shellac.err"

#if they don't exist, create the log directories
if [ ! -d "$LOGDIR" ]; then
	mkdir -p "$LOGDIR"
fi;

exec $APPLICATION_PATH -c $GUNICORN_CONF $DJANGO_WSGI_MODULE:application 2>>$LOGDIR$ERRFILE
