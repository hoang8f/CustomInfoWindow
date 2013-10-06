//
//  MapViewController.m
//
//  Created by Le Van Hoang on 7/22/13.
//  Copyright (c) 2013 Custom InfoWindow. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <MapKit/MapKit.h>
#import "InfoWindow.h"

NSMutableArray *listEntries;

@implementation MapViewController

@synthesize mapView = _mapView;

#pragma mark DEFAULT METHOD
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    infoWindow = [[InfoWindow alloc] initWithFrame:CGRectMake(25, 210, 269, 63)];
    [self.view addSubview:infoWindow];
    infoWindow.hidden = YES;
    [infoWindow.detail addTarget:self
                          action:@selector(didTapInfoWindowOfMarker)
                forControlEvents:UIControlEventTouchUpInside];
    [infoWindow.direction addTarget:self
                             action:@selector(openDirectionApp)
                   forControlEvents:UIControlEventTouchUpInside];

    //Set the camera position.
    _mapView.delegate = self;
    
    //Some dummies location
    CLLocationCoordinate2D position = CLLocationCoordinate2DMake(34.73348,135.500109);
    GMSMarker *marker1 = [GMSMarker markerWithPosition:position];
    marker1.title = @"Location title";
    marker1.snippet = @"Location address here...";
    marker1.icon = [UIImage imageNamed:@"marker.png"];
    marker1.map = _mapView;
    
    position = CLLocationCoordinate2DMake(34.732726,135.502775);
    GMSMarker *marker2 = [GMSMarker markerWithPosition:position];
    marker2.title = @"Location title";
    marker2.snippet = @"Location address here...";
    marker2.icon = [UIImage imageNamed:@"marker.png"];
    marker2.map = _mapView;
    
    
    position = CLLocationCoordinate2DMake(34.734543,135.496724);
    GMSMarker *marker3 = [GMSMarker markerWithPosition:position];
    marker3.title = @"Location title";
    marker3.snippet = @"Location address here...";
    marker3.icon = [UIImage imageNamed:@"marker.png"];
    marker3.map = _mapView;
    
    //Set camera position
    currentCameraPostion = [GMSCameraPosition cameraWithLatitude:34.734525
                                                       longitude:135.500565
                                                            zoom:15];
    GMSCameraPosition *camera = currentCameraPostion;
    _mapView.camera = camera;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark CUSTOM INFO WINDOW

-(BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker {
//    NSLog(@"Did tap marker");
    currentMarker = marker;
    GMSCameraPosition *markerPosition = [GMSCameraPosition
                                         cameraWithLatitude:marker.position.latitude
                                         longitude:marker.position.longitude
                                         zoom:currentCameraPostion.zoom
                                         bearing:currentCameraPostion.bearing
                                         viewingAngle:currentCameraPostion.viewingAngle];
    [_mapView animateToCameraPosition:markerPosition];
    if (fabs(currentCameraPostion.target.latitude - markerPosition.target.latitude) < 0.00001 &&
        fabs(currentCameraPostion.target.longitude == markerPosition.target.longitude) < 0.00001) {
        infoWindow.hidden = !infoWindow.hidden;
    } else {
        infoWindow.hidden = YES;
        shouldShowInfoWindow = YES;
    }
    
    //Update infoWindow
    infoWindow.title.text = marker.title;
    infoWindow.snippet.text = marker.snippet;

    return YES;
}

-(void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate {
    //Hide InfoWindow when tapped outside
    infoWindow.hidden = YES;
}

- (void)didTapInfoWindowOfMarker {
    NSLog(@"Tapped on info window");
}

- (void)openDirectionApp {
    NSLog(@"Open direction app");
}

- (void)mapView:(GMSMapView *)mapView didChangeCameraPosition:(GMSCameraPosition *)position {
    currentCameraPostion = position;
}

- (void)mapView:(GMSMapView *)mapView willMove:(BOOL)gesture {
    if(gesture) {
        //Mapview is moved by gesture
        infoWindow.hidden = YES;
    } else {
        //Mapview is moved by animation
        //Do nothing
    }
}

- (void)mapView:(GMSMapView *)mapView idleAtCameraPosition:(GMSCameraPosition *)position {
    if (shouldShowInfoWindow) {
        infoWindow.hidden = NO;
    }
    shouldShowInfoWindow = NO;
}

@end
