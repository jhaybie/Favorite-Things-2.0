//
//  ViewController.m
//  Favorite Things 2.0
//
//  Created by Jhaybie on 9/24/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *faveView;
@property (strong, nonatomic) NSMutableArray     *faveArray;

- (IBAction)addPressed:(id)sender;
- (IBAction)removePressed:(id)sender;
- (IBAction)returnPressed:(id)sender;

@end

@implementation ViewController

@synthesize textField, faveArray,faveView;


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [faveArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *arrayIdentifier = @"abc";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: arrayIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:arrayIdentifier];
    }
    
    cell.textLabel.text = faveArray[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditViewController *editViewController = [[EditViewController alloc] initWithNibName: @"EditViewController" bundle: nil];
    editViewController.delegate = self;
    editViewController.index = indexPath.row;
    editViewController.passText = faveArray[indexPath.row];
    [tableView reloadData];
    [self.navigationController pushViewController: editViewController
                                         animated:YES];
}


-(void)editString:(NSString *)text atIndex:(int)index
{
    faveArray[index] = text;
    [faveView reloadData];
    [self.navigationController popViewControllerAnimated: YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)text
{
    [self.view endEditing:YES];
    [faveArray addObject:textField.text];
    [faveView reloadData];
    textField.text = @"";
    [textField becomeFirstResponder];
    return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    textField.delegate = self;
    faveArray = [[NSMutableArray alloc] init];
    [textField becomeFirstResponder];
}


- (IBAction)addPressed:(id)sender
{
    [self.view endEditing:YES];
    [faveArray addObject: textField.text];
    textField.text = @"";
    [faveView reloadData];
    [textField becomeFirstResponder];
}

- (IBAction)removePressed:(id)sender
{
    int index = [faveArray count] - 1;
    if (index >= 0)
    {
        [faveArray removeObject:faveArray[index]];
        [faveView reloadData];
    }
}


- (IBAction)returnPressed:(id)sender
{}





@end
