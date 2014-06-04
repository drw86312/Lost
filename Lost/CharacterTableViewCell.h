//
//  CharacterTableViewCell.h
//  Lost
//
//  Created by David Warner on 6/3/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *actorLabel;
@property (weak, nonatomic) IBOutlet UILabel *characterLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *eyeColorLabel;
@property (weak, nonatomic) IBOutlet UILabel *hairColorLabel;
@property (weak, nonatomic) IBOutlet UILabel *passengerNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *seatNumLabel;

@end
