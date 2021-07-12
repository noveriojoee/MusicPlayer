//
//  ViewController.m
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 11/07/21.
//

#import "MainViewController.h"
#import "MusicCardTableViewCell.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tfSearchField;
@property (weak, nonatomic) IBOutlet UITableView *tblView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tblView registerNib:[UINib nibWithNibName:@"MusicCardTableViewCell" bundle:[NSBundle bundleWithIdentifier:@"com.gid.BCGMusicPLayyer"]] forCellReuseIdentifier:@"song_item_template"];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

#pragma tableview delegates
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MusicCardTableViewCell *cell = [self.tblView dequeueReusableCellWithIdentifier:@"song_item_template" forIndexPath:indexPath];
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"testing");
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
}
#pragma end



@end
