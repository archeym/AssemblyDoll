//
//  MovableImageView.m
//  AssemblyDoll
//
//  Created by NEXTAcademy on 3/31/17.
//  Copyright © 2017 ArchieApp. All rights reserved.
//

#import "MovableImageView.h"

@interface MovableImageView()<UIGestureRecognizerDelegate>
@end

@implementation MovableImageView 

-(void)awakeFromNib{
    [super awakeFromNib];
    //add gesture here
    [self setUserInteractionEnabled:YES];
    //2.steps
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:pan];
     UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)];
    [self addGestureRecognizer:pinch];
    
    UIRotationGestureRecognizer *route = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleRoute:)];
    [self addGestureRecognizer:route];
    
    [pan setDelegate:self];
    [pinch setDelegate:self];
    [route setDelegate:self];
   
}

-(IBAction)handlePan:(UIPanGestureRecognizer*)sender{
    if(sender.state == UIGestureRecognizerStateBegan){
        [self.delegate didTapOnImageView:self];
    }else if (sender.state == UIGestureRecognizerStateChanged){
        
        CGPoint translation = [sender translationInView:sender.view];
        NSLog(@"x: %f, y: %f", translation.x, translation.y);
        
        self.transform = CGAffineTransformTranslate(self.transform, translation.x, translation.y);
        
        [sender setTranslation:CGPointZero inView:sender.view];
    }
}
-(IBAction)handlePinch:(UIPinchGestureRecognizer*)sender{
    if(sender.state == UIGestureRecognizerStateBegan){
        [self.delegate didTapOnImageView:self];
    }else if (sender.state == UIGestureRecognizerStateChanged){
        //get scale
        CGFloat scale = sender.scale;
        //apply transform to uiview
        self.transform = CGAffineTransformScale(self.transform, scale, scale);
        //set back to origin
        [sender setScale:1.0];
    }
}
-(IBAction)handleRoute:(UIRotationGestureRecognizer*)sender{
    if(sender.state == UIGestureRecognizerStateBegan){
        [self.delegate didTapOnImageView:self];
    }else if (sender.state == UIGestureRecognizerStateChanged){
        CGFloat rotation = sender.rotation;
        self.transform = CGAffineTransformRotate(self.transform, rotation);
        [sender setRotation:0];
    }
}
#pragma mark- Gesture delegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}
@end
