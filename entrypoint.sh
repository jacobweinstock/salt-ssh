#!/bin/sh

set -e 

/usr/bin/salt-call --retcode-passthrough --local state.apply git
/usr/bin/salt-call --retcode-passthrough --local state.apply git.second
/bin/sh