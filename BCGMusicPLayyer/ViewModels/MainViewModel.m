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
        self.searchField = @"";
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


@end
