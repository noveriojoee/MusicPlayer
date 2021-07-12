//
//  DTOGetMusic.h
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import <Foundation/Foundation.h>
#import "BaseDTO.h"
#import "MusicModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol DTOGetMusic;
@interface DTOGetMusic : BaseDTO
@property NSString* resultCount;
@property NSMutableArray<MusicModel,Optional> *results;
@end

NS_ASSUME_NONNULL_END
