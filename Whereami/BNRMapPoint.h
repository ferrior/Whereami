//
//  BNRMapPoint.h
//  Whereami
//
//  Created by Bin Liu on 8/7/14.
//  Copyright (c) 2014 Bin Liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface BNRMapPoint : NSObject <MKAnnotation>

-(id) initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString*) t;


@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@end
