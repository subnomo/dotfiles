#!/usr/bin/env python

import os
import sys
import subprocess
import glob
from neovim import attach

# Switch colors in running terminals
pts = os.listdir('/dev/pts/')
for each_pts in pts:
    if each_pts.isdigit():
        subprocess.call('echo "`switch.sh {0}`" > /dev/pts/{1}'
                        .format(sys.argv[1], each_pts), shell=True)

# Switch colors in running neovims
nvim_instances = glob.glob("/tmp/nvim*")
for instance in nvim_instances:
    nvim = attach('socket', path=instance+'/0')
    nvim.command('set background=' + sys.argv[1])
