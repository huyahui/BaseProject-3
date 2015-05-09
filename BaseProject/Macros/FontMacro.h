//
//  FontMacro.h
//  BaseProject
//
//  Created by HeQingshan－Air on 15/2/8.
//  Copyright (c) 2015年 HQS. All rights reserved.
//

#ifndef BaseProject_FontMacro_h
#define BaseProject_FontMacro_h

//黑体
#define BackFontName @"SimHei"
//华文细黑
#define HuaWenXiHeiFontName @"STHeiti Light"

//通用系统字体
#define K_Font_10   [UIFont systemFontOfSize:10.0]
#define K_Font_11   [UIFont systemFontOfSize:11.0]
#define K_Font_12   [UIFont systemFontOfSize:12.0]
#define K_Font_13   [UIFont systemFontOfSize:13.0]
#define K_Font_14   [UIFont systemFontOfSize:14.0]
#define K_Font_15   [UIFont systemFontOfSize:15.0]
#define K_Font_16   [UIFont systemFontOfSize:16.0]
#define K_Font_17   [UIFont systemFontOfSize:17.0]
#define K_Font_18   [UIFont systemFontOfSize:18.0]
#define K_Font_24   [UIFont systemFontOfSize:24.0]

//上导航字体 ——黑体 ——34点
#define Navigation_Font [UIFont fontWithName:BackFontName size:34.0]

//下导航字体——黑体——22点
#define Tabbar_Font [UIFont fontWithName:BackFontName size:22.0]

//个人姓名 ——黑体 ——30点
#define Name_Font [UIFont fontWithName:BackFontName size:30.0]

//输入的文字及正文（各种白色条框内文字）——华文细黑——30点
#define Text_Font [UIFont fontWithName:HuaWenXiHeiFontName size:30.0]

//副标题及输入框引导字体（各种灰色字体）——华文细黑——26点
#define Subtitle_Font [UIFont fontWithName:HuaWenXiHeiFontName size:26.0]

//时间字体——黑体——26点
#define Time_Font [UIFont fontWithName:BackFontName size:26.0]

#endif
