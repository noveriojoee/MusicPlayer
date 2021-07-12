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

@property (nonatomic) NSString <Optional> *artistId;
@property (nonatomic) NSString <Optional> *artistName;
@property (nonatomic) NSString <Optional> *artistViewUrl;
@property (nonatomic) NSString <Optional> *trackViewUrl;
@property (nonatomic) NSString <Optional> *artworkUrl100;
@property (nonatomic) NSString <Optional> *artworkUrl30;
@property (nonatomic) NSString <Optional> *artworkUrl60;


@property (nonatomic) NSString <Optional> *collectionArtistName;
@property (nonatomic) NSString <Optional> *collectionCensoredName;
@property (nonatomic) NSString <Optional> *collectionExplicitness;
@property (nonatomic) NSString <Optional> *collectionId;
@property (nonatomic) NSString <Optional> *collectionName;

@property (nonatomic) NSString <Optional> *collectionPrice;
@property (nonatomic) NSString <Optional> *collectionViewUrl;
@property (nonatomic) NSString <Optional> *country;
@property (nonatomic) NSString <Optional> *currency;
//@property (nonatomic) int discCount;
//@property (nonatomic) int discNumber;
//@property (nonatomic) int isStreamable;
@property (nonatomic) NSString <Optional> *kind;
@property (nonatomic) NSString <Optional> *previewUrl;
@property (nonatomic) NSString <Optional> *primaryGenreName;
@property (nonatomic) NSString <Optional> *releaseDate;
@property (nonatomic) NSString <Optional> *trackCensoredName;
//@property (nonatomic) int  trackCount;
@property (nonatomic) NSString <Optional> *trackExplicitness;
//@property (nonatomic) int  trackId;
@property (nonatomic) NSString <Optional> *trackName;
//@property (nonatomic) int trackNumber;
@property (nonatomic) NSString <Optional> *trackPrice;
//@property (nonatomic) int trackTimeMillis;
@property (nonatomic) NSString <Optional> *wrapperType;

@end

NS_ASSUME_NONNULL_END
