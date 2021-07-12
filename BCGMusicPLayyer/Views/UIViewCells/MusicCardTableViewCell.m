//
//  SongCardTableViewCell.m
//  uicomponents
//
//  Created by Noverio Joe on 11/07/21.
//

#import "MusicCardTableViewCell.h"


@interface MusicCardTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgCover;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblArtist;
@property (weak, nonatomic) IBOutlet UILabel *lblAlbumTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgPlayingIndicator;
@end

@implementation MusicCardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setContentWithImageUrl : (NSString*) imgUrl songTitle : (NSString*) songTitle artist : (NSString*) artist albums : (NSString*) album{
    self.lblTitle.text = songTitle;
    self.lblArtist.text = artist;
    self.lblAlbumTitle.text = album;
}

@end
