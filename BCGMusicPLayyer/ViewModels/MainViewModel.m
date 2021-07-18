//
//  MainViewModel.m
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 11/07/21.
//

#import "MainViewModel.h"
#import "GetMusicAPI.h"


@implementation MainViewModel
-(id)init{
    if (self == [super init]){
        self.modelsCount = 0;
        self.selectedIndexSong = 0;
        self.searchField = @"";
        self.isPlaying = NO;
    }
    return self;
}

-(void)setSelectedMusicWithIndex : (long)itemIndex{
    self.selectedMusic = [self.models objectAtIndex:itemIndex];
}

-(void)playTrack{
    if (self.songPlayer != nil){
        [self.songPlayer play];
        self.isPlaying = YES;
    }else{
        self.isPlaying = NO;
    }
}

-(void)playNewTrackWithIndex: (long) index delegate : (id<AVAudioPlayerDelegate>) delegate onCompleted : (void (^)(NSString*))onDownloadTrackFinish{
    [self setSelectedMusicWithIndex:index];
    self.songPlayer.delegate = delegate;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
        NSURL *url = [NSURL URLWithString:self.selectedMusic.previewUrl];
        NSData *soundData = [NSData dataWithContentsOfURL:url];
           dispatch_async(dispatch_get_main_queue(), ^{
               self.songPlayer = [[AVAudioPlayer alloc] initWithData:soundData  error:NULL];
               [self playTrack];
               onDownloadTrackFinish(@"finish");
           });
       });
}

-(void)pauseTrack{
    if (self.songPlayer != nil){
        [self.songPlayer pause];
        self.isPlaying = NO;
    }else{
        self.isPlaying = NO;
    }
}

-(BOOL)stopTrack{
    BOOL returnValue = NO;
    if (self.songPlayer != nil){
        [self.songPlayer stop];
        self.isPlaying = NO;
        returnValue = YES;
    }else{
        self.isPlaying = NO;
        returnValue = NO;
    }
    
    return returnValue;
}



-(void)searchMusicWithCompletion : (void (^)(NSString*))onComplete{
    self.modelsCount = 0;
    [GetMusicAPI.sharedManager searchMusicWithStringParam:self.searchField onCompletion:^(DTOGetMusic *apiResponse) {
        if ([apiResponse.apiResponseCode isEqualToString:@"200"]){
            if (apiResponse.results != nil){
                self.selectedIndexSong = 0;
                self.models = apiResponse.results;
                self.modelsCount = [apiResponse.results count];
                
                onComplete(@"OK");
            }
        }else{
            onComplete(@"Failed To Fetch Music");
        }
    }];
}


@end
