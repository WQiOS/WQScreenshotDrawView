//
//  XHSScreenshotDrawView.m
//  XinHuaShe
//
//  Created by 王强 on 2017/12/20.
//  Copyright © 2017年 xinhuanmm. All rights reserved.
//

#import "XHSScreenshotDrawView.h"
#import "XHSScreenshotFingerDrawLineModel.h"

@implementation XHSScreenshotDrawView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

#pragma mark - setupView
- (void)setupView {
    // 默认值设置
    self.lineWidth = 3.0;
    self.lineColor = [UIColor redColor];
    self.backgroundColor = [UIColor clearColor];
    self.allDrawPaletteLineArray = [NSMutableArray new];
}

#pragma mark - 涂鸦
//根据现有的线条，绘制相应的图画
- (void)drawRect:(CGRect)rect  {
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    if (self.allDrawPaletteLineArray.count) {
        for (int i=0; i<[self.allDrawPaletteLineArray count]; i++) {
            XHSScreenshotFingerDrawLineModel *info = self.allDrawPaletteLineArray[i];
            CGContextBeginPath(context);
            CGPoint myStartPoint=[[info.linePoints objectAtIndex:0] CGPointValue];
            CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
            if (info.linePoints.count>1) {
                for (int j=0; j<[info.linePoints count]-1; j++) {
                    CGPoint myEndPoint=[[info.linePoints objectAtIndex:j+1] CGPointValue];
                    CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
                }
            }else {
                CGContextAddLineToPoint(context, myStartPoint.x,myStartPoint.y);
            }
            CGContextSetStrokeColorWithColor(context, info.lineColor.CGColor);
            CGContextSetLineWidth(context, info.lineWidth+1);
            CGContextStrokePath(context);
        }
    }
}

#pragma mark - touchesBegan代理
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //在触摸开始的时候，添加一条新的线条并初始化
    UITouch* touch=[touches anyObject];
    XHSScreenshotFingerDrawLineModel *info = [XHSScreenshotFingerDrawLineModel new];
    info.lineColor = self.lineColor;
    info.lineWidth = self.lineWidth;
    [info.linePoints addObject:[NSValue valueWithCGPoint:[touch locationInView:self]]];
    [self.allDrawPaletteLineArray addObject:info];
    [self setNeedsDisplay];
}

#pragma mark - touchesMoved代理
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    //在触摸移动的时候，将现有的线条的最后一条的point增加相应的触摸过的坐标
    NSArray* MovePointArray=[touches allObjects];
    XHSScreenshotFingerDrawLineModel *lastInfo = [self.allDrawPaletteLineArray lastObject];
    [lastInfo.linePoints addObject:[NSValue valueWithCGPoint:[[MovePointArray objectAtIndex:0] locationInView:self]]];
    [self setNeedsDisplay];
}

#pragma mark - 清空涂鸦
- (void)cleaAllrDrawing {
    if ([self.allDrawPaletteLineArray count]>0)  {
        [self.allDrawPaletteLineArray removeAllObjects];
        [self setNeedsDisplay];
    }
}

#pragma mark - 撤销涂鸦
- (void)cleanPreviousDraw {
    if ([self.allDrawPaletteLineArray count]>0) {
        [self.allDrawPaletteLineArray removeLastObject];
    }
    [self setNeedsDisplay];
}

@end
