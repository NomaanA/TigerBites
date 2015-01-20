//
//  logInVC.h
//  TigerBites
//
//  Created by Student on 2/5/13.
//  Copyright (c) 2013 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapVC.h" 

@interface logInVC : UIViewController{
    IBOutlet UITextField *userNameText;
    IBOutlet UITextField *passwordText;
}
 
@property (nonatomic, strong) MapVC *mapVC;
@property (nonatomic, strong) IBOutlet UIButton *logIn;
- (IBAction)loginClicked:(id)sender;

@end
