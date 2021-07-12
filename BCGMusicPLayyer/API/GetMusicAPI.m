//
//  GetMusicAPI.m
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import "GetMusicAPI.h"
#import "MusicModel.h"

@implementation GetMusicAPI

+ (id)sharedManager {
    static GetMusicAPI *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(id)init{
    if ( self = [super init] ) {
        self.baseUrl = @"https://run.mocky.io/v3";
    }
    return self;
}

-(void)searchMusicWithStringParam : (NSString*) searchParam onCompletion : (void (^)(APIResult<MusicModel*>*))onPerformWithUrlFinish{
    NSString* actionMethod = @"/5fbf702c-7cd0-4005-a9c9-eeb115370156";
    NSString* endPointUrl = [self.baseUrl stringByAppendingString:actionMethod];
    
    NSMutableURLRequest* httpRequest = [self getBasicGETAuthRequestWithEndpointUrl:endPointUrl];
    
    [NetworkingObject.sharedManager performRequestWithHTTPRequest:httpRequest onCompleted:^(id result) {
        if ([result isKindOfClass:NSString.class]){
            [responseObject setApiResponseMessage:(NSString*)result];
        }else{
            JSONModelError* error;
            responseObject.serviceModel = [[ParameterModels alloc] initWithString:[Serializer toJsonStringFromObject:result] error:&error];
            if(error != nil){
                [responseObject setApiResponseMessage:@"Unknown Error"];
            }else{
                [responseObject setApiResponseMessage:@"OK"];
            }
        }
    }];
    
}
@end
