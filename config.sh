#!/bin/bash

[[ -z $MYDIR ]] && MYDIR=$PWD/`dirname $BASH_SOURCE[0]`

# Fix various paths to get chef-solo working
export PATH=$PATH:/opt/omni/lib/ruby/gems/1.8/gems/chef-0.10.4/bin
export GEM_PATH=/opt/omni/lib/ruby/gems/1.8
export GEM_HOME=/opt/omni/lib/ruby/gems/1.8

INTERVAL=1800
SPLAY=120 # Random interval to inititally sleep to stagger chef runs
LOGFILE=/var/log/chef/solo.log
NODENAME=$(hostname)

# Use a custom wrapper for ssh with git
export GIT_SSH=$MYDIR/scripts/git-ssh-wrapper.sh
