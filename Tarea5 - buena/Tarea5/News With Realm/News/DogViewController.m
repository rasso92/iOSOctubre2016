#import "DogViewController.h"
#import "DogCustomTableViewCell.h"
#import "Dog.h"
#import "RealmManager.h"
#import "AddDogsTableViewController.h"

#define CUSTOM_CELL_ID @"DogCustomTableViewCell"

@interface DogViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property RLMResults *dogsArray;
@end

@implementation DogViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"Perros";
    [self registerCell];
    [self initializeDogArray];
    [self createAddNewsUIBarButtonItem];
    [self.tableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [self loadNewDogs];
}

-(void)loadNewDogs{
     [self.tableView reloadData];
}

-(void)registerCell{
    UINib *nib = [UINib nibWithNibName:CUSTOM_CELL_ID bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CUSTOM_CELL_ID];
}
-(void)createAddNewsUIBarButtonItem{
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
    self.navigationItem.rightBarButtonItem = addItem;
}
-(void)addItem{
    AddDogsTableViewController *addDogsTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AddDogsTableViewController"];
    [self.navigationController pushViewController:addDogsTableViewController
                                         animated:YES];
}

-(void)initializeDogArray{
    self.dogsArray = [RealmManager getAllDogs];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dogsArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DogCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CUSTOM_CELL_ID];
    Dog *dogToShow = self.dogsArray[indexPath.row];
    [cell setupCellWithDogObject:dogToShow];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   /* NewsViewController * newsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewsViewController"];
    Category *categorySelected = self.categoryArray[indexPath.row];
    newsViewController.categoryName = categorySelected.categoryTitle;
    [self.navigationController pushViewController:newsViewController animated:YES];*/
}


@end
