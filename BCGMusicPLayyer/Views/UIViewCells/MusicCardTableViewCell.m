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
    if (selected){
        [self.delegate playSelectedMusicFromCells:self];
    }
}

-(void)setTrackIsStop{
    [self.playingIndicator stopAnimating];
    [self.playingIndicator setHidden:YES];
}


-(void)setTrackIsPause{
    [self.playingIndicator stopAnimating];
}

-(void)setTrackIsPlay{
    [self.playingIndicator setHidden:NO];
    [self.playingIndicator startAnimating];
}

-(void)setContentWithModel : (MusicModel*)model cellIndex : (long)index withMusicCardDelegate : (id<MusicCardDelegate>) delegate{
    self.delegate = delegate;
    self.cellindex = index;
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: model.artworkUrl100]];
    self.imgCover.image = [UIImage imageWithData: imageData];
    self.lblSongName.text = model.trackName;
    self.lblArtist.text = model.collectionArtistName;
    self.lblAlbums.text = model.collectionName;
    [self.playingIndicator setHidden:YES];
}

@end
