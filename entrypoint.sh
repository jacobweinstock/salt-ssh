#!/bin/sh

set -e 

salt-call --local state.apply git
/bin/sh