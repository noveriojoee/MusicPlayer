//
//  SongCardTableViewCell.h
//  uicomponents
//
//  Created by Noverio Joe on 11/07/21.
//

#import <UIKit/UIKit.h>
#import "MusicModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol MusicCardProtocol<NSObject>

-(void)playSelectedMusicWithIndex : (int)index;

@end


@interface MusicCardTableViewCell : UITableViewCell
@property id<MusicCardProtocol> delegate;
@property (weak, nonatomic) IBOutlet UIImageView *imgCover;
@property (weak, nonatomic) IBOutlet UILabel *lblSongName;
@property (weak, nonatomic) IBOutlet UILabel *lblArtist;
@property (weak, nonatomic) IBOutlet UILabel *lblAlbums;
@property (weak, nonatomic) IBOutlet UIImageView *imgIndicator;


-(void)setContentWithModel : (MusicModel*)model withMusicCardDelegate : (id<MusicCardProtocol>) delegate;

@end

NS_ASSUME_NONNULL_END
