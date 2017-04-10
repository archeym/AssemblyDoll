//
//  ViewController.m
//  AssemblyDoll
//
//  Created by NEXTAcademy on 3/31/17.
//  Copyright © 2017 ArchieApp. All rights reserved.
//

#import "ViewController.h"
#import "MovableImageView.h"

@interface ViewController ()<MovableImageViewDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //set delegate
    for (id subview in self.view.subviews){
        if([subview isKindOfClass:[MovableImageView class]]){
            ((MovableImageView*)subview).delegate = self;
            
        }
    }
}
#pragma mark - MovableImageViewDelegate
         -(void)didTapOnImageView:(MovableImageView *)head{
             [self.view bringSubviewToFront:head];
         }
@end
