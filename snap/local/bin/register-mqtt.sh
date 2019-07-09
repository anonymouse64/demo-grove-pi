#!/bin/bash -e

# run in loop trying to register until successful
until "$SNAP/register_mqtt" localhost; do
    sleep 5
done
