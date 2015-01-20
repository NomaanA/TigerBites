//
//  MapVC.m
//  TigerBites
//
//  Created by Nomaan Ahgharian on 2/5/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "MapVC.h"

@implementation MapVC

@synthesize mapView, tigerEateries, locationManager;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
    }
    return self;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    id<MKAnnotation> annotation = view.annotation;
    NSLog(@"The title of the tapped annotation is %@",annotation.title);
}

- (MKAnnotationView *)mapView:(MKMapView *)mv viewForAnnotation:(id <MKAnnotation>)annotation{
	MKAnnotationView *view = nil;
    
    ///NSLog(@"are you even getting called?");
    
	if(annotation != mv.userLocation) {
        //NSLog(@"in the if statement?");
		// if it's NOT the user's current location pin, create the annotation
		TigerBitesRestaurants *restaurantAnnotation = (TigerBitesRestaurants *)annotation;
		// Look for an existing view to reuse
		view = [mv dequeueReusableAnnotationViewWithIdentifier:@"restaurantAnnotation"];
		// If an existing view is not found, create a new one
		if(view == nil) {
			view = [[MKPinAnnotationView alloc] initWithAnnotation:restaurantAnnotation
                                                   reuseIdentifier:@"restaurantAnnotation"];
            
		}
		
		// Now we have a view for the annotation, so let's set some properties
		[(MKPinAnnotationView *)view setPinColor:MKPinAnnotationColorRed];
		[(MKPinAnnotationView *)view setAnimatesDrop:YES];
		[view setCanShowCallout:YES];
		
		// Now create buttons for the annotation view
		// The 'tag' properties are set so that we can identify which button was tapped later
		UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
		leftButton.tag = 0;
		UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		rightButton.tag = 1;
		
		// Add buttons to annotation view
		[view setLeftCalloutAccessoryView:leftButton];
		[view setRightCalloutAccessoryView:rightButton];
        
	}
	
	// send this annotation view back to MKMapView so it can add it to the pin
	return view;
}

- (void)mapView:(MKMapView *)mv annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    
	TigerBitesRestaurants *restaurantAnnotation = (TigerBitesRestaurants *)[view annotation];
	switch ([control tag]) {
		case 0: // left button
		{
			//NSURL *url = [NSURL URLWithString:restaurantAnnotation.url];
			//[[UIApplication sharedApplication] openURL:url];
		}
			break;
			
		case 1: // right button
		{
			//NSString *latlong = [NSString stringWithFormat:@"%f,%f",restaurantAnnotation.coordinate.latitude,restaurantAnnotation.coordinate.longitude];
			//NSString *url = [NSString stringWithFormat: @"http://maps.google.com/maps?ll=%@", [latlong stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
			// build a maps url. This will launch the Maps app on the hardware, and the google maps website in the simulator
			//NSString *url2 = [NSString stringWithFormat: @"http://maps.google.com/maps?daddr=%@", [restaurantAnnotation.address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
			
			//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url2]];
		}
			break;
		default:
			NSLog(@"Should not be here in calloutAccessoryControlTapped, tag=%d!",[control tag]);
			break;
	}
	// Reference
	// http://developer.apple.com/library/ios/#featuredarticles/iPhoneURLScheme_Reference/Articles/MapLinks.html
	// http://stackoverflow.com/questions/30058/how-can-i-launch-the-google-maps-iphone-application-from-within-my-own-native-app
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
     
    
    //showing user current location
    locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    /*
    self.tigerEateries = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Restaurants" ofType:@"plist"];
    
    NSDictionary *tempDic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *tempArray = [tempDic objectForKey:@"restaurants"];
   
    //43.084032,-77.674308
    CLLocation *BCClocation =[[CLLocation alloc] initWithLatitude: 43.084032 longitude: -77.674308];
    TigerBitesRestaurants *BCC = [[TigerBitesRestaurants alloc] initWithName:@"Brick City Cafe" location:BCClocation];
    
    //43.086591,-77.668941
    CLLocation *commonslocation =[[CLLocation alloc] initWithLatitude: 43.086591 longitude: -77.668941];
    TigerBitesRestaurants *commons = [[TigerBitesRestaurants alloc] initWithName:@"The Commons" location:commonslocation];
    
    //43.082611,-77.680024
    CLLocation *crlocation =[[CLLocation alloc] initWithLatitude: 43.082611 longitude: -77.680024];
    TigerBitesRestaurants *cr = [[TigerBitesRestaurants alloc] initWithName:@"Crossroads" location:crlocation];
    
    //43.084626,-77.68
    CLLocation *cadlocation =[[CLLocation alloc] initWithLatitude: 43.084626 longitude: -77.68];
    TigerBitesRestaurants *cad = [[TigerBitesRestaurants alloc] initWithName:@"Ctrl-Alt-Deli" location:cadlocation];
   
    
    
    [self.tigerEateries addObject:BCC];
    [self.tigerEateries addObject:commons];
    [self.tigerEateries addObject:cr];
    [self.tigerEateries addObject:cad];
   */
    //NSLog(@"data in temparray **** %@",tigerEateries);
    
    for (TigerBitesRestaurants *r in tigerEateries) {
        [self.mapView addAnnotation:r];
         
        
    }
    /*
    
    for(id dict in tempArray) {
        int resturantID = [[dict objectForKey:@"resturantID"]  integerValue];
        NSString *name = [dict objectForKey:@"name"];
        float latitude = [[dict objectForKey:@"latitude"] floatValue];
        float longitude =  [[dict objectForKey:@"longitude"] floatValue];
        CLLocation *location =[[CLLocation alloc] initWithLatitude:latitude longitude: longitude];
         
        
        //create NMADResturant
        TigerBitesRestaurants *r = [[TigerBitesRestaurants alloc] init];
        r.restaurantID = resturantID;
        r.name = name;
        r.location = location;
         
        
        
        [self.tigerEateries addObject:r];
    }
    */
    [mapView setMapType:MKMapTypeHybrid];
    CLLocation *clocation = [[CLLocation alloc] initWithLatitude:43.081572 longitude:-77.675800];
    // Do any additional setup after loading the view from its nib.
    //CLLocationCoordinate2D *coordinate = CLLocationCoordinate2DMake(43.083872, -77.673383);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(clocation.coordinate, 1500, 1500);
    [self.mapView setRegion:region animated:YES];
    
    [mapView setShowsUserLocation:YES];
    
    //43.083872,-77.673383
}
/*
- (void)startUpdating {
    [locationManager startUpdatingLocation];
}

- (void)stopUpdating{
    [locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [tigerEateries count];
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tv dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    
    cell.textLabel.text = [[tigerEateries objectAtIndex:[indexPath row]] title];
    cell.detailTextLabel.text = [[tigerEateries objectAtIndex:[indexPath row]] subtitle];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"A row is selected");
    TigerBitesRestaurants *restaurant = [self.tigerEateries objectAtIndex:indexPath.row];
    TigerBitesRestaurantsDetailGroupedTableVC *detailVC = [[TigerBitesRestaurantsDetailGroupedTableVC alloc] initWithStyle:UITableViewStyleGrouped];
    detailVC.title = restaurant.name;
    detailVC.restaurant = restaurant;
    //detailVC.zoomDelegate = self.mapVC;
    //[self.mapVC zoomOnAnnotation:restaurant];
    [self.navigationController pushViewController:detailVC animated:YES];
}



@end
