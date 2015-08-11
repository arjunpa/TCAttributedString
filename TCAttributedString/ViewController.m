#import "ViewController.h"
#import "NSMutableAttributedString+LocalizedHTMLString.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UILabel *fourthLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.firstLabel.attributedText = [NSMutableAttributedString attributedStringWithHTMLString:NSLocalizedString(@"FIRST_STRING", @"")];
    self.secondLabel.attributedText = [NSMutableAttributedString attributedStringWithHTMLString:NSLocalizedString(@"SECOND_STRING", @"") fontSize:12.0f];
    self.thirdLabel.attributedText = [NSMutableAttributedString attributedStringWithHTMLString:NSLocalizedString(@"THIRD_STRING", @"") fontSize:20.0f textColor:[UIColor redColor]];
    self.fourthLabel.attributedText = [NSMutableAttributedString attributedStringWithHTMLString:NSLocalizedString(@"FOURTH_STRING", @"") fontSize:24.0f textColor:[UIColor greenColor] textAlignment:NSTextAlignmentRight];
}

@end