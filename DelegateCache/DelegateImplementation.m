//
//  DelegateImplementation.m
//  DelegateCache
//
//  Created by zhouchao on 13-3-26.
//  Copyright (c) 2013年 zhouchao. All rights reserved.
//

#import "DelegateImplementation.h"
#import <objc/message.h>

void ReportDiscardedDelegateException(SEL delegateSelector, id exception)
{
    if ([exception isKindOfClass:[NSException class]])
        NSLog(@"*** Discarded an uncaught exception in the %s delegate: <%@> %@",
              sel_getName(delegateSelector), [exception name], [exception reason]);
    else
        NSLog(@"*** Discarded an uncaught exception in the %s delegate: %@",
              sel_getName(delegateSelector), exception);
}

id CallDelegateString(IMP impletation, id delegate, SEL selector, NSString* arg1)
{
    if (!delegate || ![delegate respondsToSelector:selector])
        return nil;
    @try {
        id result =(id)((id (*)(id, SEL, NSString*))(impletation)(delegate, @selector(selector), arg1));
        return result;
        
        
    } @catch(id exception) {
        ReportDiscardedDelegateException(selector, exception);
    }
    return nil;
}

BOOL CallDelegateReturnBOOL(IMP impletation, id delegate, SEL selector)
{
    if (!delegate || ![delegate respondsToSelector:selector])
        return NO;
    @try {
        BOOL result =(BOOL)((BOOL (*)(id, SEL))(impletation)(delegate, @selector(selector)));
        return result;
    } @catch(id exception) {
        ReportDiscardedDelegateException(selector, exception);
    }
    return NO;
}
