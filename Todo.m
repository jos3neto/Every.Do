//
//  Todo.m
//  Every.Do Rev1
//
//  Created by Jose on 30/11/17.
//  Copyright © 2017 Jose. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype) initWithTitle:(NSString*)title subtitle:(NSString*)subtitle priority:(NSInteger)priority andDoneStatus:(BOOL) isDone
{
    self = [super init];
    if (self) {
        _title = title;
        _subtitle = subtitle;
        _priority = priority;
        _isDone = isDone;
    }
    return self;
}

@end
