//
//  NetworkingObject.h
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface NetworkingObject : NSObject

@property NSString* basedUrl;

-(void)performRequestWithHTTPRequest : (NSMutableURLRequest*)httpRequest onCompleted : (void (^)(id))onPerformWithUrlFinish;
-(void)performRequestWithAction : (NSString*)actionMethod requestData : (NSDictionary*)data onCompleted : (void (^)(id))onPerformWithUrlFinish;
-(void)performRequestWithUrlEncoded : (NSString*)url requestData : (NSDictionary*)data onCompleted : (void (^)(id))onPerformWithUrlFinish;
-(void)performRequestGetWithAction : (NSString*)actionMethod requestData : (NSString*)data onCompleted : (void (^)(id))onPerformWithUrlFinish;

+(id)sharedManager;

@end

NS_ASSUME_NONNULL_END
