#!/bin/sh
killall -9 $1
exec $@
