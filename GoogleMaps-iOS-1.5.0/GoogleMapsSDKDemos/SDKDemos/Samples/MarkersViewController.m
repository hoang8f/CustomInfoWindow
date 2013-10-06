#if !defined(__has_feature) || !__has_feature(objc_arc)
#error "This file requires ARC support."
#endif

#import "SDKDemos/Samples/MarkersViewController.h"

#import <GoogleMaps/GoogleMaps.h>

@implementation MarkersViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-37.81969
                                                          longitude:144.966085
                                                               zoom:4];
  GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];

  GMSMarker *sydneyMarker = [[GMSMarker alloc] init];
  sydneyMarker.title = @"Sydney";
  sydneyMarker.snippet = @"Population: 4,605,992";
  sydneyMarker.position = CLLocationCoordinate2DMake(-33.8683, 151.2086);
  sydneyMarker.map = mapView;

  GMSMarker *melbourneMarker = [[GMSMarker alloc] init];
  melbourneMarker.title = @"Melbourne";
  melbourneMarker.snippet = @"Population: 4,169,103";
  melbourneMarker.position = CLLocationCoordinate2DMake(-37.81969, 144.966085);
  melbourneMarker.map = mapView;

  GMSMarker *australiaMarker = [[GMSMarker alloc] init];
  australiaMarker.title = @"Australia";
  australiaMarker.position = CLLocationCoordinate2DMake(-27.994401,140.07019);
  australiaMarker.appearAnimation = kGMSMarkerAnimationPop;
  australiaMarker.flat = YES;
  australiaMarker.draggable = YES;
  australiaMarker.groundAnchor = CGPointMake(0.5, 0.5);
  australiaMarker.icon = [UIImage imageNamed:@"australia"];
  australiaMarker.map = mapView;

  // Set the marker in Sydney to be selected
  mapView.selectedMarker = sydneyMarker;

  self.view = mapView;
}

@end
