//
//  MainViewModel.m
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 11/07/21.
//

#import "MainViewModel.h"
#import "GetMusicAPI.h"
#import <AVKit/AVKit.h>

@interface MainViewModel()
@property AVPlayer *songPlayer;
@property MusicModel* selectedMusic;
@end

@implementation MainViewModel
-(id)init{
    if (self == [super init]){
        self.modelsCount = 0;
        self.searchField = @"";
        self.songList = [NSMutableArray new];
        
    }
    return self;
}

-(void)setSelectedMusicWithIndex : (int)itemIndex{
    self.selectedMusic = [self.models objectAtIndex:itemIndex];
}

-(void)searchMusicWithCompletion : (void (^)(NSString*))onComplete{
    [GetMusicAPI.sharedManager searchMusicWithStringParam:self.searchField onCompletion:^(DTOGetMusic *apiResponse) {
        if ([apiResponse.apiResponseCode isEqualToString:@"200"]){
            if (apiResponse.results != nil){
                self.models = apiResponse.results;
                self.modelsCount = [apiResponse.results count];

                onComplete(@"OK");
            }
        }else{
            onComplete(@"Failed To Fetch Music");
        }
    }];
}

-(void)playselectedsong{
    AVPlayer *player = [[AVPlayer alloc]initWithURL:[NSURL URLWithString:self.selectedMusic.previewUrl]];
    self.songPlayer = player;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playerItemDidReachEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:[self.songPlayer currentItem]];
    [self.songPlayer addObserver:self forKeyPath:@"status" options:0 context:nil];
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];

    [self.songPlayer play];
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//
//    if (object == songPlayer && [keyPath isEqualToString:@"status"]) {
//        if (songPlayer.status == AVPlayerStatusFailed) {
//            NSLog(@"AVPlayer Failed");
//
//        } else if (songPlayer.status == AVPlayerStatusReadyToPlay) {
//            NSLog(@"AVPlayerStatusReadyToPlay");
//
//
//        } else if (songPlayer.status == AVPlayerItemStatusUnknown) {
//            NSLog(@"AVPlayer Unknown");
//
//        }
//    }
//}

- (void)playerItemDidReachEnd:(NSNotification *)notification {

 //  code here to play next sound file

}

@end
