//
//  EditViewController.m
//  Favorite Things 2.0
//
//  Created by Jhaybie on 9/25/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end



@implementation EditViewController
@synthesize  textField, index, delegate, passText;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {}
    return self;
}



- (IBAction)doneButtonPressed:(id)sender
{
    [delegate editString: textField.text
                 atIndex: index];
}


- (IBAction)cancelButtonPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated: YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    textField.text = passText;
}


@end
