//
//  XHSScreenshotFingerDrawLineModel.m
//  XinHuaShe
//
//  Created by 王强 on 2017/12/21.
//  Copyright © 2017年 xinhuanmm. All rights reserved.
//

#import "XHSScreenshotFingerDrawLineModel.h"

@implementation XHSScreenshotFingerDrawLineModel

- (instancetype)init {
    if (self=[super init]) {
        self.linePoints = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
