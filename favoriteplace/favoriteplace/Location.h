//
//  Location.h
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-08.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property int locationId;
@property NSString *latitude;
@property NSString *longitude;
@property NSString *city;
@property NSString *country;
@property NSString *state;

@end
