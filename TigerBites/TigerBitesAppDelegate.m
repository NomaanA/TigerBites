//
//  TigerBitesAppDelegate.m
//  TigerBites
//
//  Created by Nomaan Ahgharian on 2/4/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import "TigerBitesAppDelegate.h"


@implementation TigerBitesAppDelegate

@synthesize mapView, window, loginView,tabBarController, aboutView, tigerEateries;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.tigerEateries = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Restaurants" ofType:@"plist"];
    //NSLog(@"path: %@", path);
    
    
    NSDictionary *tempDictonary = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *tempArray = [tempDictonary objectForKey:@"restaurants"];
    //NSLog(@"data in tempArray: %@",tempArray);
    //NSLog(@"data in tempDictionary: %@",tempDictonary);
    
    
    for(id dict in tempArray){
        int restaurantID = [[dict objectForKey:@"resturantID"] integerValue];
        NSString *name = [dict objectForKey:@"name"];
        float latitude = [[dict objectForKey:@"latitude"] floatValue];
        float longitude = [[dict objectForKey:@"longitude"] floatValue];
        CLLocation *location = [[CLLocation alloc]initWithLatitude:latitude longitude:longitude];
        
        TigerBitesRestaurants *r = [[TigerBitesRestaurants alloc] init];
        r.restaurantID = restaurantID;
        r.name = name;
        r.location = location;
        
        [self.tigerEateries addObject:r];
    }
    
    NSLog(@"%@", tigerEateries);
    /*
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
    */
    
    
   
    
    mapView = [[MapVC alloc] initWithNibName:nil bundle:nil];
    aboutView = [[AboutVC alloc] initWithNibName:nil bundle:nil ];
    loginView = [[logInVC alloc] initWithNibName:nil bundle:nil];
    
    mapView.tigerEateries = self.tigerEateries;
    
    loginView.mapVC = mapView;
    
    tabBarController = [[UITabBarController alloc] init];
    
    mapView.title  = @"map";
    self.window.rootViewController = loginView;

    /*
    //icons
    UITabBarItem *mapItem = [[UITabBarItem alloc] initWithTitle:@"map" image:[UIImage imageNamed:@"72-pin.png"] tag:0];
    UITabBarItem *aboutItem = [[UITabBarItem alloc] initWithTitle:@"about" image:[UIImage imageNamed:@"eye.png"] tag:0];
    
    NSArray *viewControllers = [NSArray arrayWithObjects:mapView, aboutView, nil];
    
    mapView.tabBarItem = mapItem;
    aboutView.tabBarItem = aboutItem;
    
    tabBarController.viewControllers = viewControllers;
   
    
        [self.window addSubview:tabBarController.view];
    */
    
    /*
    mapView = [[MapVC alloc] init];
    
    tabBarController = [[UITabBarController alloc] init];
    MapVC *mapVC = [[MapVC alloc] initWithNibName:nil bundle:nil];
    mapVC.title = @"Map";
    
    
    logInVC *login = [[logInVC alloc] initWithNibName:nil bundle:nil];
    login.title = @"login";
    
    // icons
    
    
    UITabBarItem *loginItem = [[UITabBarItem alloc] initWithTitle:@"Login" image:[UIImage imageNamed:@"eye.png"] tag:0];
    UITabBarItem *mapItem = [[UITabBarItem alloc] initWithTitle:@"Map" image:[UIImage imageNamed:@"72-pin.png"] tag:0];
    //
    mapVC.tabBarItem = mapItem;
    login.tabBarItem = loginItem;
    NSArray *viewControllers = [NSArray arrayWithObjects:login,mapVC, nil];
    tabBarController.viewControllers = viewControllers;
    [self.window addSubview:tabBarController.view];
    
    
    */
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
