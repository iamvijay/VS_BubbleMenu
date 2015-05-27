//
//  SubMenuAnimation.m
//  VSAnimatedMenu
//
//  Created by Vijay subramaniyam on 12/04/15.
//  Copyright (c) 2015 vijay. All rights reserved.
//

#import "SubMenuAnimation.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


//ANIMATION MACROS

const CGFloat kDefaultAnimateDuration = 0.9f;
const CGFloat kDefaultAnimateDelay = 0.35f;
const CGFloat kDefaultSpringDamping = 0.53f;
const CGFloat kDefaultSpringVelocity = 0.65f;

const int kDefaultMenuSize = 50;

@interface SubMenuAnimation ()

@property (nonatomic, strong) NSMutableArray *items;

@end
BOOL isExpanded;
int tag = 0;
int imageCount;
int Xaxis_;




@implementation SubMenuAnimation
@synthesize delegate;

-(void)AnimateImages:(NSArray *)images  frame:(CGRect)buttonFrame
{
    
    
    int x = buttonFrame.origin.y - 25;
    Xaxis_ = buttonFrame.origin.x+7;
    imageCount = (int)[images count];
    isExpanded = NO;
    self.items = [NSMutableArray array];
    for (int i = 0; i < images.count; i++) {
        UIImageView *item = [[UIImageView alloc] init];
        [item setImage:[UIImage imageNamed:[images objectAtIndex:i]]];
        x = x - 60;
        item.userInteractionEnabled = YES;
        item.frame = CGRectMake(buttonFrame.origin.x+5, SCREEN_HEIGHT-80, kDefaultMenuSize, kDefaultMenuSize);
        item.tag = tag + i;
        
        [UIView animateWithDuration:kDefaultAnimateDuration
                              delay:kDefaultAnimateDelay
             usingSpringWithDamping:kDefaultSpringDamping
              initialSpringVelocity:kDefaultSpringVelocity
                            options:UIViewAnimationOptionCurveEaseOut animations:^{
                              
                                    item.frame = CGRectMake(buttonFrame.origin.x+5, x, kDefaultMenuSize, kDefaultMenuSize);
                             }

                         completion:^(BOOL finished) {
                             //Completion Block
                         }];
        
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        [item addGestureRecognizer:tap];
        [self addSubview:item];
        [self.items addObject:item];
        
        
    }
    
    
}

-(void)shrink
{
    for (int i = 0; i < imageCount; i++) {
        [UIView animateWithDuration:0.45f animations:^{
        
        [self.items [i] setFrame:CGRectMake(Xaxis_, SCREEN_HEIGHT-68, 40, 40)];

        
    }];
    
    }
    
    [self performSelector:@selector(removeAll) withObject:nil afterDelay:0.6];
    
}

- (void)tapped:(UITapGestureRecognizer *)gesture
{
    [delegate buttonIndexPressed:(int)gesture.view.tag];
    [self shrink];
}

-(void)removeAll
{
    for (int i = 0; i < imageCount; i++) {
        [UIView animateWithDuration:0.55 animations:^{
            [self.items [i] removeFromSuperview];
            
        }];
    }
    
    isExpanded = YES;
    
    
}

@end


