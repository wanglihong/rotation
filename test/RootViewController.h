//
//  RootViewController.h
//  test
//
//  Created by Dennis Yang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RootViewController : UIViewController {
    int i;
}

@property(nonatomic, assign) IBOutlet UIImageView *image;

- (IBAction)rotate:(id)sender;

@end
