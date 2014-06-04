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
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *passengerNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *seatNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *hairColorTextField;
@property (weak, nonatomic) IBOutlet UITextField *eyeColorTextField;

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
    NSString *eyeColor = self.eyeColorTextField.text;
    NSString *hairColor = self.hairColorTextField.text;
    NSString *seatNum = self.seatNumTextField.text;
    int age = [self.ageTextField.text intValue];
    NSNumber *ageNum = [NSNumber numberWithInt:age];
    int pass = [self.passengerNumTextField.text intValue];
    NSNumber *passNum = [NSNumber numberWithInt:pass];

    [character setValue:actor forKeyPath:@"actor"];
    [character setValue:passenger forKeyPath:@"passenger"];
    [character setValue:eyeColor forKeyPath:@"eyeColor"];
    [character setValue:hairColor forKeyPath:@"hairColor"];
    [character setValue:seatNum forKeyPath:@"seatNum"];
    [character setValue:ageNum forKeyPath:@"age"];
    [character setValue:passNum forKeyPath:@"passengerNum"];

    [self.actorInputTextField resignFirstResponder];
    [self.passengerInputTextField resignFirstResponder];
    [self.ageTextField resignFirstResponder];
    [self.passengerNumTextField resignFirstResponder];
    [self.seatNumTextField resignFirstResponder];
    [self.eyeColorTextField resignFirstResponder];
    [self.hairColorTextField resignFirstResponder];
}


@end
