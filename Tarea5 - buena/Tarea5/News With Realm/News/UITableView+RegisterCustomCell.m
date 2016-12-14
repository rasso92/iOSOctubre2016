
#import "UITableView+RegisterCustomCell.h"

@implementation UITableView (RegisterCustomCell)


-(void)registerCellWithIdentifier:(NSString*)identifier{
    UINib *nib = [UINib nibWithNibName:identifier bundle:nil];
    [self registerNib:nib forCellReuseIdentifier:identifier];
}

@end
