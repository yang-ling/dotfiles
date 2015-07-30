#!/usr/bin/env python
# -*- coding: utf-8 -*-

from i3pystatus import Status

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("disk",
    path="/",
    critical_limit = 5,
    format = "root: {avail}GB/{total}GB",
    )
status.register("disk",
    path="/boot",
    critical_limit = 20,
    divisor = 1024 ** 2,
    format = "boot: {avail}MB/{total}MB",
    )
status.register("disk",
    path="/home",
    critical_limit = 50,
    format = "home: {avail}GB/{total}GB",
    )
status.register("usb",
    hints = {"markup": "pango"},
    )
status.register("mpd",)

status.run()
