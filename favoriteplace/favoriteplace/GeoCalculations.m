//
//  GeoCalculations.m
//  favoriteplace
//
//  Created by Skander Jabouzi on 2015-11-10.
//  Copyright © 2015 Skander Software Solutions. All rights reserved.
//

#import "GeoCalculations.h"

@implementation GeoCalculations

-(float) getHeading:(float)flatitude :(float)flongitude :(float)llatitude :(float)llongitude
{
    float x1 = sin((-llongitude+flongitude)*M_PI/180);
    float y1 = cos(llatitude*M_PI/180) * tan(flatitude*M_PI/180);
    float y2 = sin(llatitude*M_PI/180) * cos((-llongitude+flongitude)*M_PI/180);
    float dial_angle = atan(x1/(y1-y2))*180/M_PI;
    if (dial_angle < 0) dial_angle = 360 + dial_angle;
    
    if ((llongitude < flongitude) && (llongitude > flongitude-180)) {
        if (dial_angle > 180) dial_angle = dial_angle - 180;
    }
    if (dial_angle > 360) dial_angle = dial_angle - 360;
    return dial_angle;
}

-(float) getDistance:(float)flatitude :(float)flongitude :(float)llatitude :(float)llongitude
{
    float dlon = flongitude - llongitude;
    float dlat = flatitude - llatitude;
    double a = pow(sin(dlat/2),2) + cos(llatitude) * cos(flatitude) * pow(sin(dlon/2),2);
    double c = 2 * atan2( sqrt(a), sqrt(1-a));
    double d = (double)6373 * c;
    
    return d;
}

@end
