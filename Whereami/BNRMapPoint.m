//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Bin Liu on 8/7/14.
//  Copyright (c) 2014 Bin Liu. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint
@synthesize coordinate, title;

-(id) init{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Here"];
}
-(id) initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString*) t{
    self = [super init];
    if(self){
        coordinate = c;
        [self setTitle:t];
    }
    return self;
}

@end
