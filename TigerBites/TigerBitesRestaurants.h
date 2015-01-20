//
//  TigerBitesRestaurants.h
//  TigerBites
//
//  Created by Nomaan Ahgharian on 2/5/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface TigerBitesRestaurants : NSObject <MKAnnotation>

@property (nonatomic,assign) int restaurantID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) NSArray *menu;
 

- (id) initWithName:(NSString *)r_name location:(CLLocation *)r_location;

@end
