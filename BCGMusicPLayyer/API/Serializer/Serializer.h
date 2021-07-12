//
//  Serializer.h
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Serializer : NSObject
+(NSString*)toJsonStringFromObject : (id) object;
+(NSString *)hmac:(NSString *)plaintext withKey:(NSString *)key;
+(NSString*)sha256:(NSString *)clear;
+(NSString*)formattedDuration:(NSTimeInterval)interval;
@end

NS_ASSUME_NONNULL_END
