//
//  FavoriteDataSource.h
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-08.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"
#import "Favorite.h"

@interface FavoriteDataSource : NSObject

@property (nonatomic, strong) DBManager *dbManager;

-(int) addFavorite:(Favorite*)favorite;
-(int) updateFavorite:(Favorite*)favorite;
-(int) deleteFavorite:(Favorite*)favorite;
-(Favorite*) getFavorite:(int)favoriteId;
-(int) getFavoriteCount;

@end
