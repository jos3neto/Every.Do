//
//  TableViewController.h
//  Every.Do Rev1
//
//  Created by Jose on 30/11/17.
//  Copyright © 2017 Jose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
#import "CustomCell.h"
#import "DetailViewController.h"
#import "AddTodoViewController.h"

@interface TableViewController : UITableViewController
@property NSMutableArray<Todo*>* dataObjects;
@end
