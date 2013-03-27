//
//  DelegateImplementation.h
//  DelegateCache
//
//  Created by zhouchao on 13-3-26.
//  Copyright (c) 2013年 zhouchao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct _MyDelegateImplementationCache {
    IMP logMessage;
} MyDelegateImplementationCache;

id CallDelegateString(IMP impletation, id delegate, SEL selector, NSString* arg1);
