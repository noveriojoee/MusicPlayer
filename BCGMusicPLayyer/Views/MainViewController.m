//
//  ViewController.m
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 11/07/21.
//

#import "MainViewController.h"
#import "MusicCardTableViewCell.h"
#import "Serializer.h"

@interface MainViewController () <UITableViewDataSource, UITableViewDelegate,AVAudioPlayerDelegate, MusicCardDelegate>

@property (weak, nonatomic) IBOutlet CustomTextField *tfSearchField;
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property MusicCardTableViewCell* selectedCell;
@property (weak, nonatomic) IBOutlet UIView *playingView;
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;
@property (weak, nonatomic) IBOutlet UISlider *sliders;
@property (weak, nonatomic) IBOutlet UIButton *btnPause;


@property CGRect hiddenPlayingFrame;
@property CGRect showPlayingFrame;


@end

@implementation MainViewController

-(void)setTfSearchField:(CustomTextField *)tfSearchField{
    [tfSearchField bind:^(NSString *value) {
        self.viewModel.searchField = value;
    }];
    _tfSearchField = tfSearchField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [MainViewModel new];
    [self.tblView setDelegate:self];
    [self.tblView setDataSource:self];
    [self.tblView registerNib:[UINib nibWithNibName:@"MusicCardTableViewCell" bundle:[NSBundle bundleWithIdentifier:@"com.gid.BCGMusicPLayyer"]] forCellReuseIdentifier:@"song_item_template"];
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.hiddenPlayingFrame= CGRectMake(0, (self.view.frame.size.height), self.playingView.frame.size.width, (self.playingView.frame.size.height));
    self.showPlayingFrame = CGRectMake(0, (self.view.frame.size.height - self.playingView.frame.size.height), self.playingView.frame.size.width, self.playingView.frame.size.height);
    
    
    [self.viewModel searchMusicWithCompletion:^(NSString *response) {
        [self hideMusicView:nil];
        if([response isEqualToString:@"OK"]){
            [self.tblView reloadData];
        }
    }];
}

- (IBAction)btnFF:(id)sender {
}

- (IBAction)btnBF:(id)sender {
}

- (IBAction)btnPlay:(id)sender {
    [self.viewModel.songPlayer play];
    [self.btnPlay setHidden:YES];
    [self.btnPause setHidden:NO];
    
}
- (IBAction)btnPause:(id)sender {
    [self.viewModel.songPlayer pause];
    [self.selectedCell setTrackIsPause];
    [self.btnPause setHidden:YES];
    [self.btnPlay setHidden:NO];
    [self hideMusicView:sender];
}



#pragma tableview delegates
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MusicCardTableViewCell *cell = [self.tblView dequeueReusableCellWithIdentifier:@"song_item_template" forIndexPath:indexPath];
    if (indexPath.row < self.viewModel.modelsCount){
        MusicModel* musicItem = (MusicModel*)[self.viewModel.models objectAtIndex:indexPath.row];
        
        [cell setContentWithModel:musicItem cellIndex:indexPath.row withMusicCardDelegate:self];
        return cell;
    }else{
        return nil;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.modelsCount;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
}
#pragma end

#pragma MusicCardDelegate
-(void)playSelectedMusicFromCells : (MusicCardTableViewCell*)cell{
    if ([self playSongWithIndex:cell.cellindex clickWithButtonPlay:NO]){
        if (self.selectedCell != nil){
            [self.selectedCell setTrackIsStop];
        }
        self.selectedCell = cell;
        [cell setTrackIsPlay];
        [self.btnPlay setHidden:YES];
        [self.btnPause setHidden:NO];
        [self showMusicView:cell];
    }
}
#pragma end

#pragma avPlayerDelegate
-(BOOL)playSongWithIndex : (long)index clickWithButtonPlay : (BOOL)isClickButtonPlay{
    if (self.viewModel.isPlaying == NO){
        [self.viewModel setSelectedMusicWithIndex:index];
        NSURL *url = [NSURL URLWithString:self.viewModel.selectedMusic.previewUrl];
        NSData *soundData = [NSData dataWithContentsOfURL:url];
        self.viewModel.songPlayer = [[AVAudioPlayer alloc] initWithData:soundData  error:NULL];
        self.viewModel.songPlayer.delegate = self;
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
        [self.viewModel.songPlayer play];
        return YES;
    }
    return NO;
}
-(void)updateProgress:(NSString*)temp{
    NSLog(@"%f",self.viewModel.songPlayer.duration);
}
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    [self.viewModel.songPlayer stop];
    NSLog(@"Finished Playing");
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
    NSLog(@"Error occured");
}
#pragma end


#pragma MusicCommandUIView
-(void)showMusicView : (id)sender{
    [UIView animateWithDuration:0.25
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
        self.playingView.frame = self.showPlayingFrame;
        
        
    }
                     completion:^(BOOL finished){
        
    }];
}
-(void)hideMusicView : (id)sender{
    [UIView animateWithDuration:0.25
                          delay:0.1
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
        self.playingView.frame = self.hiddenPlayingFrame;
        
    }
                     completion:^(BOOL finished){
       
    }];
}
#pragma end


@end
