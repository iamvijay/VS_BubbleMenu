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

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#import "MainViewController.h"


@interface MainViewController ()
{
    UIView *backGroundView;
}
@property(nonatomic,retain)SubMenuAnimation *subMenu;
@property(nonatomic,strong) NSArray *image;

@end

BOOL isExpanded_;


@implementation MainViewController
@synthesize subMenu,image;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    image = [[NSArray alloc]init];
    subMenu = [[SubMenuAnimation alloc]init];
    
    subMenu.delegate=self;
    subMenu.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    self.animationButton.layer.cornerRadius = 30.0f;
    self.animationButton.layer.masksToBounds = YES;
    
    backGroundView = [[UIView alloc]init];
    backGroundView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)openSubMenu:(id)sender {
    
    if(!isExpanded_)
    {

        image = @[@"facebook.png",@"googleplus.png",@"twitter.png",@"youtube.png"];
        [subMenu AnimateImages:image frame:self.animationButton.frame];
        [self.view addSubview:subMenu];
        
        
        [self.view bringSubviewToFront:self.animationButton];
        
        //If you don need Black transparent view behind menu comment follwoing three lines
        backGroundView.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.65f];
        [self.view addSubview:backGroundView];
        [self.view sendSubviewToBack:backGroundView];

        self.animationButton.transform = CGAffineTransformMakeRotation(180);
        isExpanded_ = YES;

    }
    else
    {
        [backGroundView removeFromSuperview];
        self.animationButton.transform = CGAffineTransformMakeRotation(0);
        [subMenu shrink];
        isExpanded_ = NO;
    }
    
    
}

-(void)buttonIndexPressed:(int)buttonTag
{
    self.animationButton.transform = CGAffineTransformMakeRotation(0);
    isExpanded_ = NO;
    [backGroundView removeFromSuperview];

}
@end
