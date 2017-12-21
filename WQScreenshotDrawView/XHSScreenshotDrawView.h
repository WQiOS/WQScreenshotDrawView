//
//  XHSScreenshotDrawView.h
//  XinHuaShe
//
//  Created by 王强 on 2017/12/20.
//  Copyright © 2017年 xinhuanmm. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XHSScreenshotDrawView;

@interface XHSScreenshotDrawView : UIView

/** 记录所有的涂鸦 */
@property(nonatomic,strong) NSMutableArray *allDrawPaletteLineArray;
/** 设置当前涂鸦的宽度 */
@property (nonatomic, assign) CGFloat lineWidth;
/** 设置当前涂鸦的颜色 */
@property (nonatomic, strong) UIColor *lineColor;
/** 清空涂鸦 */
- (void)cleaAllrDrawing;
/** 撤销涂鸦 */
- (void)cleanPreviousDraw;

@end
