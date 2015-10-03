#!/bin/bash

. ~/.bash_aliases

alias | awk -F'[ =]' '{print $2}'
