//
//  SongCardTableViewCell.m
//  uicomponents
//
//  Created by Noverio Joe on 11/07/21.
//

#import "MusicCardTableViewCell.h"


@implementation MusicCardTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(void)setContentWithModel : (MusicModel*)model withMusicCardDelegate : (id<MusicCardProtocol>) delegate{
    self.delegate = delegate;
    self.lblSongName.text = model.trackName;
    self.lblArtist.text = model.collectionArtistName;
    self.lblAlbums.text = model.collectionName;
}

@end
