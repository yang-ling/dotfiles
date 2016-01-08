#!/usr/bin/env python2
# -*- coding: utf-8 -*-

from subprocess import check_output

netease_names = {"&dcVr0mWHTvZZOQ-": "病毒文件夹",
                 "&g0l6P3ux-": "草稿箱",
                 "&g0l6Pw-": "草稿",
                 "&i6KWBZCuTvY-": "订阅邮件",
                 "&V4NXPpCuTvY-": "垃圾邮件",
                 "&XfJSIJZk-": "已删除",
                 "&XfJT0ZAB-": "已发送",
                 "&XfJT0ZABkK5O9g-": "unknown",
                 "&Xn9USpCuTvY-": "广告邮件"
                 }
gmail_names = {
    "[Gmail]/&XfJSoGYfaAc-": "已加星标",
    "[Gmail]/&XfJT0ZCuTvY-": "已发邮件",
    "[Gmail]/&g0l6Pw-": "草稿",
    "[Gmail]/&V4NXPpCuTvY-": "垃圾邮件",
    "[Gmail]/&YkBnCZCuTvY-": "所有邮件",
    "[Gmail]/&XfJSIJZkkK5O9g-": "已删除邮件",
    "[Gmail]/&kc2JgQ-": "Important",
    "&ZcWITHb4UXM-": "旅行相关",
    "&ZTZjbg-": "收据",
}

qq_names = {"&UXZO1mWHTvZZOQ-/&kK5O9l9SaGM-": "其他文件夹.邮件归档",
            "&UXZO1mWHTvZZOQ-/QQ&kK5O9ouilgU-": "其他文件夹.QQ邮件订阅",
            "&UXZO1mWHTvZZOQ-/Important": "其他文件夹.Important",
            "Deleted Messages": "Deleted",
            "Sent Messages": "Sent",
            }


def get_pass(filename):
    theCommand = "gpg -q --for-your-eyes-only --no-tty -d"
    command_content = "{0} ~/.config/passwords/{1}.asc".format(
        theCommand, filename)
    return check_output(command_content, shell=True).strip("\n")


def trans_yanglingit163_remote(foldername):
    return netease_names.get(foldername, foldername)


def trans_yanglingit163_local(foldername):
    for k, v in netease_names.iteritems():
        if v == foldername:
            return k
    return foldername


def trans_yangling1984gmail_remote(foldername):
    return gmail_names.get(foldername, foldername)


def trans_yangling1984gmail_local(foldername):
    for k, v in gmail_names.iteritems():
        if v == foldername:
            return k
    return foldername


def trans_yanglingitqq_remote(foldername):
    return qq_names.get(foldername, foldername)


def trans_yanglingitqq_local(foldername):
    for k, v in qq_names.iteritems():
        if v == foldername:
            return k
    return foldername
