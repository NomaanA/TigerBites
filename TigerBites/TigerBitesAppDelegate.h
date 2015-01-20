//
//  TigerBitesAppDelegate.h
//  TigerBites
//
//  Created by Nomaan Ahgharian on 2/4/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapVC.h"
#import "AboutVC.h"
#import "logInVC.h"
#import "TigerBitesRestaurants.h"

@interface TigerBitesAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) UITabBarController *tabBarController;
@property (strong, nonatomic) MapVC *mapView;
@property (strong, nonatomic) AboutVC *aboutView;
@property (strong, nonatomic) logInVC *loginView;
@property (strong, nonatomic) NSMutableArray *tigerEateries;

@end
