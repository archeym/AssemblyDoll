//
//  MovableImageView.h
//  AssemblyDoll
//
//  Created by NEXTAcademy on 3/31/17.
//  Copyright © 2017 ArchieApp. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MovableImageView;
@protocol MovableImageViewDelegate <NSObject>

-(void)didTapOnImageView:(MovableImageView*) head;

@end

@interface MovableImageView : UIImageView
@property(weak, nonatomic) id <MovableImageViewDelegate> delegate;
@end
