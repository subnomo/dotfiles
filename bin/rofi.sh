#!/bin/sh

rofi -run-list-command ". aliases.sh" -run-command "/bin/bash -i -c '{cmd}'" -show run -font "terminus 8"
