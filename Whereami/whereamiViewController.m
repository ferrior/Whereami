//
//  whereamiViewController.m
//  Whereami
//
//  Created by Bin Liu on 8/7/14.
//  Copyright (c) 2014 Bin Liu. All rights reserved.
//

#import "whereamiViewController.h"
#import "BNRMapPoint.h"

@interface whereamiViewController ()

@end

@implementation whereamiViewController

- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc] init];
    
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    //[locationManager startUpdatingLocation];
    
    [woldView setShowsUserLocation:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
     NSLog(@"%d locations found",locations.count);
    
    
    CLLocation *newLocation = nil;
    for(CLLocation* location in locations){
        NSLog(@"%@",location);
        newLocation = location;
    }
    
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    if( t < -180) return;
    
    [self foundLocation:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"cannot find location: %@", error);
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region =  MKCoordinateRegionMakeWithDistance(loc,250,250);
    [woldView setRegion:region animated:YES];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

-(void) findLocation{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
    
}

-(void) foundLocation: (CLLocation *) loc{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    BNRMapPoint *mp = [[BNRMapPoint alloc]initWithCoordinate:coord title:[locationTitleField text]];
    
    [woldView addAnnotation:mp];
    
    MKCoordinateRegion region =  MKCoordinateRegionMakeWithDistance(coord,250,250);
    [woldView setRegion:region animated:YES];
    
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

-(void) dealloc{
    [locationManager setDelegate:nil];
}

@end
