//
//  Header.h
//  LeftMenuDemo
//
//  Created by shenzhenshihua on 2018/9/28.
//  Copyright © 2018年 shenzhenshihua. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define Screen_Frame     [[UIScreen mainScreen] bounds]
#define Screen_Width     [[UIScreen mainScreen] bounds].size.width
#define Screen_Height    [[UIScreen mainScreen] bounds].size.height
#define KeyWindow [[[UIApplication sharedApplication] delegate] window]
#define MaginWidth 300.0f
#define LeftViewAlpha 0.5f
#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#endif /* Header_h */
