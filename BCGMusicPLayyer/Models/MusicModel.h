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
@protocol MusicModel;
@interface MusicModel : JSONModel

@property (nonatomic) NSString <Optional> *trackCensoredName;
@property (nonatomic) NSString <Optional> *artistName;
@property (nonatomic) NSString <Optional> *previewUrl;
@property (nonatomic) NSString <Optional> *trackViewUrl;
@property (nonatomic) NSString <Optional> *artworkUrl100;
@property (nonatomic) NSString <Optional> *collectionName;

@end

NS_ASSUME_NONNULL_END
