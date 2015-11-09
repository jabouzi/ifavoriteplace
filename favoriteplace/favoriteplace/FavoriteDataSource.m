//
//  FavoriteDataSource.m
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-08.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import "FavoriteDataSource.h"

@implementation FavoriteDataSource

- (id)init
{
    self = [super init];
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"favoriteplace.db"];
    return self;
}

-(int) addFavorite:(Favorite*)favorite
{
    favorite.latitude = [favorite.latitude stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    favorite.longitude = [favorite.longitude stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    favorite.city = [favorite.city stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    favorite.country = [favorite.country stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    favorite.state = [favorite.state stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    
    
    NSString *query = [NSString stringWithFormat:@"insert into favorite (id, latitude, longitude, country, city, state) values ('%d', '%@', '%@', '%@', '%@', '%@');",favorite.favoriteId, favorite.latitude, favorite.longitude, favorite.city, favorite.country, favorite.state];
    
    NSLog(@"%@", query);
    
    [self.dbManager executeQuery:query];
    
    if (self.dbManager.affectedRows != 0) {
        return 1;
    }
    else{
        return 0;
    }
}

-(int) updateFavorite:(Favorite*)favorite
{
    
    favorite.latitude = [favorite.latitude stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    favorite.longitude = [favorite.longitude stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    favorite.city = [favorite.city stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    favorite.country = [favorite.country stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    favorite.state = [favorite.state stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    
    
    NSString *query = [NSString stringWithFormat:@"update favorite set latitude = '%@', longitude = '%@', country = '%@', city = '%@', state = '%@' where id = %d;", favorite.latitude, favorite.longitude, favorite.city, favorite.country, favorite.state, favorite.favoriteId];
    
    NSLog(@"%@", query);
    
    [self.dbManager executeQuery:query];
    
    if (self.dbManager.affectedRows != 0) {
        return 1;
    }
    else{
        return 0;
    }
}

-(int) deleteFavorite:(Favorite*)favorite
{
    NSString *query = [NSString stringWithFormat:@"delete from favorite where id = %d", favorite.favoriteId];
    
    [self.dbManager executeQuery:query];
    
    if (self.dbManager.affectedRows != 0) {
        return 1;
    }
    else{
        return 0;
    }

}

-(Favorite*) getFavorite:(int)favoriteId
{
    Favorite *favorite = [[Favorite alloc] init];
    NSString *query = [NSString stringWithFormat:@"select * from favorite where id = '%d';", favoriteId];
    NSLog(@"%@", query);
    
    NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    if ([results count] > 0)
    {
        favorite.latitude = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"latitude"]];
    }
    
    return favorite;
}

-(int) getFavoriteCount
{
    int count = 0;
    NSString *query = @"select count(*) as count from users";
    NSLog(@"%@", query);
    
    NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    if ([results count] > 0)
    {
        count = [[[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"count"]] integerValue];
    }
    
    return count;

}

@end
