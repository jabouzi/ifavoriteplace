//
//  LocationDataSource.h
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-08.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBManager.h"
#import "Location.h"

@interface LocationDataSource : NSObject

@property (nonatomic, strong) DBManager *dbManager;

-(int) addLocation:(Location*)location;
-(int) updateLocation:(Location*)location;
-(int) deleteLocation:(Location*)location;
-(Location*) getLocation:(int)locationId;
-(int) getLocationCount;

@end
