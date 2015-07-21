#!/usr/bin/env python
# -*- coding: utf-8 -*-

from i3pystatus import Status

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
    format="%a %F %R",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
    format="{temp:.0f}°C",)

status.register("cpu_usage",)

status.register("mem",
    format="{avail_mem}GB",
    divisor=1073741824,
    )

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
#status.register("battery",
    #format="{status}/{consumption:.2f}W {percentage:.2f}% [{percentage_design:.2f}%] {remaining:%E%hh:%Mm}",
    #alert=True,
    #alert_percentage=5,
    #status={
        #"DIS": "↓",
        #"CHR": "↑",
        #"FULL": "=",
    #},)

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
    #},)

# Displays whether a DHCP client is running
status.register("runwatch",
    name="DHCP",
    path="/var/run/dhclient*.pid",)

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
    interface="eno1",
    hints = {"markup": "pango"},
    format_up = "<span color=\"#00FF00\">{essid}</span> {bytes_recv:6.1f}KiB {bytes_sent:5.1f}KiB",
    format_down = "",
    dynamic_color = True,
    start_color = "#00FF00",
    end_color = "#FF0000",
    color_down = "#FF0000",
    upper_limit = 800.0,
    )

# Note: requires both netifaces and basiciw (for essid and quality)
#status.register("network",
    #interface="wlan0",
    #format_up="{essid} {quality:03.0f}%",)

# Shows disk usage of /
# Format:
# 42/128G [86G]
#status.register("disk",
    #path="/",
    #format="{used}/{total}G [{avail}G]",)

# Shows pulseaudio default sink volume
#
# Note: requires libpulseaudio from PyPI
status.register("alsa",
    format="♪{volume}",
    mixer="PCM",
    card=1,
    )

# Shows mpd status
# Format:
# Cloud connected▶Reroute to Remain
#status.register("mpd",
    #format="{title}{status}{album}",
    #status={
        #"pause": "▷",
        #"play": "▶",
        #"stop": "◾",
    #},)

status.run()
