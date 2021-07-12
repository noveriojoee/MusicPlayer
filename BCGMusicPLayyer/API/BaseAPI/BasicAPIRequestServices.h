//
//  BasicAPIRequestServices.h
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasicAPIRequestServices : NSObject
//Noverio Joe Notes : Incase we have to calculate signature set before request
@property NSString* cStringId;
@property NSString* cStringS;
@property NSString* API_KEY;
@property NSString* API_SECRET;
@property NSString* grantType;
@property NSString* authorization;
@property NSString* signature;
@property NSString* timeStamp;
@property NSString* baseUrl;

-(NSMutableURLRequest*)getBasicPOSTAuthRequest : (NSDictionary*)requestPayloadJson endpointUrl : (NSString*)url;
-(NSMutableURLRequest*)getBasicGETAuthRequestWithEndpointUrl : (NSString*)url;

@end
NS_ASSUME_NONNULL_END
