//
//  ImageMacro.h
//  BaseProject
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#ifndef BaseProject_ImageMacro_h
#define BaseProject_ImageMacro_h

//----------------------基本图片方法----------------------------

//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]

//----------------------基本图片方法----------------------------


//----------------------项目图片资源----------------------------

#define IMG_Hide_KeyBoard @"arrow_down_cerification_pc"


//----------------------项目图片资源----------------------------



#endif
