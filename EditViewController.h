//
//  EditViewController.h
//  Favorite Things 2.0
//
//  Created by Jhaybie on 9/25/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditViewControllerDelegate

-(void) editString:(NSString *)text atIndex:(int)index;
- (IBAction)doneButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;

@end

@interface EditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) id <EditViewControllerDelegate> delegate;
@property (weak, nonatomic) NSString *passText;
@property int index;







@end
