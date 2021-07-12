//
//  MusicModel.h
//  BCGMusicPLayyer
//
//  Created by Noverio Joe on 11/07/21.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModelLib.h>
#import <JSONModel/JSONModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface MusicModel : JSONModel

@property (nonatomic) NSString <Optional> *title;
@property (nonatomic) NSString <Optional> *artist;
@property (nonatomic) NSString <Optional> *songDescription;

@end

NS_ASSUME_NONNULL_END
