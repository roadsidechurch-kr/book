#!/bin/bash
gitbook install pages;
sleep 5 && open "http://localhost:4000/" &
while true; do
    gitbook serve pages;
    gitbook install pages;
done
