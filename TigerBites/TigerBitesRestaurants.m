//
//  TigerBitesRestaurants.m
//  TigerBites
//
//  Created by Nomaan Ahgharian on 2/5/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "TigerBitesRestaurants.h"

@implementation TigerBitesRestaurants

@synthesize restaurantID, name,location, menu;

- (id)initWithName:(NSString *)r_name location:(CLLocation *)r_location {
    self = [super init];
    
    if(self) {
        [self setName:r_name];
        [self setLocation:r_location];
    
    }
    
    return self;
}

- (CLLocationCoordinate2D)coordinate {
    return location.coordinate;
}

- (NSString *)title {
    return name;
}

- (NSString *)subtitle {
    return @"";
}

@end
