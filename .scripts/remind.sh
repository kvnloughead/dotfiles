#!/usr/bin/env bash
# Souce - https://opensource.com/article/22/1/linux-desktop-notifications

function remind() {
  local COUNT="$#"
  local COMMAND="$1" # either `list` or `clear`
  local MESSAGE="$1"
  local OP="$2"
  shift 2
  local WHEN="$@" # remaining positional parameters, after first two are shifted

  if [[ $COUNT -eq 0 || "$COMMAND" == "help" || "$COMMAND" == "--help" || "$COMMAND" == "-h" ]]; then
    echo "COMMAND"
    echo "  remind <message> <time>"
    echo "  remind <command>"
    echo
    echo "DESCRIPTION"
    echo "  Displays notification at specified time"
    echo
    echo "EXAMPLES"
    echo '  remind "Hi there" now'
    echo '  remind "Time to wake up" in 5 minutes'
    echo '  remind "Dinner" in 1 hour'
    echo '  remind "Take a break" at noon'
    echo '  remind "Are you ready?" at 13:00'
    echo '  remind list'
    echo '  remind clear'
    echo
    return
  fi
  # check presence of `at` command
  if ! which at >/dev/null; then
    echo "remind: the `at` utility is required, but not installed"
    return
  fi
  # runs single argument commands
  if [[ $COUNT -eq 1 ]]; then
    if [[ "$COMMAND" == "list" ]]; then
      at -l # lists all jobs
    elif [[ "$COMMAND" == "clear" ]]; then
      at -r $(atq | cut -f1) # removes all jobs
    else
      echo "remind: unknown command $COMMAND. Run `remind` without any parameters to see the syntax." 
    fi
    return
  fi
  # determine time of notification
  if [[ "$OP" == "in" ]]; then
    local TIME="now + $WHEN"
  elif [[ "$OP" == "at" ]]; then
    local TIME="$WHEN"
  elif [[ "$OP" == "now" ]]; then
    local TIME="now"
  else
    echo "remind: invalid time operator "$OP""
    return
  fi
  # schedule notification
  echo "notify-send '$MESSAGE' 'Reminder'" | at $TIME 2>/dev/null
  echo "Notification scheduled at $TIME"   
}
