//
//  whereamiViewController.m
//  Whereami
//
//  Created by Bin Liu on 8/7/14.
//  Copyright (c) 2014 Bin Liu. All rights reserved.
//

#import "whereamiViewController.h"

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
    
    for(CLLocation* location in locations){
        NSLog(@"%@",location);
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"cannot find location: %@", error);
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region =  MKCoordinateRegionMakeWithDistance(loc,250,250);
    [woldView setRegion:region animated:YES];
}

-(void) dealloc{
    [locationManager setDelegate:nil];
}

@end
