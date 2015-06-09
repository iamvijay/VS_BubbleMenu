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
const CGFloat kDefaultAnimateDelay = 0.1f;
const CGFloat kDefaultSpringDamping = 0.53f;
const CGFloat kDefaultSpringVelocity = 0.65f;

const int kDefaultMenuSize = 50;

@interface SubMenuAnimation ()

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) NSMutableArray *ImageName;


@end
BOOL isExpanded;
int tag = 0;
int imageCount;
int Xaxis_;
int Yaxis_;





@implementation SubMenuAnimation
@synthesize delegate;

-(void)AnimateImages:(NSArray *)images menuNames:(NSArray*)menuArray frame:(CGRect)buttonFrame
{
    
    self.items = nil;
    self.ImageName = nil;
    
    
    int x = buttonFrame.origin.y-25;
    Yaxis_ = buttonFrame.origin.y;
    Xaxis_ = buttonFrame.origin.x+7;
    imageCount = (int)[images count];
    isExpanded = NO;
    self.items = [NSMutableArray array];
    self.ImageName = [NSMutableArray array];

    for (int i = 0; i < images.count; i++) {
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        item.userInteractionEnabled = YES;
        item.frame = CGRectMake(buttonFrame.origin.x+5, buttonFrame.origin.y+2, kDefaultMenuSize, kDefaultMenuSize);
        item.tag = tag + i;
        [item setBackgroundImage:[UIImage imageNamed:[images objectAtIndex:i]] forState:UIControlStateNormal];
        [item addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];

        x = x - 60;
        
        CGRect frameSize = CGRectMake(20, SCREEN_WIDTH/2, SCREEN_WIDTH-40,20);
        UILabel *menuName = [[UILabel alloc]init];
        NSInteger textWidth = [self getTextWidth:[menuArray objectAtIndex:i] frame:frameSize font:@"Helvetica-Light" fontSize:13];
        
        menuName.frame = CGRectMake(item.frame.origin.x-textWidth-30, item.frame.origin.y+13, textWidth+20, 22);
        menuName.text = [menuArray objectAtIndex:i];
        menuName.backgroundColor = [UIColor whiteColor];
        menuName.font = [UIFont fontWithName:@"Helvetica-Light" size:13];
        menuName.textColor = [UIColor darkTextColor];
        menuName.textAlignment = NSTextAlignmentCenter;
        menuName.layer.cornerRadius = 8.0f;
        menuName.layer.masksToBounds = YES;
        
        [UIView animateWithDuration:kDefaultAnimateDuration
                              delay:kDefaultAnimateDelay
             usingSpringWithDamping:kDefaultSpringDamping
              initialSpringVelocity:kDefaultSpringVelocity
                            options:UIViewAnimationOptionCurveEaseOut animations:^{
                              
                            item.frame = CGRectMake(buttonFrame.origin.x+5, x, kDefaultMenuSize, kDefaultMenuSize);
                            menuName.frame = CGRectMake(item.frame.origin.x-textWidth-30, item.frame.origin.y+13, textWidth+20, 22);
    
                             }

                         completion:^(BOOL finished) {
                             //Completion Block
                         }];
        
        
        
        
        [self addSubview:item];
        [self addSubview:menuName];
        [self.items addObject:item];
        [self.ImageName addObject:menuName];
        
        
    }
    
    
    
    
}

-(void)shrink
{
    for (int i = 0; i < [self.items count]; i++) {
        [UIView animateWithDuration:0.45f animations:^{
        
            CGRect frameLabel = [self.ImageName [i] frame];
            [self.ImageName [i] setFrame:CGRectMake(frameLabel.origin.x, Yaxis_+20, frameLabel.size.width, 22)];
            [self.items [i] setFrame:CGRectMake(Xaxis_, Yaxis_+2, 40, 40)];
            
      
        
    }];
    
    }
    
    [self performSelector:@selector(removeAll) withObject:nil afterDelay:0.3];
    
}

-(IBAction)tapped:(id)sender
{
    [delegate buttonIndexPressed:(int)[sender tag]];
    [self shrink];
}

-(void)removeAll
{
    for (int i = 0; i < [self.items count]; i++) {
            [self.items [i] removeFromSuperview];
            [self.ImageName [i] removeFromSuperview];

    }
    
    self.items = nil;
    self.ImageName = nil;
    isExpanded = YES;
    
    
}

-(NSInteger)getTextWidth:(NSString*)message frame:(CGRect)frameValue font:(NSString*)fontName fontSize:(int)size
{
    
    CGFloat labelWidth  = CGRectGetWidth(frameValue);
    
    CGSize labelContraints   = CGSizeMake(labelWidth, 1000.0f);
    
    CGRect labelRect = [message
                        boundingRectWithSize:labelContraints
                        options:NSStringDrawingUsesLineFragmentOrigin
                        attributes:@{
                                     NSFontAttributeName : [UIFont fontWithName:fontName size:size]
                                     }
                        context:nil];
    
    return labelRect.size.width;
    
}

@end


