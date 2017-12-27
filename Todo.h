//
//  Todo.h
//  Every.Do Rev1
//
//  Created by Jose on 30/11/17.
//  Copyright © 2017 Jose. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property NSString* title;
@property NSString* subtitle;
@property NSInteger priority;
@property BOOL isDone;

-(instancetype) initWithTitle:(NSString*)title subtitle:(NSString*)subtitle priority:(NSInteger)priority andDoneStatus:(BOOL) isDone;

@end
