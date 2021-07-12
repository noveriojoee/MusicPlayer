//
//  GetMusicAPI.m
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import "GetMusicAPI.h"

@implementation GetMusicAPI


-(id)init{
    if ( self = [super init] ) {
//        self.baseUrl = @"https://run.mocky.io/v3";
        self.baseUrl = @"https://itunes.apple.com/search?term=[paramSearch]";
    }
    return self;
}

+ (id)sharedManager {
    static GetMusicAPI *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

-(void)searchMusicWithStringParam : (NSString*) searchParam onCompletion : (void (^)(DTOGetMusic*))onPerformWithUrlFinish{
//    NSString* actionMethod = @"/5fbf702c-7cd0-4005-a9c9-eeb115370156";
//    NSString* endPointUrl = [self.baseUrl stringByAppendingString:actionMethod];
    NSString* endPointUrl = [self.baseUrl stringByReplacingOccurrencesOfString:@"[paramSearch]" withString:@"music"];
    NSMutableURLRequest* httpRequest = [self getBasicGETAuthRequestWithEndpointUrl:endPointUrl];
    
    [NetworkingObject.sharedManager performRequestWithHTTPRequest:httpRequest onCompleted:^(id result) {
        DTOGetMusic *responseObject = [DTOGetMusic new];
        if ([result isKindOfClass:NSString.class]){
            [responseObject setApiResponseWithMessage:(NSString*)result responseCode:@"499"];
        }else{
            JSONModelError* error;
            
            responseObject = [[DTOGetMusic alloc] initWithString:[Serializer toJsonStringFromObject:result] error:&error];
            if(error != nil){
                [responseObject setApiResponseWithMessage:@"Error Parsing Result" responseCode:@"99"];
            }else{
                [responseObject setApiResponseWithMessage:@"OK" responseCode:@"200"];
            }
        }
        onPerformWithUrlFinish(responseObject);
    }];
    
}
@end
