//
//  RotationView.h
//  test
//
//  Created by Dennis Yang on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RotationView : UIView 

@property double shift;
@property double preX;
@property (nonatomic, retain) NSDate *data;

@property(nonatomic, assign) IBOutlet UIImageView *image;

@end
