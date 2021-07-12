//
//  MainViewModel.h
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 11/07/21.
//

#import <Foundation/Foundation.h>
#import <AVKit/AVKit.h>
#import "MusicModel.h"




NS_ASSUME_NONNULL_BEGIN

@interface MainViewModel : NSObject

@property AVAudioPlayer *songPlayer;
@property NSString* searchField;
@property MusicModel* selectedMusic;
@property NSMutableArray<MusicModel> *models;
@property long modelsCount;


-(void)setSelectedMusicWithIndex : (int)itemIndex;
-(void)searchMusicWithCompletion : (void (^)(NSString*))onComplete;
-(void)playselectedsong;
@end

NS_ASSUME_NONNULL_END
