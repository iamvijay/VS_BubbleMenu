# Bubble Menu
  
 One of the cool menu to show the user which will be very interactive to the user.
 
# Screen shots 
  <img align="left" src="https://i.imgflip.com/mncgx.gif" alt="SS1" width="240" height="427"/>
  <img align="center" src="http://i.imgur.com/CZjJa9D.jpeg" alt="SS2" width="240" height="427"/>
  <img align="center" src="http://i.imgur.com/BSlWEGo.jpeg" alt="SS3" width="240" height="427"/>

# Installation

Just drag and drop the "SubMenuAnimation.h" and "SubMenuAnimation.m" file from source files into your project, 
and make sure you check the "Copy items into destination group's folder" box

###### - Then import SubMenuAnimation.h and set the subMneuAnimationDelegate wherever you need it.

```objective-c
#import "SubMenuAnimation.h"

@interface MainViewController : UIViewController<subMneuANimationDelegate>
```

# Usage

Creation is very simple just send the array of images, image names and Button frame. 

```objective-c
 SubMenuAnimation *subMenu = [[SubMenuAnimation alloc]init];
 subMenu.delegate=self;
 
 subMenu.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
 [self.view addSubview:subMenu];

 NSArray *image = [NSArray arrayWithObjects:@"facebook.png",@"googleplus.png",@"twitter.png",@"youtube.png", nil];
 NSArray *menuName = [NSArray arrayWithObjects:@"Facebook",@"Google+",@"Twitter",@"Youtube", nil]
 [subMenu AnimateImages:image menuNames:menuName frame:self.animationButton.frame];
```

As like above create object and create array of images and image names. Then call the method with image array,image names array with button frame.

Dont forget to set Delegate.

If you want to change animation speed or timing change below values which is available in SubMenuAnimation.h.

```objective-c
const CGFloat kDefaultAnimateDuration = 0.55f;
const CGFloat kDefaultAnimateDelay = 0.1f;
const CGFloat kDefaultSpringDamping = 0.58f;
const CGFloat kDefaultSpringVelocity = 0.55f;

const int kDefaultMenuSize = 50;
```

# Handling Delegate function

So when you press any of those button delegate function will be get triggered in MainViewController. Using button tag 
you can identify which button has been pressed so based on button tag you can do your logic.

```objective-c
-(void)buttonIndexPressed:(int)buttonTag
{
  NSLog(@"%d",buttonTag);
  //Your logic goes here   
}
```
And tap the button or title to close menu.

Note : This is my first library so please feel free to comment or even you can suggest me if i have to improve anything in the code. Thanks

# Get in touch
If you want to contact me mail at vijays1107@gmail.com 
or
Just tweet me : [@iam_vijay7](https://twitter.com/iam_vijay7)

# License

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
