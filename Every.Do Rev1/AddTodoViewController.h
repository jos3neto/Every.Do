//
//  AddTodoViewController.h
//  Every.Do Rev1
//
//  Created by Jose on 15/12/17.
//  Copyright © 2017 Jose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol AddTodoDelegate <NSObject>
-(void) didAddTodo:(Todo*)todo;
@end

@interface AddTodoViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>
@property id<AddTodoDelegate>delegate;
@end
