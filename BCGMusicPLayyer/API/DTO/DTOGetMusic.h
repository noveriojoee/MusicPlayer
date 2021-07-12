//
//  DTOGetMusic.h
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DTOGetMusic <ObjectType> : NSObject
@property NSString* resultCount;
@property NSArray<ObjectType> *results;

@end

NS_ASSUME_NONNULL_END
