//
//  GetMusicAPI.m
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import "GetMusicAPI.h"

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

-(void)searchMusicWithParamString : (NSString*) parameters{
    NSString* actionMethod = @"/5fbf702c-7cd0-4005-a9c9-eeb115370156";
    NSString* endPointUrl = [self.baseUrl stringByAppendingString:actionMethod];
    
    NSMutableURLRequest* httpRequest = [self getb:[requestModel toDictionary] endpointUrl:actionMethod];
    
    
    [NetworkingObject.sharedManager performRequestWithHTTPRequest:<#(nonnull NSMutableURLRequest *)#> onCompleted:^(id _Nonnull) {
        <#code#>
    }]
    
}
@end
