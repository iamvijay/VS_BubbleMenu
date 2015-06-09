# Bubble Menu
  
  A good way to use bubble menu which is very simple and less time to integrate.
 
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

Creation is very simple just send the array of images and Button frame. Button frame will decide from where 
the animation should start.

You dont want to change in frame anything. Keep button where ever you want in the screen bottom left or bottom right or center

```objective-c
SubMenuAnimation *subMenu = [[SubMenuAnimation alloc]init];
subMenu.delegate=self;

NSArray *image  [[NSArray alloc]init];
image = @[@"facebook.png",@"googleplus.png",@"twitter.png",@"youtube.png"];

[subMenu AnimateImages:image frame:Button.frame];
```

As like above create object and create array of images. Then call the method with image array and button frame.
Dont forget to set Delegate.

If you want to change animation speed or timing change below values which is available in SubMenuAnimation.h.

```objective-c
const CGFloat kDefaultAnimateDuration = 0.9f;
const CGFloat kDefaultAnimateDelay = 0.35f;
const CGFloat kDefaultSpringDamping = 0.53f;
const CGFloat kDefaultSpringVelocity = 0.65f;

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
And tap the button to close menu.

Note : This is my first library so please feel free to comment or even you can tell me if i have to improve anything
or small mistakes in the coding. Thanks

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
