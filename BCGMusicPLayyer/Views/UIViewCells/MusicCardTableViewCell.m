//
//  SongCardTableViewCell.m
//  uicomponents
//
//  Created by Noverio Joe on 11/07/21.
//

#import "MusicCardTableViewCell.h"
#import <uicomponents/UIComponentsInstances.h>


@implementation MusicCardTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected){
        if (self.delegate != nil){
            [self.delegate playSelectedMusicFromCells:self];
        }
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
-(void)setContentDefaukt{
    [self.playingIndicator setHidden:YES];
//    [UIComponentsInstances.sharedManager loadingShimmerWithView:self.imgCover];
//    [UIComponentsInstances.sharedManager loadingShimmerWithView:self.lblAlbums];
//    [UIComponentsInstances.sharedManager loadingShimmerWithView:self.lblArtist];
//    [UIComponentsInstances.sharedManager loadingShimmerWithView:self.lblSongName];
    self.lblSongName.text = @"               ";
    self.lblArtist.text =  @"               ";
    self.lblAlbums.text =  @"               ";

}
-(void)setContentWithModel : (MusicModel*)model cellIndex : (long)index withMusicCardDelegate : (id<MusicCardDelegate>) delegate{
    if (model != nil){
        self.delegate = delegate;
        self.cellindex = index;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul), ^{
            NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: model.artworkUrl100]];
               dispatch_async(dispatch_get_main_queue(), ^{
                   self.imgCover.image = [UIImage imageWithData: imageData];
               });
           });
        
        
        self.lblSongName.text = model.trackName;
        self.lblArtist.text = model.collectionArtistName;
        self.lblAlbums.text = model.collectionName;
        [self.playingIndicator setHidden:YES];
    }
}

@end
