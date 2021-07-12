//
//  BaseDTO.m
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import "BaseDTO.h"

@implementation BaseDTO

-(void)setApiResponseMessageWithMessage : (NSString*) message responseCode : (NSString*) responseCode{
    self.apiResponseCode = responseCode;
    self.apiResponseMessage = message;
}

@end
