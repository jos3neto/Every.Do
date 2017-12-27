//
//  TableViewController.m
//  Every.Do Rev1
//
//  Created by Jose on 30/11/17.
//  Copyright © 2017 Jose. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController()
@property NSInteger index;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Todo* todo0 = [[Todo alloc] initWithTitle:@"Mow lawn" subtitle:@"Lawn is really tall" priority:3 andDoneStatus:NO];
    Todo* todo1 = [[Todo alloc] initWithTitle:@"Buy cat food" subtitle:@"Don't buy Alpo" priority:1 andDoneStatus:NO];
    Todo* todo2 = [[Todo alloc] initWithTitle:@"Write article" subtitle:@"Weekly blog article" priority:2 andDoneStatus:YES];
    Todo* todo3 = [[Todo alloc] initWithTitle:@"Code that nice app" subtitle:@"The table view app" priority:1 andDoneStatus:YES];
    Todo* todo4 = [[Todo alloc] initWithTitle:@"Play video games" subtitle:@"Best to-do" priority:4 andDoneStatus:YES];
    
    self.dataObjects = [[NSMutableArray alloc] initWithObjects:todo0,todo1,todo2,todo3,todo4,nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//return the number of rows
    return self.dataObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell* cell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    
    cell.priorityLabel.text = [NSString stringWithFormat:@"%ld", self.dataObjects[indexPath.row].priority];
    cell.titleLabel.text = self.dataObjects[indexPath.row].title;
    cell.subtitleLabel.text = self.dataObjects[indexPath.row].subtitle;
    cell.isDone = self.dataObjects[indexPath.row].isDone;
    
    //Attributed strings for conditional formatting
    NSNumber* isDone = cell.isDone ? @1 : @0;
    NSDictionary* attributeDic = @{NSStrikethroughStyleAttributeName: isDone};
    NSAttributedString* attributedTitle = [[NSAttributedString alloc] initWithString:cell.titleLabel.text attributes:attributeDic];
    cell.titleLabel.attributedText = attributedTitle;
    
    NSAttributedString* attributedSubtitle = [[NSAttributedString alloc] initWithString:cell.subtitleLabel.text attributes:attributeDic];
    cell.subtitleLabel.attributedText = attributedSubtitle;
    
    //Init and add swipe gesture
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipeCell)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [cell addGestureRecognizer:swipe];
    
    return cell;
    
    //Use these two lines for the default UITableViewCell* cell
    //[cell.textLabel setText:self.dataObjects[indexPath.row].title];
    //[cell.detailTextLabel setText:self.dataObjects[indexPath.row].subtitle];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.index = indexPath.row;
}

-(void)didSwipeCell {
    self.dataObjects[self.index].isDone = YES;
    [self.tableView reloadData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(CustomCell*)sender {
    
    if([[segue identifier] isEqualToString:@"detailSegue"]) {
        DetailViewController* detailVC = [segue destinationViewController];
        NSIndexPath* index = [self.tableView indexPathForCell:sender];
        detailVC.name = self.dataObjects[index.row].title;
        detailVC.priority = [NSString stringWithFormat:@"%ld", self.dataObjects[index.row].priority];
        
        detailVC.tableVC = self;
        detailVC.index = index.row;
    }
    
    if([[segue identifier] isEqualToString:@"addSegue"]) {
        AddTodoViewController* addTodoVC = [segue destinationViewController];
        addTodoVC.delegate = [segue sourceViewController];
    }
}

-(void) didAddTodo:(Todo*)todo {
    [self.dataObjects insertObject:todo atIndex:0];
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
