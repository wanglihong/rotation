//
//  RotationView.m
//  test
//
//  Created by Dennis Yang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RotationView.h"

@implementation RotationView

@synthesize image;
@synthesize shift;
@synthesize data;
@synthesize preX;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    [data release];
    [super dealloc];
}

- (void)rotate:(float)degree withAnimation:(BOOL)animate
{   
    if (animate) {
        [UIView beginAnimations:@"rotationg" context:nil];
        [UIView setAnimationDuration:3.0];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    }
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 0.0005; // 透视效果
    transform = CATransform3DRotate(transform, (M_PI/180) * degree, 0, 1, 0); //0,1,0 y轴旋转
    [self.image.layer setTransform:transform];
    
    if (animate) {
        [UIView commitAnimations];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    preX = [touch locationInView:self].x;
    data = [[NSDate date] retain];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
	
	float distance = fabsf([touch locationInView:self].x - [touch previousLocationInView:self].x);
    
    if (touch != nil) {

		if ([touch locationInView:self].x - [touch previousLocationInView:self].x > 0)
		{
			shift -= 0.9 * distance;
		}
		else
		{
			shift += 0.9 * distance;
		}
		
	}
    
    [self rotate:shift withAnimation:NO];//NSLog(@"----1:%f", shift);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    
    float s = fabsf([touch locationInView:self].x - preX);
    float t = [[NSDate date] timeIntervalSinceDate:data];
    float v = s/t;
    float a = pow(v, 2)/(2*s);
    
    if (touch != nil) {
        
        if (([touch locationInView:self].x - preX) > 0)
        {
            shift -= a * 0.03;
        }
        else
        {
            shift += a * 0.03;
        }
        
    }
    //NSLog(@"----2:%f",shift);
    [self rotate:shift withAnimation:YES];
}

@end
