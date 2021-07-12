//
//  BaseDTO.h
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseDTO : NSObject
@property NSString* apiResponseMessage;
@property NSString* apiResponseCode;
-(void)setApiResponseMessageWithMessage : (NSString*) message responseCode : (NSString*) responseCode;
@end

NS_ASSUME_NONNULL_END
