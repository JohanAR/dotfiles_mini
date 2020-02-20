#!/bin/bash

INPIPE=$1
OUTPIPE=$2
RCFILE=$3

set --

if [ ! -p $INPIPE -o ! -p $OUTPIPE ]; then
  echo "Args not pipes"
  exit 1
fi

trap "echo clean up; rm -f $INPIPE $OUTPIPE" EXIT

export TOP_PID=$$

if [ -f $RCFILE ]; then
  source $RCFILE
fi

function check_reporoot {
  CURRENT_REPOROOT=$(git rev-parse --show-toplevel 2> /dev/null)
  # Check if REPOROOT has changed
  if [ "$CURRENT_REPOROOT" != "$REPOROOT" ] &&
     [ -n "$CURRENT_REPOROOT" ] &&
     [ -f "$CURRENT_REPOROOT/utils/kp5_setup" ] ; then
    echo -e "\033[31mWARNING:\033[0m \$REPOROOT is \033[1m${REPOROOT:-unset}\033[0m but you are now in \033[1m$CURRENT_REPOROOT\033[0m"
    echo "> If the current command fails, run 'bashrun_cleanup' and retry"
  fi
  # Don't prevent execution of the command
  return 0
}

while true; do
  echo "Bash runner ($TOP_PID) ready"
  read -r -a cmd <$INPIPE
  {
    echo "** ${cmd[@]} **"
    case "${cmd[0]}" in
      d) date ;;
      r) cd ${cmd[1]} &&
         check_reporoot &&
         eval "${cmd[@]:2}" ;;
      q) echo "bye"
         kill -s EXIT $TOP_PID ;;
      *) echo "What?" ;;
    esac
  } 2>&1 1>$OUTPIPE
done

