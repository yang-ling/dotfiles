#!/usr/bin/env python2
# -*- coding: utf-8 -*-

from subprocess import check_output

netease_names = {"&dcVr0mWHTvZZOQ-": "病毒文件夹",
                 "&g0l6P3ux-": "草稿箱",
                 "&g0l6Pw-": "unknown1",
                 "&i6KWBZCuTvY-": "订阅邮件",
                 "&V4NXPpCuTvY-": "垃圾邮件",
                 "&XfJSIJZk-": "已删除",
                 "&XfJT0ZAB-": "已发送",
                 "&XfJT0ZABkK5O9g-": "unknown2",
                 "&Xn9USpCuTvY-": "广告邮件"
                 }


def trans_yanglingit163(foldername):
    return netease_names.get(foldername, foldername)


def get_pass(filename):
    command_content = "gpg -dq ~/.config/offlineimap/{0}.asc".format(filename)
    return check_output(command_content, shell=True).strip("\n")
