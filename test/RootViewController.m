//
//  RootViewController.m
//  test
//
//  Created by Dennis Yang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#define ROTATE_LEFT_TAG 1

@implementation RootViewController

@synthesize image;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction)rotate:(id)sender
{/*
    int direction = [sender tag] == ROTATE_LEFT_TAG ? -1 : 1;
    CABasicAnimation* rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"]; 
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * direction];
    rotationAnimation.duration = 3.0f;
    rotationAnimation.repeatCount = HUGE_VALF;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.image.layer addAnimation:rotationAnimation forKey:@"rotateAnimation"];
  */
    i += 180;
    
    [UIView beginAnimations:@"rotationg" context:nil];
    [UIView setAnimationDuration:3.0];
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 0.0005; // 透视效果
    transform = CATransform3DRotate(transform, (M_PI/180*i), 0, 1, 0); //0,1,0 y轴旋转
    [self.image.layer setTransform:transform];
    
    [UIView commitAnimations];

}

@end
