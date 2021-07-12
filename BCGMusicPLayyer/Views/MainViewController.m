//
//  ViewController.m
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 11/07/21.
//

#import "MainViewController.h"
#import "MusicCardTableViewCell.h"
#import "Serializer.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate,AVAudioPlayerDelegate>

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
    
    NSURL *url = [NSURL URLWithString:self.viewModel.selectedMusic.previewUrl];
    NSData *soundData = [NSData dataWithContentsOfURL:url];
    self.viewModel.songPlayer = [[AVAudioPlayer alloc] initWithData:soundData  error:NULL];
    self.viewModel.songPlayer.delegate = self;
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
    [self.viewModel.songPlayer play];
    
    //    self.viewModel.songPlayer = [[AVPlayer alloc]initWithURL:[NSURL URLWithString:self.viewModel.selectedMusic.previewUrl]];
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(playerItemDidReachEnd:)
    //                                                 name:AVPlayerItemDidPlayToEndTimeNotification
    //                                               object:[self.viewModel.songPlayer currentItem]];
    //    [self.viewModel.songPlayer addObserver:self forKeyPath:@"status" options:0 context:nil];

    //
    //    [self.viewModel.songPlayer play];
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.modelsCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
}
#pragma end

-(void)updateProgress:(NSString*)temp{
    NSLog([@"currentTime" stringByAppendingString:[Serializer formattedDuration:self.viewModel.songPlayer.currentTime]]);
    NSLog([@"duration" stringByAppendingString:[Serializer formattedDuration:self.viewModel.songPlayer.duration]]);
    NSLog(@"xxx");
}
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [self.viewModel.songPlayer stop];
    NSLog(@"Finished Playing");
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
    NSLog(@"Error occured");
}


@end
