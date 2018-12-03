#!/bin/sh

cd /app/doge/server

while true
do
  # loop infinitely
  node server.js
  sleep 10
done
