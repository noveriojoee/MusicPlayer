//
//  SongCardTableViewCell.h
//  uicomponents
//
//  Created by Noverio Joe on 11/07/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MusicCardTableViewCell : UITableViewCell


-(void)setContentWithImageUrl : (NSString*) imgUrl songTitle : (NSString*) songTitle artist : (NSString*) artist albums : (NSString*) album;

@end

NS_ASSUME_NONNULL_END
