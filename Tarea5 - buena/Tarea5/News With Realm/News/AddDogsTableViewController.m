

#import "AddDogsTableViewController.h"
#import "RealmManager.h"

@interface AddDogsTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *colorLabel;

@end

@implementation AddDogsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSaveUIBarButtonItem];
}

-(void)addSaveUIBarButtonItem{
    UIBarButtonItem *saveBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNews)];
    self.navigationItem.rightBarButtonItem = saveBarButtonItem;
}

-(void)saveNews{
    [RealmManager createDogswithName:self.titleTextField.text color:self.colorLabel.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
}

#pragma mark - Table view data source

@end
