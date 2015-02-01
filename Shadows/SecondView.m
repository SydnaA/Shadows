//
//  SecondView.m
//  Shadows
//
//  Created by Andy Sheng on 12-07-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SecondView.h"
#import <QuartzCore/QuartzCore.h>

@interface SecondView ()

@end

#define gameOn 1
#define gameOver 0
#define nextLevel 3
#define phraseOne 1
#define phraseTwo 2
#define singlePhrase 3
#define scared 2
#define calm 1
#define running 3
#define paused 0

@implementation SecondView
@synthesize ninja, delta, background, safeZone, gameState, level, spotlight, candy, kid, kView, dropped, obstacles_I_1, touchPoint, spotlight_2, spotlight_4, spotlight_3, spotlight_8, spotlight_7, spotlight_6, spotlight_5, plusOne;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

NSInteger gamePhrase=0;
NSInteger kidState=0;
NSInteger kidDirection;
double special;
Boolean specialOFF;

- (void)viewDidLoad
{
    UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
    accel.delegate=self;
    accel.updateInterval = 1.0f / 60.0f;
    [super viewDidLoad];
    level=0;
	// Do any additional setup after loading the view, typically from a nib.
    gameState=nextLevel;
    [NSTimer scheduledTimerWithTimeInterval:1.0f/60.0f target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
    
    gamePhrase=3;
    kidState=paused;
    kView.layer.anchorPoint=CGPointMake(0, 0.5);
    [self setSpecial];
    specialOFF=true;
    kid.hidden=YES;
    kView.hidden=YES;
    candy.hidden=YES;
    dropped.hidden=YES;
    spotlight.hidden=YES;
    spotlight_2.hidden=YES;
    spotlight_3.hidden=YES;
    spotlight_4.hidden=YES;
    spotlight_5.hidden=YES;
    spotlight_6.hidden=YES;
    spotlight_7.hidden=YES;
    spotlight_8.hidden=YES;
    plusOne.hidden=YES;
    ninja.hidden=YES;
    safeZone.hidden=YES;
    sImage=false;
    [plusOne setFrame:CGRectMake(plusOne.frame.origin.x, plusOne.frame.origin.y,50,50)];
}

-(void)setSpecial {
    special=5 * 60;
}
-(void)gameLoop {
	if(gameState== gameOn) {
		[self gameSystem];
	}
	else if (gameState==gameOver) {
        
	} else if (gameState==nextLevel) {
        ++level;
        //cleans the earlier stage
        if(!specialOFF) {
            specialOFF=true;
            [self inverse:false];
        }
        
        [self setSpecial];
        //level 1
        if(level==1) {
            //cleaning
            /*
            kid.center=CGPointMake(50, -200);
            kView.center=CGPointMake(50, -200);
            candy.center=CGPointMake(50, -200);
            dropped.center=CGPointMake(50, -200);
             */
            
            UIImage *image = [UIImage imageNamed:@"shadow_0-1.png"];
            [background setImage:image];
            safeZone.hidden=NO;
            ninja.hidden=NO;
            safeZone.center=CGPointMake(390, 203);
            ninja.center=CGPointMake(66, 158);
            gameState=gameOn;
        }
        //Level 2
        if(level==2) {
            ninja.hidden=NO;
            UIImage *image = [UIImage imageNamed:@"shadow_0-2.png"];
            [background setImage:image];
            safeZone.center=CGPointMake(378, 133);
            spotlight.hidden=NO;
            spotlight.center=CGPointMake(280, 121);
            ninja.center=CGPointMake(66, 158);
            gameState=gameOn;
        }
        //level 3
        if(level==3) {
            //BACKGROUND IMAGE SET HERE
            UIImage *image = [UIImage imageNamed:@"shadow_BLANK.png"];
            [background setImage:image];
            gamePhrase=phraseOne;
            safeZone.center=CGPointMake(378, -133);
            safeZone.hidden=YES;
            spotlight.hidden=YES;
            candy.hidden=NO;
            candy.center=CGPointMake(378, 133);
            ninja.center=CGPointMake(66, 158);
            gameState=gameOn;
        }
        //level 4
        if(level==4) {
            //BACKGROUND IMAGE SET HERE
            UIImage *image = [UIImage imageNamed:@"shadow_BLANK.png"];
            [background setImage:image];
            //safeZone.center=CGPointMake(378, -133);
            safeZone.hidden=YES;
            candy.hidden=NO;
            candy.center=CGPointMake(378, 133);
            ninja.center=CGPointMake(50, 40);
            gamePhrase=phraseOne;
            kidState=calm;
            kid.hidden=NO;
            kView.hidden=NO;
            kid.center=CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
            kidDirection=0;
            turnLeft=true;
            gameState=gameOn;
            
            
        }
        //level 5
        if(level==5) {
            dropped.hidden=YES;
            //BACKGROUND IMAGE SET HERE
            UIImage *image = [UIImage imageNamed:@"shadow_BLANK.png"];
            [background setImage:image];
            //safeZone.center=CGPointMake(378, -133);
            safeZone.hidden=YES;
            candy.hidden=NO;
            candy.center=CGPointMake(378, 133);
            spotlight.hidden=NO;
            spotlight_2.hidden=NO;
            spotlight_3.hidden=NO;
            spotlight_4.hidden=NO;
            spotlight_5.hidden=NO;
            spotlight_6.hidden=NO;
            spotlight_7.hidden=NO;
            spotlight_8.hidden=NO;
            image = [UIImage imageNamed:@"spotlight.png"];
            [spotlight setImage:image];
            [spotlight_2 setImage:image];
            [spotlight_3 setImage:image];
            [spotlight_4 setImage:image];
            [spotlight_5 setImage:image];
            [spotlight_6 setImage:image];
            [spotlight_7 setImage:image];
            [spotlight_8 setImage:image];
            [spotlight setFrame:CGRectMake(spotlight.frame.origin.x, spotlight.frame.origin.y,58,61)];
            [spotlight_2 setFrame:CGRectMake(spotlight_2.frame.origin.x, spotlight_2.frame.origin.y,58,61)];
            [spotlight_3 setFrame:CGRectMake(spotlight_3.frame.origin.x, spotlight_3.frame.origin.y,58,61)];
            [spotlight_4 setFrame:CGRectMake(spotlight_4.frame.origin.x, spotlight_4.frame.origin.y,58,61)];
            [spotlight_5 setFrame:CGRectMake(spotlight_5.frame.origin.x, spotlight_5.frame.origin.y,58,61)];
            [spotlight_6 setFrame:CGRectMake(spotlight_6.frame.origin.x, spotlight_6.frame.origin.y,58,61)];
            [spotlight_7 setFrame:CGRectMake(spotlight_7.frame.origin.x, spotlight_7.frame.origin.y,58,61)];
            [spotlight_8 setFrame:CGRectMake(spotlight_8.frame.origin.x, spotlight_8.frame.origin.y,58,61)];
            spotlight.center=CGPointMake(((self.view.bounds.size.width/2)-95), ((self.view.bounds.size.height/2)-80));
            spotlight_2.center=CGPointMake(((self.view.bounds.size.width/2)-30),((self.view.bounds.size.height/2)-80));
            
            spotlight_3.center=CGPointMake((self.view.bounds.size.width/2)+30,(self.view.bounds.size.height/2)-80);
            spotlight_4.center=CGPointMake((self.view.bounds.size.width/2)+95,(self.view.bounds.size.height/2)-80);
            
            spotlight_5.center=CGPointMake((self.view.bounds.size.width/2)-95, (self.view.bounds.size.height/2)+80);
            spotlight_6.center=CGPointMake((self.view.bounds.size.width/2)-30,(self.view.bounds.size.height/2)+80);
            spotlight_7.center=CGPointMake((self.view.bounds.size.width/2)+30,(self.view.bounds.size.height/2)+80);
            spotlight_8.center=CGPointMake((self.view.bounds.size.width/2)+95,(self.view.bounds.size.height/2)+80);
            /*
            NSInteger asd = self.view.bounds.size.width/2-95;
            NSInteger asdd = (self.view.bounds.size.height/2)-80-15;
            NSLog(@"%i    %i", asd, asdd);
            asd = self.view.bounds.size.width/2-15;
            asdd = (self.view.bounds.size.height/2)-80-15;
            NSLog(@"%i    %i", asd, asdd);
            */
            
            
            ninja.center=CGPointMake(66, 160);
            kid.center=CGPointMake(0, -200);
            gamePhrase=phraseOne;
            turnLeft=false;
            gameState=gameOn;
            

        }
        if(level==6) {
            //previous level cleanup
            kView.hidden=YES;
            
            //level initialization and placing
            UIImage *image = [UIImage imageNamed:@"kid.png"];
            [spotlight setImage:image];
            [spotlight_2 setImage:image];
            [spotlight_3 setImage:image];
            [spotlight_4 setImage:image];
            image = [UIImage imageNamed:@"view.png"];
            [spotlight_5 setImage:image];
            [spotlight_6 setImage:image];
            [spotlight_7 setImage:image];
            [spotlight_8 setImage:image];
            
            
            [spotlight setFrame:CGRectMake(spotlight.frame.origin.x, spotlight.frame.origin.y,15,15)];
            [spotlight_2 setFrame:CGRectMake(spotlight_2.frame.origin.x, spotlight_2.frame.origin.y,15,15)];
            [spotlight_3 setFrame:CGRectMake(spotlight_3.frame.origin.x, spotlight_3.frame.origin.y,15,15)];
            [spotlight_4 setFrame:CGRectMake(spotlight_4.frame.origin.x, spotlight_4.frame.origin.y,15,15)];
            
            [spotlight_5 setFrame:CGRectMake(spotlight_5.frame.origin.x, spotlight_5.frame.origin.y,58,43)];
            [spotlight_6 setFrame:CGRectMake(spotlight_6.frame.origin.x, spotlight_6.frame.origin.y,58,43)];
            [spotlight_7 setFrame:CGRectMake(spotlight_7.frame.origin.x, spotlight_7.frame.origin.y,58,43)];
            [spotlight_8 setFrame:CGRectMake(spotlight_8.frame.origin.x, spotlight_8.frame.origin.y,58,43)];
            
            
            spotlight.center=CGPointMake((self.view.bounds.size.width/2)-60, self.view.bounds.size.height/2);
            spotlight_2.center=CGPointMake((self.view.bounds.size.width/2), (self.view.bounds.size.height/2)-80);
            spotlight_3.center=CGPointMake((self.view.bounds.size.width/2), (self.view.bounds.size.height/2)+80);
            spotlight_4.center=CGPointMake((self.view.bounds.size.width/2)+60, (self.view.bounds.size.height/2));
            
            spotlight_5.layer.anchorPoint=CGPointMake(0, 0.5);
            spotlight_6.layer.anchorPoint=CGPointMake(0, 0.5);
            spotlight_7.layer.anchorPoint=CGPointMake(0, 0.5);
            spotlight_8.layer.anchorPoint=CGPointMake(0, 0.5);
            
            spotlight_5.center=CGPointMake((spotlight.center.x), spotlight.center.y);
            [self rotate:180 :spotlight_5];
            
            spotlight_6.center=CGPointMake((spotlight_2.center.x), spotlight_2.center.y);
            [self rotate:270 :spotlight_6];
            
            spotlight_7.center=CGPointMake((spotlight_3.center.x), spotlight_3.center.y);
            [self rotate:90 :spotlight_7];
            
            spotlight_8.center=CGPointMake((spotlight_4.center.x), spotlight_4.center.y);
            [self rotate:180 :spotlight_8];
            
            gamePhrase=singlePhrase;
            ninja.center=CGPointMake(100, 250);
            safeZone.hidden=NO;
            safeZone.center=CGPointMake(378, 133);
            gameState=gameOn;
            NSLog(@"LEVEL 6");
        }
        
        if(level==7) {
            //CLEAN UP
            spotlight.hidden=YES;
            spotlight_2.hidden=YES;
            spotlight_3.hidden=YES;
            spotlight_4.hidden=YES;
            spotlight_5.hidden=YES;
            spotlight_6.hidden=YES;
            spotlight_7.hidden=YES;
            spotlight_8.hidden=YES;
            
            kView.hidden=YES;
            kid.hidden=YES;
            
            //set location and placement
            
            
            
            //set game phrase (single is default)
            gamePhrase=singlePhrase;
            //location of the ninja (aka black dot which is you)
            ninja.center=CGPointMake(100, 250);
            //is the safezone hidden?
            safeZone.hidden=NO;
            //location of the safezone
            safeZone.center=CGPointMake(378, 133);
            //game ON
            gameState=gameOn;
        }
        
    }
}

NSInteger x=0;
Boolean increase=true;
Boolean turnLeft=true;
Boolean sImage=false;

-(void)goodGained:(NSInteger)gained:(CGPoint)loc {
    plusOne.center=CGPointMake(loc.x+3, loc.y-3);
    plusOne.hidden=NO;
    [self fade:plusOne];
}

-(void)fade:(UIImageView *)image {
    [image setFrame:CGRectMake(image.frame.origin.x, image.frame.origin.y,image.frame.size.height+2, image.frame.size
                               .width+1)];
    image.alpha-=0.1;
    if(image.alpha>0) {
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fade:) userInfo:nil repeats:NO];
        
    }
}

