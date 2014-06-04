
#import "MasterViewController.h"
#import "AddCharacterViewController.h"
#import "CharacterTableViewCell.h"


@interface MasterViewController() <UITableViewDataSource>

@property NSMutableArray *pListArray;
@property NSArray *allCharacters;

@end

@implementation MasterViewController

-(void)viewDidLoad
{
    [self load];

    if (self.allCharacters.count < 1)
    {
        [self loadpList];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allCharacters.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CharacterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSManagedObject *character = [self.allCharacters objectAtIndex:indexPath.row];

    cell.actorLabel.text = [character valueForKey:@"actor"];
    cell.characterLabel.text = [character valueForKey:@"passenger"];
    cell.eyeColorLabel.text = [character valueForKey:@"eyeColor"];
    cell.hairColorLabel.text = [character valueForKey:@"hairColor"];
    cell.seatNumLabel.text = [character valueForKey:@"seatNum"];

    NSString *age = [NSString stringWithFormat:@"%@", [character valueForKey:@"age"]];
    cell.ageLabel.text = age;
    NSString *passNum = [NSString stringWithFormat:@"%@", [character valueForKey:@"passengerNum"]];
    cell.passengerNumLabel.text = passNum;

    return cell;
}

-(void)load
{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Character"];
    NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc] initWithKey:@"actor" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObjects: sortDescriptor1, nil];

    self.allCharacters = [self.managedObjectContext executeFetchRequest:request error:nil];
    [self.managedObjectContext save:nil];
    [self.tableView reloadData];
}

-(void)loadpList
{       self.pListArray = [NSMutableArray new];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"lost" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];

        for (NSDictionary *dictionary in array) {

            NSString *actor = [dictionary objectForKey:@"actor"];
            NSString *passenger = [dictionary objectForKey:@"passenger"];

            NSManagedObject *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:self.managedObjectContext];

            [character setValue:actor forKeyPath:@"actor"];
            [character setValue:passenger forKeyPath:@"passenger"];

            [self.pListArray addObject:character];
        }

    self.allCharacters = [NSArray arrayWithArray:self.pListArray];
    [self.tableView reloadData];
}

-(IBAction)unwindSegue:(UIStoryboardSegue *)sender
{
    AddCharacterViewController *sourceVC = sender.sourceViewController;
    self.managedObjectContext = sourceVC.managedObjectContext;
    [self load];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier  isEqual: @"addview"]) {

        AddCharacterViewController *destinationVC = segue.destinationViewController;
        destinationVC.managedObjectContext = self.managedObjectContext;
    }
}

@end


