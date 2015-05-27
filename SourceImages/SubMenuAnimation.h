//
//  SubMenuAnimation.h
//  VSAnimatedMenu
//
//  Created by Vijay subramaniyam on 12/04/15.
//  Copyright (c) 2015 vijay. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol subMneuANimationDelegate <NSObject>

-(void)buttonIndexPressed:(int)buttonTag;

@end


@interface SubMenuAnimation : UIView
@property(nonatomic,retain)id<subMneuANimationDelegate>delegate;
-(void)AnimateImages:(NSArray*)images frame:(CGRect)buttonFrame;
-(void)shrink;
@end