-(void)inverse:(Boolean)turnOn {
    
    if(turnOn) {
    UIImage *image = [UIImage imageNamed:@"i_candy.png"];
    [candy setImage:image];
    
    image = [UIImage imageNamed:@"i_dropped.png"];
    [dropped setImage:image];
    
    image = [UIImage imageNamed:@"i_ninja.png"];
    [ninja setImage:image];
    
    image = [UIImage imageNamed:@"i_SafeZone.png"];
    [safeZone setImage:image];
    
    switch (level) {
        case 1:
            image = [UIImage imageNamed:@"i_shadow_0-1.png"];
            [background setImage:image];
            break;
        case 2:
            image = [UIImage imageNamed:@"i_shadow_0-2.png"];
            [background setImage:image];
            image = [UIImage imageNamed:@"i_spotlight.png"];
            [spotlight setImage:image];
            break;
        case 3:
            image = [UIImage imageNamed:@"i_shadow_BLANK.png"];
            [background setImage:image];
            break;
        case 4:
            image = [UIImage imageNamed:@"i_shadow_BLANK.png"];
            [background setImage:image];
            image = [UIImage imageNamed:@"i_kid.png"];
            [kid setImage:image];
            image = [UIImage imageNamed:@"i_view.png"];
            [kView setImage:image];
            break;
        case 5:
            image = [UIImage imageNamed:@"i_shadow_BLANK.png"];
            [background setImage:image];
            image = [UIImage imageNamed:@"i_spotlight.png"];
            [spotlight setImage:image];
            [spotlight_2 setImage:image];
            [spotlight_3 setImage:image];
            [spotlight_4 setImage:image];
            [spotlight_5 setImage:image];
            [spotlight_6 setImage:image];
            [spotlight_7 setImage:image];
            [spotlight_8 setImage:image];
            break;
        case 6:
            image = [UIImage imageNamed:@"i_shadow_BLANK.png"];
            [background setImage:image];
            image = [UIImage imageNamed:@"i_kid.png"];
            [spotlight setImage:image];
            [spotlight_2 setImage:image];
            [spotlight_3 setImage:image];
            [spotlight_4 setImage:image];
            image = [UIImage imageNamed:@"i_view.png"];
            [spotlight_5 setImage:image];
            [spotlight_6 setImage:image];
            [spotlight_7 setImage:image];
            [spotlight_8 setImage:image];
        case 7:
            image = [UIImage imageNamed:@"i_shadow_BLANK.png"];
            [background setImage:image];
            image = [UIImage imageNamed:@"i_spotlight.png"];
            [spotlight setImage:image];
            [spotlight_2 setImage:image];
            [spotlight_3 setImage:image];
            [spotlight_4 setImage:image];
            image = [UIImage imageNamed:@"i_view.png"];
            [spotlight_5 setImage:image];
            [spotlight_7 setImage:image];
            image = [UIImage imageNamed:@"i_kid.png"];
            [spotlight_6 setImage:image];
            [spotlight_8 setImage:image];
            break;
        default:
            break;
    }
    
    } else {
        UIImage *image = [UIImage imageNamed:@"candy.png"];
        [candy setImage:image];
        
        image = [UIImage imageNamed:@"dropped.png"];
        [dropped setImage:image];
        
        image = [UIImage imageNamed:@"ninja.png"];
        [ninja setImage:image];
        
        image = [UIImage imageNamed:@"SafeZone.png"];
        [safeZone setImage:image];
        
        switch (level) {
            case 1:
                image = [UIImage imageNamed:@"shadow_0-1.png"];
                [background setImage:image];
                break;
            case 2:
                image = [UIImage imageNamed:@"shadow_0-2.png"];
                [background setImage:image];
                image = [UIImage imageNamed:@"spotlight.png"];
                [spotlight setImage:image];
                break;
            case 3:
                image = [UIImage imageNamed:@"shadow_BLANK.png"];
                [background setImage:image];
                break;
            case 4:
                image = [UIImage imageNamed:@"shadow_BLANK.png"];
                [background setImage:image];
                image = [UIImage imageNamed:@"kid.png"];
                [kid setImage:image];
                image = [UIImage imageNamed:@"view.png"];
                [kView setImage:image];
                break;
            case 5:
                image = [UIImage imageNamed:@"shadow_BLANK.png"];
                [background setImage:image];
                image = [UIImage imageNamed:@"spotlight.png"];
                [spotlight setImage:image];
                [spotlight_2 setImage:image];
                [spotlight_3 setImage:image];
                [spotlight_4 setImage:image];
                [spotlight_5 setImage:image];
                [spotlight_6 setImage:image];
                [spotlight_7 setImage:image];
                [spotlight_8 setImage:image];
                break;
            case 6:
                image = [UIImage imageNamed:@"shadow_BLANK.png"];
                [background setImage:image];
                image = [UIImage imageNamed:@"kid.png"];
                [spotlight setImage:image];
                [spotlight_2 setImage:image];
                [spotlight_3 setImage:image];
                [spotlight_4 setImage:image];
                image = [UIImage imageNamed:@"view.png"];
                [spotlight_5 setImage:image];
                [spotlight_6 setImage:image];
                [spotlight_7 setImage:image];
                [spotlight_8 setImage:image];
            case 7:
                image = [UIImage imageNamed:@"shadow_BLANK.png"];
                [background setImage:image];
                image = [UIImage imageNamed:@"spotlight.png"];
                [spotlight setImage:image];
                [spotlight_2 setImage:image];
                [spotlight_3 setImage:image];
                [spotlight_4 setImage:image];
                image = [UIImage imageNamed:@"view.png"];
                [spotlight_5 setImage:image];
                [spotlight_7 setImage:image];
                image = [UIImage imageNamed:@"kid.png"];
                [spotlight_6 setImage:image];
                [spotlight_8 setImage:image];
                break;
            default:
                break;
        }

    }
    
}

