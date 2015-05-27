/*
 The MIT License (MIT)
 
 Copyright (c) 2015 Vijay Subramaniyam
 
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

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


