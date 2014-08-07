//
//  whereamiViewController.h
//  Whereami
//
//  Created by Bin Liu on 8/7/14.
//  Copyright (c) 2014 Bin Liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface whereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>{
    CLLocationManager* locationManager;
    IBOutlet MKMapView *woldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
}

-(void) findLocation;
-(void) foundLocation: (CLLocation *) loc;

@end