-(void)gameSystem {
    
    Boolean move=false;
    if(ninja.center.y+delta.y+5>=self.view.bounds.size.height||ninja.center.y+delta.y-5<=0) {
        ninja.center=CGPointMake(ninja.center.x+delta.y, ninja.center.y);
        move=true;
    }
    
    if(ninja.center.x+delta.x+5>=self.view.bounds.size.width||ninja.center.x+delta.x-5<=0) {
        ninja.center=CGPointMake(ninja.center.x, ninja.center.y+delta.y);
        move=true;
    }
    
    if(move==false) {
        ninja.center=CGPointMake(ninja.center.x+delta.x, ninja.center.y+delta.y);
        
    }
    if(kid.hidden==NO&&kidState==calm) {
        if(CGRectIntersectsRect(ninja.frame, kid.frame)) { 
            [self goodGained:1:ninja.center];
        }
    }
    if(safeZone.hidden==NO)
        if(CGRectIntersectsRect(ninja.frame, safeZone.frame)) { gameState=nextLevel;}
    if(candy.hidden==NO)
        if(CGRectIntersectsRect(ninja.frame, candy.frame)) {
            candy.hidden=YES;
            candy.center=CGPointMake(0, -200);
            gamePhrase=phraseTwo;
            safeZone.hidden=NO;
            safeZone.center=CGPointMake(66, 158);
        
        }
    
    
    if(specialOFF) {
        if(level==2) {
        //spotlight.center=CGPointMake(spotlight.center.x+x, spotlight.center.y+(0.4*(pow(x, 2.0))));
        //spotlight.center=CGPointMake(spotlight.center.x, spotlight.center.y+x);
        //NSLog(@"%f", spotlight.center.y);
        if(increase) {
        spotlight.center=CGPointMake(spotlight.center.x, spotlight.center.y+1);
        } else {
        spotlight.center=CGPointMake(spotlight.center.x, spotlight.center.y-1);
        }
        if(spotlight.center.y+50>=self.view.bounds.size.height) {increase=false;}
        if(spotlight.center.y-50<=0) { increase=true;}
    }
        if(level==5) {
        if(!turnLeft) {
            if(spotlight.center.x<(self.view.bounds.size.width/2)) {
                spotlight.center=CGPointMake(spotlight.center.x+2, spotlight.center.y+4);
            } else { spotlight.center=CGPointMake(spotlight.center.x+2, spotlight.center.y-4); } 
            
            if(spotlight_2.center.x<(self.view.bounds.size.width/2)) {
                spotlight_2.center=CGPointMake(spotlight_2.center.x+1, spotlight_2.center.y+2);
            } else { spotlight_2.center=CGPointMake(spotlight_2.center.x+1, spotlight_2.center.y-2);} 
            
            
            if(spotlight_3.center.x>(self.view.bounds.size.width/2)) {
                spotlight_3.center=CGPointMake(spotlight_3.center.x-2, spotlight_3.center.y+4);
            } else { spotlight_3.center=CGPointMake(spotlight_3.center.x-2, spotlight_3.center.y-4); } 
            if(spotlight_4.center.x>(self.view.bounds.size.width/2)) {
                spotlight_4.center=CGPointMake(spotlight_4.center.x-1, spotlight_4.center.y+2);
            } else { spotlight_4.center=CGPointMake(spotlight_4.center.x-1, spotlight_4.center.y-2);}     
            
            if(spotlight_5.center.x<(self.view.bounds.size.width/2)) {
                spotlight_5.center=CGPointMake(spotlight_5.center.x+2, spotlight_5.center.y-4);
            } else { spotlight_5.center=CGPointMake(spotlight_5.center.x+2, spotlight_5.center.y+4); } 
            if(spotlight_6.center.x<(self.view.bounds.size.width/2)) {
                spotlight_6.center=CGPointMake(spotlight_6.center.x+1, spotlight_6.center.y-2);
            } else { spotlight_6.center=CGPointMake(spotlight_6.center.x+1, spotlight_6.center.y+2);}      
            
            
            if(spotlight_7.center.x>(self.view.bounds.size.width/2)) {
                spotlight_7.center=CGPointMake(spotlight_7.center.x-2, spotlight_7.center.y-4);
            } else { spotlight_7.center=CGPointMake(spotlight_7.center.x-2, spotlight_7.center.y+4); } 
            if(spotlight_8.center.x>(self.view.bounds.size.width/2)) {
                spotlight_8.center=CGPointMake(spotlight_8.center.x-1, spotlight_8.center.y-2);
            } else { spotlight_8.center=CGPointMake(spotlight_8.center.x-1, spotlight_8.center.y+2);}
            
            if(spotlight.center.x>(self.view.bounds.size.width/2)+95) {
                turnLeft=true;
            }
            
            //NSLog(@"%f    %f", spotlight.center.x, spotlight.center.y);
         
        } else {
            if(spotlight.center.x>(self.view.bounds.size.width/2)) {
                spotlight.center=CGPointMake(spotlight.center.x-2, spotlight.center.y+4);
            } else { spotlight.center=CGPointMake(spotlight.center.x-2, spotlight.center.y-4); } 
            if(spotlight_2.center.x>(self.view.bounds.size.width/2)) {
                spotlight_2.center=CGPointMake(spotlight_2.center.x-1, spotlight_2.center.y+2);
            } else { spotlight_2.center=CGPointMake(spotlight_2.center.x-1, spotlight_2.center.y-2);} 
            
            
            if(spotlight_3.center.x<(self.view.bounds.size.width/2)) {
                spotlight_3.center=CGPointMake(spotlight_3.center.x+2, spotlight_3.center.y+4);
            } else { spotlight_3.center=CGPointMake(spotlight_3.center.x+2, spotlight_3.center.y-4); } 
            if(spotlight_4.center.x<(self.view.bounds.size.width/2)) {
                spotlight_4.center=CGPointMake(spotlight_4.center.x+1, spotlight_4.center.y+2);
            } else { spotlight_4.center=CGPointMake(spotlight_4.center.x+1, spotlight_4.center.y-2);}     
            
            
            if(spotlight_5.center.x>(self.view.bounds.size.width/2)) {
                spotlight_5.center=CGPointMake(spotlight_5.center.x-2, spotlight_5.center.y+4);
            } else { spotlight_5.center=CGPointMake(spotlight_5.center.x-2, spotlight_5.center.y-4); } 
            if(spotlight_6.center.x>(self.view.bounds.size.width/2)) {
                spotlight_6.center=CGPointMake(spotlight_6.center.x-1, spotlight_6.center.y+2);
            } else { spotlight_6.center=CGPointMake(spotlight_6.center.x-1, spotlight_6.center.y-2);}  
            
            
            if(spotlight_7.center.x<(self.view.bounds.size.width/2)) {
                spotlight_7.center=CGPointMake(spotlight_7.center.x+2, spotlight_7.center.y-4);
            } else { spotlight_7.center=CGPointMake(spotlight_7.center.x+2, spotlight_7.center.y+4); } 
            if(spotlight_8.center.x<(self.view.bounds.size.width/2)) {
                spotlight_8.center=CGPointMake(spotlight_8.center.x+1, spotlight_8.center.y-2);
            } else { spotlight_8.center=CGPointMake(spotlight_8.center.x+1, spotlight_8.center.y+2);}
        }
        
        if(spotlight.center.x<(self.view.bounds.size.width/2)-95) {
            turnLeft=false;
        }
        
        
    }
        //need to test rotation speed
        if (kid.hidden==NO&&kView.hidden==NO) {
            if(level==4) {
                if(turnLeft) {
                    kidDirection+=1;
                    if(kidDirection%2==0) {[self rotate:1 :kView];}
                } else {
                    kidDirection-=1;
                    if(kidDirection%2==0) {[self rotate:1 :kView];}
                }
                
                if(kidDirection>=90) { 
                    turnLeft=false;
                }
                if(kidDirection<=0) { 
                    turnLeft=true;
                }
                /*
                NSLog(@"%i", kidDirection);
                if(kidDirection>=180) { turnLeft=false;}
                if(kidDirection<=0) { turnLeft=true;}
                 */
            
            }
        }
        kView.center=CGPointMake(kid.center.x, kid.center.y);
        if(level==4) {
            //placeholder for a better collision
            if(CGRectIntersectsRect(ninja.frame, kView.frame)&&(kidState==calm)) {
                dropped.center=CGPointMake(kid.center.x, kid.center.y);
                dropped.hidden=NO;
                kidState=running;
                kView.hidden=YES;
            }
        }
        //offscreen route for each level manually
        /*
        if(kidState==running) {
            //point a, b, c
            //for now
            [self escape:kid :CGPointMake(0, 50) :CGPointMake(0, 0) :CGPointMake(-10, -10)];
        }
         */
        [self collision];
        if(level==7) {
            [self levelSevenMovement];
        }
    }

    if (special<=0) {
        specialOFF=true;
        [self inverse:false];
        
    }
    if(!specialOFF) {
        special--;
    } else {
        if(special<=5 * 60)
        special+=(1/3);
    }
    
    
    move=true;
}

