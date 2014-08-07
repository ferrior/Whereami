//
//  whereamiViewController.h
//  Whereami
//
//  Created by Bin Liu on 8/7/14.
//  Copyright (c) 2014 Bin Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface whereamiViewController : UIViewController <CLLocationManagerDelegate>{
    CLLocationManager* locationManager;
    
}

@end
