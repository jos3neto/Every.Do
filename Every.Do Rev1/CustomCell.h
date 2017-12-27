//
//  CustomCell.h
//  Every.Do Rev1
//
//  Created by Jose on 1/12/17.
//  Copyright © 2017 Jose. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property BOOL isDone;

@end
