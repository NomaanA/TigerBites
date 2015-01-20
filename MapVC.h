//
//  MapVC.h
//  TigerBites
//
//  Created by Nomaan Ahgharian on 2/5/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "TigerBitesRestaurants.h"
#import "TigerBitesRestaurantsDetailGroupedTableVC.h"

@interface MapVC : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate> {
    IBOutlet MKMapView *mapView;
    IBOutlet UITableView *tableView;
    
}

@property (nonatomic, strong) MKMapView *mapView;
@property (nonatomic, strong) NSMutableArray * tigerEateries;
@property (nonatomic, strong) CLLocationManager *locationManager;
//@property (nonatomic, strong) UITableViewController *tableVC;

@end
