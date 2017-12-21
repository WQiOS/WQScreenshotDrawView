//
//  XHSScreenshotFingerDrawLineModel.h
//  XinHuaShe
//
//  Created by 王强 on 2017/12/21.
//  Copyright © 2017年 xinhuanmm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XHSScreenshotFingerDrawLineModel : NSObject

/** 线条所包含的所有点 */
@property (nonatomic,strong)NSMutableArray <__kindof NSValue *>*linePoints;
/** 线条的颜色 */
@property (nonatomic,strong)UIColor *lineColor;
/** 线条的粗细 */
@property (nonatomic)float lineWidth;


@end
