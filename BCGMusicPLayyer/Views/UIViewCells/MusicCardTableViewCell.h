//
//  SongCardTableViewCell.h
//  uicomponents
//
//  Created by Noverio Joe on 11/07/21.
//

#import <UIKit/UIKit.h>
#import "MusicModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol MusicCardDelegate<NSObject>

-(void)playSelectedMusicFromCells : (UITableViewCell*)cell;

@end



@interface MusicCardTableViewCell : UITableViewCell
@property id<MusicCardDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *imgCover;
@property (weak, nonatomic) IBOutlet UILabel *lblSongName;
@property (weak, nonatomic) IBOutlet UILabel *lblArtist;
@property (weak, nonatomic) IBOutlet UILabel *lblAlbums;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *playingIndicator;
@property long cellindex;


-(void)setTrackIsStop;
-(void)setTrackIsPause;
-(void)setTrackIsPlay;
-(void)setContentWithModel : (MusicModel*)model cellIndex : (long)index withMusicCardDelegate : (id<MusicCardDelegate>) delegate;

@end



NS_ASSUME_NONNULL_END
