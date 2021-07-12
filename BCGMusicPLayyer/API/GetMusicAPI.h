//
//  GetMusicAPI.h
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 12/07/21.
//

#import <Foundation/Foundation.h>
#import "NetworkingObject.h"
#import "BaseAPI/BasicAPIRequestServices.h"
#import "DTOGetMusic.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetMusicAPI : BasicAPIRequestServices

+ (id)sharedManager;

-(void)searchMusicWithStringParam : (NSString*) searchParam onCompletion : (void (^)(DTOGetMusic<MusicModel*>*))onPerformWithUrlFinish;

@end

NS_ASSUME_NONNULL_END
