//
//  SecondView.h
//  Shadows
//
//  Created by Andy Sheng on 12-07-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondView : UIViewController  <UIAccelerometerDelegate> {
    UIImageView *ninja;
    UIImageView *safeZone;
    UIImageView *candy;
    UIImageView *background;
    UIImageView *kid;
    UIImageView *spotlight;
    UIImageView *kView;
    UIImageView *dropped;
    UIImageView *obstacles_I_1;
    UIImageView *spotlight_2, *spotlight_3, *spotlight_4, *spotlight_5, *spotlight_6, *spotlight_7, *spotlight_8, *plusOne;
    CGPoint touchPoint;
    NSInteger gameState;
    NSInteger level;
    CGPoint delta;
}
@property (nonatomic, retain) IBOutlet UIImageView *ninja;
@property (nonatomic, retain) IBOutlet UIImageView *safeZone;
@property (nonatomic, retain) IBOutlet UIImageView *background;
@property (nonatomic, retain) IBOutlet UIImageView *spotlight;
@property (nonatomic, retain) IBOutlet UIImageView *candy;
@property (nonatomic, retain) IBOutlet UIImageView *kid;
@property (nonatomic, retain) IBOutlet UIImageView *kView;
@property (nonatomic, retain) IBOutlet UIImageView *dropped;
@property (nonatomic, retain) IBOutlet UIImageView *obstacles_I_1;
@property (nonatomic, retain) IBOutlet UIImageView *spotlight_2;
@property (nonatomic, retain) IBOutlet UIImageView *spotlight_3;
@property (nonatomic, retain) IBOutlet UIImageView *spotlight_4;
@property (nonatomic, retain) IBOutlet UIImageView *spotlight_5;
@property (nonatomic, retain) IBOutlet UIImageView *spotlight_6;
@property (nonatomic, retain) IBOutlet UIImageView *spotlight_7;
@property (nonatomic, retain) IBOutlet UIImageView *spotlight_8;
@property (nonatomic, retain) IBOutlet UIImageView *plusOne;



@property (nonatomic) CGPoint touchPoint;
@property CGPoint delta;
@property NSInteger gameState;
@property NSInteger level;
-(void)gameSystem;
@end
