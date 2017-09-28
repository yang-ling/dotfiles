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
    critical_limit = 20,
    format = "home: {avail}GB/{total}GB",
    )
status.register("usb",
    hints = {"markup": "pango"},
    )
status.register("mpd",
    format = "{album} - {artist} - {title} {status}",
    )
status.register("pulseaudio",
    )
#client_gmail=thunderbird.Thunderbird(account="yangling1984@gmail.com")
#client_163_1=thunderbird.Thunderbird(account="yuloo911@163.com")
#client_163_2=thunderbird.Thunderbird(account="yanglingit@163.com")
#client_outlook=thunderbird.Thunderbird(account="yanglingit@outlook.com")
#status.register("mail",
        #backends=[client_gmail, client_163_1, client_163_2, client_outlook],
        #hide_if_null=True,
        #email_client="thunderbird",
    #)

status.run()
