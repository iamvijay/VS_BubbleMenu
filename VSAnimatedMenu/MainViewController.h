//
//  MainViewController.h
//  VSAnimatedMenu
//
//  Created by Vijay subramaniyam on 11/04/15.
//  Copyright (c) 2015 vijay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubMenuAnimation.h"

@interface MainViewController : UIViewController<subMneuANimationDelegate>
- (IBAction)openSubMenu:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *animationButton;


@end
