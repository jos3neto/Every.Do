//
//  AddTodoViewController.m
//  Every.Do Rev1
//
//  Created by Jose on 15/12/17.
//  Copyright © 2017 Jose. All rights reserved.
//

#import "AddTodoViewController.h"

@interface AddTodoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextView *subtitleField;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (strong, nonatomic) Todo* todo;
@property (strong, nonatomic) UIToolbar* toolBar;
@end

@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleField.delegate = self;
    self.subtitleField.delegate = self;
    
    self.titleField.layer.cornerRadius=8.0f; //the view is the layer's delegate
    self.titleField.layer.masksToBounds=YES;
    // this is Apple's default blue
    self.titleField.layer.borderColor=[[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor];
    self.titleField.layer.borderWidth= 1.0f;
    
    self.subtitleField.layer.cornerRadius=8.0f;
    self.subtitleField.layer.masksToBounds=YES;
    self.subtitleField.layer.borderColor=[[UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0] CGColor];
    self.subtitleField.layer.borderWidth= 1.0f;
    
    self.toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(didClickDone)];
    UIBarButtonItem* emptySpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self.toolBar setItems:[NSArray arrayWithObjects:emptySpace,doneButton,nil]];
    //[self.toolBar sizeToFit];
    //self.toolBar.barStyle = UIBarStyleBlackTranslucent;

    self.todo = [Todo new];
}

- (IBAction)priorityStepper:(UIStepper *)sender {
    self.priorityLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
    self.todo.priority = (int)sender.value;
}

- (IBAction)saveButton:(UIButton *)sender {
    self.todo.isDone = NO;
    [self.delegate didAddTodo:self.todo];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    self.todo.title = textField.text;
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    [textView setInputAccessoryView:self.toolBar];
    return YES;
}

-(void) didClickDone {
    self.todo.subtitle = self.subtitleField.text;
    [self.subtitleField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
