//
//  MyAlert.h
//  DelegateCache
//
//  Created by zhouchao on 13-3-26.
//  Copyright (c) 2013年 zhouchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateImplementation.h"

@protocol MyDelegate <NSObject>

- (void)logMessage:(NSString*) message;

@end

@interface MyAlertView : UIAlertView
{
    id<MyDelegate> _mydelegate;
    MyDelegateImplementationCache _delegateCache;
}

@property (nonatomic, assign) id<MyDelegate> mydelegate;

- (void)setMydelegate:(id<MyDelegate>)mydelegate;

@end
