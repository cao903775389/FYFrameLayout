//
//  UIView+FYFrameLayout.m
//  FYFrameLayout
//
//  Created by admin on 2019/4/22.
//

#import "UIView+FYFrameLayout.h"
#import <objc/runtime.h>

static void *kFYUIViewLayoutMethodPropertyBottomGap = &kFYUIViewLayoutMethodPropertyBottomGap;
static void *kFYUIViewLayoutMethodPropertyTopGap = &kFYUIViewLayoutMethodPropertyTopGap;
static void *kFYUIViewLayoutMethodPropertyLeftGap = &kFYUIViewLayoutMethodPropertyLeftGap;
static void *kFYUIViewLayoutMethodPropertyRightGap = &kFYUIViewLayoutMethodPropertyRightGap;

@implementation UIView (FYFrameLayout)

/// frame Getter
- (CGSize)fy_size {
    return self.frame.size;
}
- (CGFloat)fy_height {
    return self.fy_size.height;
}
- (CGFloat)fy_width {
    return self.fy_size.width;
}

- (CGPoint)fy_origin {
    return self.frame.origin;
}

- (CGFloat)fy_x {
    return self.fy_origin.x;
}
- (CGFloat)fy_left {
    return self.fy_origin.x;
}

- (CGFloat)fy_y {
    return self.fy_origin.y;
}
- (CGFloat)fy_top {
    return self.fy_origin.y;
}

- (CGFloat)fy_bottom {
    return CGRectGetMaxY(self.frame);
}
- (CGFloat)fy_right {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)fy_centerX {
    return CGRectGetMidX(self.frame);
}
- (CGFloat)fy_centerY {
    return CGRectGetMidY(self.frame);
}

/// frame Setter
// size
- (void)setFy_size:(CGSize)size {
    CGRect newFrame = CGRectMake(self.fy_x, self.fy_y, size.width, size.height);
    self.frame = newFrame;
}
- (void)setFy_height:(CGFloat)height {
    CGRect newFrame = CGRectMake(self.fy_x, self.fy_y, self.fy_width, height);
    self.frame = newFrame;
}
- (void)setFy_width:(CGFloat)width {
    CGRect newFrame = CGRectMake(self.fy_x, self.fy_y, width, self.fy_height);
    self.frame = newFrame;
}
// origin
- (void)setFy_x:(CGFloat)x {
    self.frame = CGRectMake(x, self.fy_y, self.fy_width, self.fy_height);
}
- (void)setFy_left:(CGFloat)left {
    self.fy_x = left;
}

- (void)setFy_y:(CGFloat)y {
    self.frame = CGRectMake(self.fy_x, y, self.fy_width, self.fy_height);
}
- (void)setFy_top:(CGFloat)top {
    self.fy_y = top;
}

- (void)setFy_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.fy_centerY);
}
- (void)setFy_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.fy_centerX,centerY);
}

- (void)setFy_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}
- (void)setFy_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

// iPhoneX adapt
- (CGFloat)fy_safeAreaBottomGap {
    NSNumber *gap = objc_getAssociatedObject(self, kFYUIViewLayoutMethodPropertyBottomGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            if (self.superview.safeAreaLayoutGuide.layoutFrame.size.height > 0) {
                gap = @((self.superview.fy_height - self.superview.safeAreaLayoutGuide.layoutFrame.origin.y - self.superview.safeAreaLayoutGuide.layoutFrame.size.height));
            } else {
                gap = nil;
            }
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kFYUIViewLayoutMethodPropertyBottomGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}
- (CGFloat)fy_safeAreaTopGap {
    NSNumber *gap = objc_getAssociatedObject(self, kFYUIViewLayoutMethodPropertyTopGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.y);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kFYUIViewLayoutMethodPropertyTopGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}
- (CGFloat)fy_safeAreaLeftGap {
    NSNumber *gap = objc_getAssociatedObject(self, kFYUIViewLayoutMethodPropertyLeftGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.x);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kFYUIViewLayoutMethodPropertyLeftGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}
- (CGFloat)fy_safeAreaRightGap {
    NSNumber *gap = objc_getAssociatedObject(self, kFYUIViewLayoutMethodPropertyRightGap);
    if (gap == nil) {
        if (@available(iOS 11, *)) {
            gap = @(self.superview.safeAreaLayoutGuide.layoutFrame.origin.x);
        } else {
            gap = @(0);
        }
        objc_setAssociatedObject(self, kFYUIViewLayoutMethodPropertyRightGap, gap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return gap.floatValue;
}

@end
