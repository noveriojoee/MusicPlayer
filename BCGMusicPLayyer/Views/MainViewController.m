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
@property (weak, nonatomic) IBOutlet UIView *playingView;
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;
@property (weak, nonatomic) IBOutlet UISlider *sliders;
@property (weak, nonatomic) IBOutlet UIButton *btnPause;
@property (weak, nonatomic) IBOutlet UISlider *slMusicTimeLine;

@property MusicCardTableViewCell* selectedCell;
@property NSTimer *timer;
@property CGRect hiddenPlayingFrame;
@property CGRect showPlayingFrame;
@property CGFloat lastContentOffset;

@end

@implementation MainViewController

-(void)setTfSearchField:(CustomTextField *)tfSearchField{
    [tfSearchField bind:^(NSString *value) {
        self.viewModel.searchField = value;
    }];
    
    [tfSearchField bindOnEndValueChange:^(NSString *value) {
        NSLog(@"end");
        [self.viewModel searchMusicWithCompletion:^(NSString *response) {
            if([response isEqualToString:@"OK"]){
                [self.tblView reloadData];
            }
        }];
    }];
    _tfSearchField = tfSearchField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [MainViewModel new];
    
    
    self.slMusicTimeLine.maximumValue = 0;
    [self.tblView setDelegate:self];
    [self.tblView setDataSource:self];
    [self.tblView registerNib:[UINib nibWithNibName:@"MusicCardTableViewCell" bundle:[NSBundle bundleWithIdentifier:@"com.gid.BCGMusicPLayyer"]] forCellReuseIdentifier:@"song_item_template"];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.hiddenPlayingFrame= CGRectMake(0, (self.view.frame.size.height), self.playingView.frame.size.width, (self.playingView.frame.size.height));
    self.showPlayingFrame = CGRectMake(0, (self.view.frame.size.height - self.playingView.frame.size.height), self.playingView.frame.size.width, self.playingView.frame.size.height);
    
    
    [self.viewModel searchMusicWithCompletion:^(NSString *response) {
        [self showMusicView:nil];
        if([response isEqualToString:@"OK"]){
            [self.tblView reloadData];
            
        }
    }];
}


- (IBAction)btnFF:(id)sender {
    if (self.viewModel.selectedIndexSong < self.viewModel.modelsCount){
        NSIndexPath* selectedCellIndexPath= [NSIndexPath indexPathForRow:self.viewModel.selectedIndexSong+1 inSection:0];
        [self.tblView selectRowAtIndexPath:selectedCellIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
}

- (IBAction)btnBF:(id)sender {
    if (self.viewModel.selectedIndexSong > 0){
        NSIndexPath* selectedCellIndexPath= [NSIndexPath indexPathForRow:self.viewModel.selectedIndexSong-1 inSection:0];
        [self.tblView selectRowAtIndexPath:selectedCellIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
}

- (IBAction)btnPlay:(id)sender {
    if (self.viewModel.selectedIndexSong == 0){
        //no music are selected, then play the first row
        NSIndexPath* selectedCellIndexPath= [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tblView selectRowAtIndexPath:selectedCellIndexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
    if ([self playSongWithIndex:self.viewModel.selectedIndexSong clickWithButtonPlay:YES]){
        [self.btnPlay setHidden:YES];
        [self.btnPause setHidden:NO];
        [self.selectedCell setTrackIsPlay];
    };
    
}
- (IBAction)btnPause:(id)sender {
    if ([self playSongWithIndex:self.viewModel.selectedIndexSong clickWithButtonPlay:YES] == NO){
        [self.selectedCell setTrackIsPause];
        [self.btnPause setHidden:YES];
        [self.btnPlay setHidden:NO];
    };
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

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.lastContentOffset = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.lastContentOffset < scrollView.contentOffset.y){
        [self hideMusicView:scrollView];
    }else if (self.lastContentOffset > scrollView.contentOffset.y){
        [self showMusicView:scrollView];
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
    self.viewModel.selectedIndexSong = cell.cellindex;
    if ([self playSongWithIndex:self.viewModel.selectedIndexSong clickWithButtonPlay:NO]){
        if (self.selectedCell != nil){
            [self.selectedCell setTrackIsStop];
        }
        self.selectedCell = cell;
        [self.btnPlay setHidden:YES];
        [self.btnPause setHidden:NO];
        [self.selectedCell setTrackIsPlay];
        [self showMusicView:cell];
    }
}
#pragma end

#pragma avPlayerDelegate
-(BOOL)playSongWithIndex : (long)index clickWithButtonPlay : (BOOL)isClickButtonPlay{
    BOOL returnValue = NO;
    if (isClickButtonPlay){
        //Click by play and pause button
        if (self.viewModel.isPlaying == NO){
            if (self.viewModel.selectedMusic != nil){
                [self.viewModel setSelectedMusicWithIndex:index];
                [self.viewModel playTrack];
                returnValue = YES;
            }
        }else if(self.viewModel.selectedIndexSong!=index){
            //pressing button bf and ff
            self.viewModel.selectedIndexSong = index;
            [self.viewModel playNewTrackWithIndex:self.viewModel.selectedIndexSong delegate:self];
            returnValue = YES;
        }else{
            [self.viewModel pauseTrack];
            returnValue = NO;
        }
    }else{
        //Click by table row
            [self.viewModel playNewTrackWithIndex:self.viewModel.selectedIndexSong delegate:self];
            returnValue = YES;
    }
    
    if (returnValue == YES){
        self.slMusicTimeLine.value = 0;
        self.slMusicTimeLine.maximumValue = self.viewModel.songPlayer.duration;
        
    }
    
    return returnValue;
}

-(void)updateProgress:(NSString*)temp{
    NSLog(@"%f",self.viewModel.songPlayer.duration);
    self.slMusicTimeLine.value = self.slMusicTimeLine.value + 0.1;
    if (self.slMusicTimeLine.value == self.slMusicTimeLine.maximumValue){
        //Stop the track when it reach maximum
        if ([self.viewModel stopTrack] == YES){
            [self btnFF:nil];
        }
    }
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
