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
        self.isPlaying = NO;
    }
    return self;
}

-(void)setSelectedMusicWithIndex : (long)itemIndex{
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


@end
