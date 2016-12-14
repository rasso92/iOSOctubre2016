

#import "DogCustomTableViewCell.h"
#import "Dog.h"

@interface DogCustomTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *dogImageView;
@property (weak, nonatomic) IBOutlet UILabel *dogNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dogColorLabel;

@end

@implementation DogCustomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setupCellWithDogObject:(Dog*)dog{
    self.dogNameLabel.text = dog.name ;
    self.dogColorLabel.text = dog.color ;
    self.dogImageView.image = [UIImage imageNamed:dog.imageDog];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
