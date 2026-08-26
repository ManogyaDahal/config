#!/bin/bash

pgrep redshift > /dev/null && 
  killall redshift || 
    setsid redshift [options] & > /dev/null
