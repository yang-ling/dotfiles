# -*- coding:utf-8 -*-
#! /usr/bin/python
import os,sys
from PIL import Image

##这个函数传入三个参数，分别是，原图像，字符画的文件名称，缩放率，还有一个映射表，其中，默认不缩放，映射表是有一个默认值的
def Image2Ascii(imagename,filename,express_rate = 1,pic_string = 'MNOCbhlnioz*:-.'):
    if express_rate < 1:
        print "暂不支持放大的操作"
        return 0
    img = Image.open(imagename).convert('L')
    width,height = img.size
    ##print width,height
    ##print express_rate
    ##print width/express_rate,height/express_rate
    img = img.resize((width/express_rate,height/express_rate))
    width,height = img.size
    ##print width,height
    pix = img.load()
    pic_ascii = ''

    for h in xrange(height):
        for w in xrange(width):
            pic_ascii += pic_string[((int)(pix[w,h]))*(len(pic_string)-1)/255]
        pic_ascii += '\n'


    outfile = open(filename,'w')
    outfile.write(pic_ascii)
    outfile.close()

def main():
    try:
        if "-h" == sys.argv[1]:
            print '''
------------------------------------------------------------------------
                            帮助信息

这个小程序的使用方式：
这样敲命令就好 Image2AscII -f 源图片位置 字符画文件位置 压缩率（可以不写） 字符映射（可以不写）
示例 python Image2AscII -f ~/test.jpg /tmp/test.txt
高级点的用法 python Image2AscII -f ~/test.jpg /tmp/test.txt 2
更高级的用法 python Image2AscII -f ~/test.jpg /tmp/test.txt 2 WUSOCbhlnioz*:-.
因为需要参数的关系，不支持双击执行
-------------------------------------------------------------------------
本程序为Alpha版，不保证稳定性，仅供娱乐用，如果心血来潮，说不定会更新哦～～
Author： 风笳（AproSanae）
Version: 异神奇迹
Date ：2012-09-25 15:52:16
早苗什么的，最喜欢了！Sanae san wa Dai Su Ki!'''
        elif "-f" == sys.argv[1]:
            a = sys.argv[2:]
            if len(a) == 1:
                print '''不支持的操作，Sanae友情提示：请输入Image2AscII -h 以获得帮助~'''
            elif len(a) == 2:
                imagename,filename = a
                Image2Ascii(imagename,filename)
            elif len(a) == 3:
                ##print '喵'
                imagename,filename = a[0:2]
                ##print imagename,filename
                express_rate = int(a[2])
                Image2Ascii(imagename,filename,express_rate)
            elif len(a) == 4:
                imagename,filename = a[0:2]
                express_rate = int(a[2])
                pic_string = a[-1]
                Image2Ascii(imagename,filename,express_rate,pic_string)

        else:
            print '''不支持的操作，Sanae友情提示：请输入Image2AscII -h 以获得帮助'''
    except IndexError:
        print '''不支持的操作，Sanae友情提示：请输入Image2AscII -h 以获得帮助!'''

if __name__ == '__main__':
    main()