//level 7 movement
-(void)levelSevenMovement {
    
}

-(void)rotateSpeed:(NSInteger)speed:(NSInteger)degree:(UIImageView *)image {
    if (turnLeft) {
        [self rotate:1 :image];
        kidDirection++;
    } else {
        [self rotate:-1 :image];
        kidDirection--;
    }
        
    if (kidDirection==360) {
        turnLeft=false;
    }
    if (kidDirection==0) {
        turnLeft=false;
    }
    [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(rotateSpeed:speed:degree:image:) userInfo:nil repeats:NO];
}
-(void)collision {
    switch (level) {
        case 1:
            if (spotlight.hidden==NO)
                if(CGRectIntersectsRect(ninja.frame, spotlight.frame)) { gameState=gameOver;}
            if (spotlight_2.hidden==NO)
                if(CGRectIntersectsRect(ninja.frame, spotlight_2.frame)) { gameState=gameOver;}
            if (spotlight_3.hidden==NO)
                if(CGRectIntersectsRect(ninja.frame, spotlight_3.frame)) { gameState=gameOver;}
            if (spotlight_4.hidden==NO)
                if(CGRectIntersectsRect(ninja.frame, spotlight_4.frame)) { gameState=gameOver;}
            if (spotlight_5.hidden==NO)
                if(CGRectIntersectsRect(ninja.frame, spotlight_5.frame)) { gameState=gameOver;}
            if (spotlight_6.hidden==NO)
                if(CGRectIntersectsRect(ninja.frame, spotlight_6.frame)) { gameState=gameOver;}
            if (spotlight_7.hidden==NO)
                if(CGRectIntersectsRect(ninja.frame, spotlight_7.frame)) { gameState=gameOver;}
            if (spotlight_8.hidden==NO)
                if(CGRectIntersectsRect(ninja.frame, spotlight_8.frame)) { gameState=gameOver;}
            break;
        case 7:
            //make collision for everything if u want collision detection
            //gameState=gameOver; means u lose
            //mostly if statements here
            break;
            
        default:
            break;
    }
    
    if (spotlight.hidden==NO)
        if(CGRectIntersectsRect(ninja.frame, spotlight.frame)) { gameState=gameOver;}
    if (spotlight_2.hidden==NO)
        if(CGRectIntersectsRect(ninja.frame, spotlight_2.frame)) { gameState=gameOver;}
    if (spotlight_3.hidden==NO)
        if(CGRectIntersectsRect(ninja.frame, spotlight_3.frame)) { gameState=gameOver;}
    if (spotlight_4.hidden==NO)
        if(CGRectIntersectsRect(ninja.frame, spotlight_4.frame)) { gameState=gameOver;}
    if (spotlight_5.hidden==NO&&!level==7)
        if(CGRectIntersectsRect(ninja.frame, spotlight_5.frame)) { gameState=gameOver;}
    if (spotlight_6.hidden==NO)
        if(CGRectIntersectsRect(ninja.frame, spotlight_6.frame)) { gameState=gameOver;}
    if (spotlight_7.hidden==NO&&!level==7)
        if(CGRectIntersectsRect(ninja.frame, spotlight_7.frame)) { gameState=gameOver;}
    if (spotlight_8.hidden==NO)
        if(CGRectIntersectsRect(ninja.frame, spotlight_8.frame)) { gameState=gameOver;}

}
NSInteger runningPhrase=0;
//need to fix the speed of the movement
-(void)escape:(UIImageView *)image:(CGPoint)a:(CGPoint)b:(CGPoint)c {
    if(runningPhrase==0) {
        image.center=CGPointMake(image.center.x+(a.x-image.center.x), image.center.y+(a.y-image.center.y));
    if(image.center.x==a.x&&image.center.y==a.y)
        runningPhrase++;
    }
    
    if(runningPhrase==1)
        image.center=CGPointMake(image.center.x+(b.x-image.center.x), image.center.y+(b.y-image.center.y));
    if(image.center.x==b.x&&image.center.y==b.y)
        runningPhrase++;
    
    if(runningPhrase==3)
        image.center=CGPointMake(image.center.x+(c.x-image.center.x), image.center.y+(c.y-image.center.y));
    if(image.center.x==c.x&&image.center.y==c.y) {
        image.center=CGPointMake(0, -200);
        runningPhrase++;
        kidState=paused;
        kid.hidden=YES;
        runningPhrase=0;
    }
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(escape:image:a:b:c:) userInfo:nil repeats:NO];
}

