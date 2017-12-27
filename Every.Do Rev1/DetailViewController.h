//
//  DetailViewController.h
//  Every.Do Rev1
//
//  Created by Jose on 6/12/17.
//  Copyright © 2017 Jose. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
@class TableViewController;

@interface DetailViewController : UIViewController
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* priority;
@property (strong, nonatomic) TableViewController* tableVC;
@property NSInteger index;
@end
