//
//  AddCharacterViewController.m
//  Lost
//
//  Created by David Warner on 6/3/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "AddCharacterViewController.h"

@interface AddCharacterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *actorInputTextField;
@property (weak, nonatomic) IBOutlet UITextField *passengerInputTextField;

@end

@implementation AddCharacterViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onAddCharButtonPressed:(id)sender
{
    NSManagedObject *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character"inManagedObjectContext:self.managedObjectContext];

    NSString *actor = self.actorInputTextField.text;
    NSString *passenger = self.passengerInputTextField.text;

    [character setValue:actor forKeyPath:@"actor"];
    [character setValue:passenger forKeyPath:@"passenger"];
    [self.actorInputTextField resignFirstResponder];
    [self.passengerInputTextField resignFirstResponder];

}


@end