//degrees
-(void)rotate:(NSInteger)degree:(UIImageView *)image {
    CGAffineTransform  transform = CGAffineTransformRotate(image.transform, degree);
    image.transform = transform;
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    NSLog(@"x : %g", acceleration.x);
    NSLog(@"y : %g", acceleration.y);
    NSLog(@"z : %g", acceleration.z);
    
    
    //delta.y = acceleration.y * 10;
    //delta.x = acceleration.x * 10;
    
    
}


- (double)distanceBetweenTwoPoints:(CGPoint)fromPoint toPoint:(CGPoint)toPoint {
    
    float x = toPoint.x - fromPoint.x;
    float y = toPoint.y - fromPoint.y;
    float xy = powf(x, 2)+powf(y, 2);
    return sqrt(xy);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    touchPoint= [touch locationInView:touch.view];
    NSUInteger tapCount = [touch tapCount];
    
    
    switch (tapCount) {
        case 1:
                //two options
                /*
                delta.x=(touchPoint.x-(self.view.bounds.size.width/2.0))/[self distanceBetweenTwoPoints:CGPointMake((self.view.bounds.size.width/2.0), (self.view.bounds.size.height/2.0)) toPoint:touchPoint];
                delta.y=(touchPoint.y-(self.view.bounds.size.height/2.0))/[self distanceBetweenTwoPoints:CGPointMake((self.view.bounds.size.width/2.0), (self.view.bounds.size.height/2.0)) toPoint:touchPoint];
                //NSLog(@"%f %f", delta.x, delta.y);
                 */
                delta.x=(touchPoint.x-ninja.center.x)/[self distanceBetweenTwoPoints:CGPointMake(ninja.center.x, ninja.center.y) toPoint:touchPoint];
                delta.y=(touchPoint.y-ninja.center.y)/[self distanceBetweenTwoPoints:CGPointMake(ninja.center.x, ninja.center.y) toPoint:touchPoint];
            break;
        case 2:
            
            specialOFF=false;
            [self inverse:true];

            touchPoint=CGPointMake(0, 0);
            delta.x=0;
            delta.y=0;
            break;
    }
        
    }
 
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    touchPoint=CGPointMake(0, 0);
    delta.x=0;
    delta.y=0;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    touchPoint= [touch locationInView:touch.view];
    //two options
    /*
     delta.x=(touchPoint.x-(self.view.bounds.size.width/2.0))/[self distanceBetweenTwoPoints:CGPointMake((self.view.bounds.size.width/2.0), (self.view.bounds.size.height/2.0)) toPoint:touchPoint];
     delta.y=(touchPoint.y-(self.view.bounds.size.height/2.0))/[self distanceBetweenTwoPoints:CGPointMake((self.view.bounds.size.width/2.0), (self.view.bounds.size.height/2.0)) toPoint:touchPoint];
     NSLog(@"%f %f", delta.x, delta.y);
     */
    
    delta.x=((touchPoint.x-ninja.center.x)/[self distanceBetweenTwoPoints:CGPointMake(ninja.center.x, ninja.center.y) toPoint:touchPoint])*4.0;
    delta.y=(touchPoint.y-ninja.center.y)/[self distanceBetweenTwoPoints:CGPointMake(ninja.center.x, ninja.center.y) toPoint:touchPoint]*4.0;
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
