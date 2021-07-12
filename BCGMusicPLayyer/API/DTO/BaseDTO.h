//
//  BaseDTO.h
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
NS_ASSUME_NONNULL_BEGIN

@interface BaseDTO : JSONModel
@property (nonatomic) NSString <Optional> *apiResponseMessage;
@property (nonatomic) NSString <Optional> *apiResponseCode;
-(void)setApiResponseWithMessage : (NSString*) message responseCode : (NSString*) responseCode;
@end

NS_ASSUME_NONNULL_END
