//
//  TWViewController.m
//  TWA
//
//  Created by Wathik Almayali on 7/16/14.
//  Copyright (c) 2014 Wathik Almayali. All rights reserved.
//

#import "TWViewController.h"
#

@interface TWViewController ()
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *userpassord;

@end

@implementation TWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)SaveUser:(UIButton *)sender {
       PFObject *login = [PFObject objectWithClassName:@"login"];
    login[@"name"] = self.username.text;
    login[@"password"] = self.userpassord.text;
    [login saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        if (succeeded){
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"save" message:@"You object saved" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:
           nil];
                [alertView show];
            NSLog(@"save succesful");
        }
    
        else if (error){
            NSLog(@" %@" , error);
        
        }
        
     }];
    
}

@end
