//
//  GetMusicAPI.h
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import <Foundation/Foundation.h>
#import "NetworkingObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetMusicAPI : NSObject
@property NSString *baseUrl

+ (id)sharedManager

@end

NS_ASSUME_NONNULL_END
