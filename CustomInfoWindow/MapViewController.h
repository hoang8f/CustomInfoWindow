//
//  MapViewController.h
//
//  Created by Le Van Hoang on 7/22/13.
//  Copyright (c) 2013 Custom InfoWindow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "InfoWindow.h"

@interface MapViewController : UIViewController <GMSMapViewDelegate, CLLocationManagerDelegate> {
    InfoWindow *infoWindow;
    GMSCameraPosition *currentCameraPostion;
    BOOL shouldShowInfoWindow;
    GMSMarker *currentMarker;
}

@property IBOutlet GMSMapView *mapView;

@end
