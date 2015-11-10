//
//  LocationDataSource.m
//  locationplace
//
//  Created by Skander Jabouzi on 2015-11-08.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import "LocationDataSource.h"

@implementation LocationDataSource

- (id)init
{
    self = [super init];
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"favoriteplace.db"];
    return self;
}

-(int) addLocation:(Location*)location
{
    location.latitude = [location.latitude stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    location.longitude = [location.longitude stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    location.city = [location.city stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    location.country = [location.country stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    location.state = [location.state stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    
    
    NSString *query = [NSString stringWithFormat:@"insert into location (id, latitude, longitude, country, city, state) values ('%d', '%@', '%@', '%@', '%@', '%@');",location.locationId, location.latitude, location.longitude, location.city, location.country, location.state];
    
    NSLog(@"%@", query);
    
    [self.dbManager executeQuery:query];
    
    if (self.dbManager.affectedRows != 0) {
        return 1;
    }
    else{
        return 0;
    }
}

-(int) updateLocation:(Location*)location
{
    
    location.latitude = [location.latitude stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    location.longitude = [location.longitude stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    location.city = [location.city stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    location.country = [location.country stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    location.state = [location.state stringByReplacingOccurrencesOfString:@"'" withString:@"''"];
    
    
    NSString *query = [NSString stringWithFormat:@"update location set latitude = '%@', longitude = '%@', country = '%@', city = '%@', state = '%@' where id = %d;", location.latitude, location.longitude, location.city, location.country, location.state, location.locationId];
    
    NSLog(@"%@", query);
    
    [self.dbManager executeQuery:query];
    
    if (self.dbManager.affectedRows != 0) {
        return 1;
    }
    else{
        return 0;
    }
}

-(int) deleteLocation:(Location*)location
{
    NSString *query = [NSString stringWithFormat:@"delete from location where id = %d", location.locationId];
    
    [self.dbManager executeQuery:query];
    
    if (self.dbManager.affectedRows != 0) {
        return 1;
    }
    else{
        return 0;
    }
    
}

-(Location*) getLocation:(int)locationId
{
    Location *location = [[Location alloc] init];
    NSString *query = [NSString stringWithFormat:@"select * from location where id = '%d';", locationId];
    NSLog(@"%@", query);
    
    NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    if ([results count] > 0)
    {
        location.locationId = [[[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"id"]] integerValue];
        location.latitude = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"latitude"]];
        location.longitude = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"longitude"]];
        location.city = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"city"]];
        location.country = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"country"]];
        location.state = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"state"]];
    }
    
    return location;
}

-(int) getLocationCount
{
    int count = 0;
    NSString *query = @"select count(*) as count from location";
    NSLog(@"%@", query);
    
    NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:query]];
    if ([results count] > 0)
    {
        count = [[[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"count"]] integerValue];
    }
    
    return count;
    
}

@end
