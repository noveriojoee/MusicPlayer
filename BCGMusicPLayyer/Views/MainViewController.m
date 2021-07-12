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
    self.viewModel = [MainViewModel new];
    [self.tblView setDelegate:self];
    [self.tblView setDataSource:self];
    [self.tblView registerNib:[UINib nibWithNibName:@"MusicCardTableViewCell" bundle:[NSBundle bundleWithIdentifier:@"com.gid.BCGMusicPLayyer"]] forCellReuseIdentifier:@"song_item_template"];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.viewModel searchMusicWithCompletion:^(NSString *response) {
        if([response isEqualToString:@"OK"]){
            [self.tblView reloadData];
        }
    }];
}

#pragma tableview delegates
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MusicCardTableViewCell *cell = [self.tblView dequeueReusableCellWithIdentifier:@"song_item_template" forIndexPath:indexPath];
    if (indexPath.row < self.viewModel.modelsCount){
        MusicModel* musicItem = (MusicModel*)[self.viewModel.models objectAtIndex:indexPath.row];
        
        [cell setContentWithModel:musicItem withMusicCardDelegate:self];
        return cell;
    }else{
        return nil;
    }
    
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewModel setSelectedMusicWithIndex:indexPath.row];
    [self.viewModel playselectedsong];

}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.modelsCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
}
#pragma end


@end
