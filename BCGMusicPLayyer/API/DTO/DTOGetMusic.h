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
@interface DTOGetMusic <ObjectType> : BaseDTO
@property NSString* resultCount;
@property NSArray<ObjectType> *results;
@end

NS_ASSUME_NONNULL_END
