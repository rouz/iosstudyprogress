

#import "vc2.h"
#import "MyPlayManager.h"

@interface vc2 ()

@end

@implementation vc2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc{
    NSLog(@"vc2.dealloc");
}

- (void)viewDidLoad
{
    NSLog(@"vc2.viewDidLoad");
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"vc2.viewDidAppear1");
    
    [super viewDidAppear:animated];
    
    if (self.isMovingToParentViewController){
        NSLog(@"vc2.viewDidAppear2");
        [[MyPlayManager sharedManager] setupPlayer:^(bool success) {
            NSLog(@"vc2.setupPlayer.complete success=%d",success);
        }];
    }
    
    NSLog(@"vc2.viewDidAppear3");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startPlayingTapped:(id)sender {
    NSLog(@"vc2.startPlayingTapped");
    
    [[MyPlayManager sharedManager] startPlaying:^(bool success) {
        NSLog(@"vc2.startPlaying.complete.success = %d", success);
    }];
}

@end
