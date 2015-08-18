#!/usr/bin/env python
# -*- coding: utf-8 -*-

from i3pystatus import Status

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %F %R",)

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# ↓14.22W 56.15% [77.81%] 2h:41m
# And like this if full:
# =14.22W 100.0% [91.21%]
#
# This would also display a desktop notification (via D-Bus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
# If you don't have a desktop notification demon yet, take a look at dunst:
#   http://www.knopwob.org/dunst/
status.register("battery",
    format="{status}/{consumption:.2f}W {percentage:.2f}% {remaining:%E%hh:%Mm}",
    alert=True,
    alert_percentage=5,
    status={
        "DIS": "↓",
        "CHR": "↑",
        "FULL": "=",
    },
    not_present_text = "",
    )

# This would look like this:
# Discharging 6h:51m
#status.register("battery",
    #format="{status} {remaining:%E%hh:%Mm}",
    #alert=True,
    #alert_percentage=5,
    #status={
        #"DIS":  "Discharging",
        #"CHR":  "Charging",
        #"FULL": "Bat full",
    #},
    #not_present_text = "",
    #)

status.register("pidof_watch",
    name="vsftpd",
    color_up = "#FF0000",
    format_down = "",
    label = "VSFTPD",
    )
status.register("runwatch",
    name="SSHD",
    color_up = "#FF0000",
    format_down = "",
    hints = {"separator": False},
    path="/var/run/sshd.pid",
    )

status.register("keyboard_locks",
    caps_off="",
    num_off="",
    scroll_off="",
    )

# Shows the address and up/down state of eth0. If it is up the address is shown in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces
status.register("network",
    interface="wlp2s0",
    hints = {"markup": "pango"},
    format_up = "<span color=\"#00FF00\">{v4}</span> {bytes_recv:6.1f}KiB {bytes_sent:5.1f}KiB",
    format_short_up = "{bytes_recv:6.1f}KiB {bytes_sent:5.1f}KiB",
    format_down = "",
    dynamic_color = True,
    start_color = "#00FF00",
    end_color = "#FF0000",
    color_down = "#FF0000",
    upper_limit = 800.0,
    )

# Note: requires both netifaces and basiciw (for essid and quality)
#status.register("network",
    #interface="wlp2s0",
    #format_up="{essid} {quality:03.0f}%",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="{temp:.0f}°C",)
status.register("cpu_usage_graph",
    optional = True,
    )
status.register("cpu_usage",
    # fa-laptop [&#xf109;]
    format = "\uf109{usage:02}%",
    hints = {"separator": False},
    )
status.register("mem_swap",
    # fa-file-o [&#xf016;]
    format="\uf016{used_swap}GB",
    divisor=1073741824,
    )
status.register("mem_bar",
    optional = True,
    )
status.register("mem",
    # fa-flash (alias) [&#xf0e7;]
    format="\uf0e7{avail_mem}GB",
    hints = {"separator": False},
    divisor=1073741824,
    )

status.run()
