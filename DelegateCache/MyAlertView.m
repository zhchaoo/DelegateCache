//
//  MyAlert.m
//  DelegateCache
//
//  Created by zhouchao on 13-3-26.
//  Copyright (c) 2013年 zhouchao. All rights reserved.
//

#import "MyAlertView.h"

@implementation MyAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setMydelegate:(id<MyDelegate>)mydelegate
{
    _mydelegate = mydelegate;
    
    [self _cacheFrameLoadDelegateImplementations];
}

- (id<MyDelegate>)mydelegate
{
    return _mydelegate;
}


static inline IMP getMethod(id o, SEL s)

{
    
    return [o respondsToSelector:s] ? [o methodForSelector:s] : 0;
}

- (void)_cacheFrameLoadDelegateImplementations
{
    MyDelegateImplementationCache *cache = &(_delegateCache);
    id delegate = self.mydelegate;
    
    
    if (!delegate) {
        bzero(cache, sizeof(MyDelegateImplementationCache));
        return;
    }
    
    cache->logMessage = getMethod(delegate, @selector(logMessage:));
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
//    [self.mydelegate logMessage:@"dismiss!!!!!\n"];
    CallDelegateString(_delegateCache.logMessage, self.delegate, @selector(logMessage:), @"dismiss!!!!!\n");
    NSLog(@"%s\n", __FUNCTION__);
    
    [super dismissWithClickedButtonIndex:buttonIndex animated:animated];
}

@end