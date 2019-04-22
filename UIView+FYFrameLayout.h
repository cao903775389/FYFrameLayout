//
//  UIView+FYFrameLayout.h
//  FYFrameLayout
//
//  Created by admin on 2019/4/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FYFrameLayout)

/// frame Getter
- (CGSize)fy_size;
- (CGFloat)fy_height;
- (CGFloat)fy_width;

- (CGPoint)fy_origin;

- (CGFloat)fy_x;
- (CGFloat)fy_left;

- (CGFloat)fy_y;
- (CGFloat)fy_top;

- (CGFloat)fy_bottom;
- (CGFloat)fy_right;

- (CGFloat)fy_centerX;
- (CGFloat)fy_centerY;

/// frame Setter
// size
- (void)setFy_size:(CGSize)size;
- (void)setFy_height:(CGFloat)height;
- (void)setFy_width:(CGFloat)width;
// origin
- (void)setFy_x:(CGFloat)x;
- (void)setFy_left:(CGFloat)left;

- (void)setFy_y:(CGFloat)y;
- (void)setFy_top:(CGFloat)top;

- (void)setFy_centerX:(CGFloat)centerX;
- (void)setFy_centerY:(CGFloat)centerY;

- (void)setFy_bottom:(CGFloat)bottom;
- (void)setFy_right:(CGFloat)right;

// iPhoneX adapt
- (CGFloat)fy_safeAreaBottomGap;
- (CGFloat)fy_safeAreaTopGap;
- (CGFloat)fy_safeAreaLeftGap;
- (CGFloat)fy_safeAreaRightGap;

@end

NS_ASSUME_NONNULL_END
