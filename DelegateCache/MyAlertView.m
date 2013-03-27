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
    
    // Initialize the Delegate Implementation Cache.
    [self _cacheMyDelegateImplementations];
}

- (id<MyDelegate>)mydelegate
{
    return _mydelegate;
}


static inline IMP getMethod(id o, SEL s)
{
    return [o respondsToSelector:s] ? [o methodForSelector:s] : 0;
}

- (void)_cacheMyDelegateImplementations
{
    MyDelegateImplementationCache *cache = &(_delegateCache);
    id delegate = self.mydelegate;
    
    
    if (!delegate) {
        bzero(cache, sizeof(MyDelegateImplementationCache));
        return;
    }
    
    // Get all the method's implecation and cache it in a struct.
    cache->logMessage = getMethod(delegate, @selector(logMessage:));
    cache->shouldDisMiss = getMethod(delegate, @selector(shouldDisMiss));
}

- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
    // Call the method from the delegate cache.
    CallDelegateString(_delegateCache.logMessage, self.delegate, @selector(logMessage:), @"the delegate method's impletation has been cached!\n");
    if (CallDelegateReturnBOOL(_delegateCache.shouldDisMiss, self.delegate, @selector(shouldDisMiss)))
        [super dismissWithClickedButtonIndex:buttonIndex animated:animated];
    else
        return;
}

@end
