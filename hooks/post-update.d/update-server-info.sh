#!/bin/sh
#
# An example hook script to prepare a packed repository for use over
# dumb transports.

exec git update-server-info
