#!/usr/bin/env python3

from time import sleep
from subprocess import run, Popen

slop_cmd = ['slop', '-t', '0', '-b', '2', '-c', '1,1,1,1', '-f',
            '%w %h %x %y', '--nokeyboard']

rec = run(slop_cmd, capture_output=True)

rec = rec.stdout.decode('utf-8')
w, h, x, y = tuple(rec.split(' '))

def get_window():
    win = run(['xdotool', 'getactivewindow'], capture_output=True)
    return win.stdout.decode('utf-8')

if int(w) > 1:
    float_cmd = ['bspc', 'rule', '-a', '*', '--one-shot', 'state=floating',
                 'rectangle={}x{}+0+0'.format(w, h)]

    run(float_cmd)

    win = spawn_win = get_window()
    Popen(['kitty'])

    while win == spawn_win:
        win = get_window()

        #sleep(0.01)  # Reduce CPU usage

    run(['xdotool', 'windowmove', win, x, y])
