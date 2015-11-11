//
//  GeoCalculations.h
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-10.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeoCalculations : NSObject

-(float) getHeading:(float)flatitude :(float)flongitude :(float)llatitude :(float)llongitude;
-(float) getDistance:(float)flatitude :(float)flongitude :(float)llatitude :(float)llongitude;

@end
