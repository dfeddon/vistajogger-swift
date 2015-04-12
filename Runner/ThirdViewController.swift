//
//  ThirdViewController.swift
//  Runner
//
//  Created by Derek Feddon on 4/9/15.
//  Copyright (c) 2015 Derek Feddon. All rights reserved.
//

import UIKit
import AddressBook
import MapKit


class ThirdViewController: UIViewController
{
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        
        // set initial location in Honolulu
        let initialLocation = CLLocationCoordinate2D(latitude: 28.308268, longitude: -81.549415)
        let destinationLocation = CLLocationCoordinate2D(latitude: 40.746929, longitude: -73.986421)
        //centerMapOnLocation(initialLocation)
        
        let request = MKDirectionsRequest()
        
        let addressDict =
            [
                kABPersonAddressStreetKey as NSString: "1106 Banks Rose Ct",
                kABPersonAddressCityKey: "Celebration",
                kABPersonAddressStateKey: "FL",
                kABPersonAddressZIPKey: "34747"
            ]
        
        let addressDict2 =
        [
            kABPersonAddressStreetKey as NSString: "5 main st",
            kABPersonAddressCityKey: "New York",
            kABPersonAddressStateKey: "NY",
            kABPersonAddressZIPKey: "10001"
        ]
        //let sourcePlacemark:MKPlacemark = MKPlacemark()
        let sourcePlacemark = MKPlacemark(coordinate: initialLocation, addressDictionary: addressDict)//
        
        //initialLocation.coordinate//.latitude = 28.308268
        //sourcePlacemark.coordinate.longitude = -81.549415
        let sm:MKMapItem = MKMapItem(placemark: sourcePlacemark) as MKMapItem
        request.setSource(sm )
        
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: addressDict2)
//        let destinationPlacemark:MKPlacemark()
//        destinationPlacemark.coordinate.latitude = 28.308268
//        destinationPlacemark.coordinate.longitude = -81.549415
        let dm:MKMapItem = MKMapItem(placemark: destinationPlacemark)
        request.setDestination(dm)
        
        let directions = MKDirections(request: request)
        directions.calculateDirectionsWithCompletionHandler{
                                    (response: MKDirectionsResponse!, error: NSError!) in
            
            /* You can manually parse the response, but in
                                    here we will take a shortcut and use the Maps app
                                    to display our source and
                                    destination. We didn't have to make this API call at all,
                                    as we already had the map items before, but this is to
                                    demonstrate that the directions response contains more
                                    information than just the source and the destination. */
            
                                    /* Display the directions on the Maps app */
                                    let launchOptions = [
                                        MKLaunchOptionsDirectionsModeKey:
                                    MKLaunchOptionsDirectionsModeDriving]
            
                                    MKMapItem.openMapsWithItems(
                                        [response.source, response.destination],
                                        launchOptions: launchOptions)
        }

    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    func centerMapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

//// https://github.com/vandadnp/iOS-8-Swift-Programming-Cookbook/blob/master/chapter-maps/Displaying%20Directions%20on%20The%20Map/Displaying%20Directions%20on%20The%20Map/ViewController.swift
//
//
//class ThirdViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate
//{
//    var mapView: MKMapView!
//    var locationManager: CLLocationManager?
//    
//    required init(coder aDecoder: NSCoder)
//    {
//        super.init(coder: aDecoder)
//        
//        mapView = MKMapView()
//        
//    }
//    
//    /* Set up the map and add it to our view */
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        mapView.mapType = .Standard
//        mapView.frame = view.frame
//        mapView.delegate = self
//        view.addSubview(mapView)
//    }
//    
//    func provideDirections(){
//        let destination = "Godsgatan, Norrköping, Sweden"
//        CLGeocoder().geocodeAddressString(destination,
//            completionHandler: {(placemarks: [AnyObject]!, error: NSError!) in
//                
//                if error != nil{
//                    /* Handle the error here perhaps by displaying an alert */
//                } else {
//                    let request = MKDirectionsRequest()
//                    request.setSource(MKMapItem.mapItemForCurrentLocation())
//                    
//                    /* Convert the CoreLocation destination
//                    placemark to a MapKit placemark */
//                    let placemark = placemarks[0] as! CLPlacemark
//                    let destinationCoordinates =
//                    placemark.location.coordinate
//                    /* Get the placemark of the destination address */
//                    let destination = MKPlacemark(coordinate:
//                        destinationCoordinates,
//                        addressDictionary: nil)
//                    
//                    request.setDestination(MKMapItem(placemark: destination))
//                    
//                    /* Set the transportation method to automobile */
//                    request.transportType = .Walking//Automobile
//                    
//                    /* Get the directions */
//                    let directions = MKDirections(request: request)
//                    directions.calculateDirectionsWithCompletionHandler{
//                        (response: MKDirectionsResponse!, error: NSError!) in
//                        
//                        /* You can manually parse the response, but in
//                        here we will take a shortcut and use the Maps app
//                        to display our source and
//                        destination. We didn't have to make this API call at all,
//                        as we already had the map items before, but this is to
//                        demonstrate that the directions response contains more
//                        information than just the source and the destination. */
//                        
//                        /* Display the directions on the Maps app */
//                        let launchOptions = [
//                            MKLaunchOptionsDirectionsModeKey:
//                        MKLaunchOptionsDirectionsModeDriving]
//                        
//                        MKMapItem.openMapsWithItems(
//                            [response.source, response.destination],
//                            launchOptions: launchOptions)
//                    }
//                    
//                }
//                
//        })
//    }
//    
//    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus)
//    {
//        if (status == .AuthorizedWhenInUse) {
//            manager.startUpdatingLocation()
//        }
//            print("The authorization status of location " +
//                "services is changed to: ")
//            
//            switch CLLocationManager.authorizationStatus()
//            {
//                case .Denied:
//                    println("Denied")
//                case .NotDetermined:
//                    println("Not determined")
//                case .Restricted:
//                    println("Restricted")
//                default:
//                    println("Authorized")
//                    manager.startUpdatingLocation()
//                    provideDirections()
//            }
//            
//    }
//    
//    func displayAlertWithTitle(title: String, message: String){
//        let controller = UIAlertController(title: title,
//            message: message,
//            preferredStyle: .Alert)
//        
//        controller.addAction(UIAlertAction(title: "OK",
//            style: .Default,
//            handler: nil))
//        
//        presentViewController(controller, animated: true, completion: nil)
//        
//    }
//    
//    /* Add the pin to the map and center the map around the pin */
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        /* Are location services available on this device? */
//        if CLLocationManager.locationServicesEnabled(){
//            
//            /* Do we have authorization to access location services? */
//            switch CLLocationManager.authorizationStatus(){
//            case .Denied:
//                /* No */
//                displayAlertWithTitle("Not Determined",
//                    message: "Location services are not allowed for this app")
//            case .NotDetermined:
//                /* We don't know yet, we have to ask */
//                locationManager = CLLocationManager()
//                if let manager = self.locationManager{
//                    manager.delegate = self
//                    manager.requestWhenInUseAuthorization()
//                }
//            case .Restricted:
//                /* Restrictions have been applied, we have no access
//                to location services */
//                displayAlertWithTitle("Restricted",
//                    message: "Location services are not allowed for this app")
//            default:
//                provideDirections()
//            }
//            
//            
//        } else {
//            /* Location services are not enabled.
//            Take appropriate action: for instance, prompt the
//            user to enable the location services */
//            println("Location services are not enabled")
//        }
//        
//    }
//    
//}
//class ThirdViewController: UIViewController
//{
//        @IBOutlet weak var mapView: MKMapView!
//    
//    var source:MKMapItem = MKMapItem()
//    var destination:MKMapItem = MKMapItem()
//    var directionsResponse:MKDirectionsResponse = MKDirectionsResponse()
//    var currentRoute = MKRoute()
//    var route = MKRoute()
//    
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        var sourceLatitude:Double = 28.3252880
//        var sourceLongitude:Double = -81.5331290
//        
//        var destinationLatitude:Double = 43.0667
//        var destinationLongitude:Double = -89.4000
//        
//        let geocoder = CLGeocoder()
//        let location = CLLocation(latitude: sourceLatitude, longitude: sourceLongitude)
//        
//        geocoder.reverseGeocodeLocation(location, completionHandler:
//        {
//            (placemarks:[AnyObject]?, error:NSError?) -> Void in
//            
//            if placemarks?.count > 0
//            {
//                if let placemark: MKPlacemark = placemarks![0] as? MKPlacemark
//                {
//                    self.source =  MKMapItem(placemark: placemark)
//                }
//            }
//        })
//        
//        let geocoder2 = CLGeocoder()
//        let location2 = CLLocation(latitude: destinationLatitude, longitude: destinationLongitude)
//        
//        geocoder2.reverseGeocodeLocation(location2, completionHandler:
//            {
//                (placemarks:[AnyObject]?, error:NSError?) -> Void in
//                if placemarks?.count > 0
//                {
//                    if let placemark: MKPlacemark = placemarks![0] as? MKPlacemark
//                    {
//                        self.source =  MKMapItem(placemark: placemark)
//                    }
//                }
//        })
//        
//        let directionsRequest:MKDirectionsRequest = MKDirectionsRequest()
//        
//        // source and destination are the relevant MKMapItems
//        directionsRequest.setSource(source)
//        directionsRequest.setDestination(destination)
//        
//        // Specify the transportation type
//        directionsRequest.transportType = MKDirectionsTransportType.Walking// .Automobile;
//        
//        // If you're open to getting more than one route,
//        // requestsAlternateRoutes = true; else requestsAlternateRoutes = false;
//        directionsRequest.requestsAlternateRoutes = false
//        
//        let directions = MKDirections(request: directionsRequest)
//        
//        directions.calculateDirectionsWithCompletionHandler ({
//            (response: MKDirectionsResponse?, error: NSError?) in
//            println(response?.description)
//            
//            if (error != nil) {println(error)}
////            if error == nil
////            {
////                self.directionsResponse = response!
////                // Get whichever currentRoute you'd like, ex. 0
////                self.route = self.directionsResponse.routes[self.currentRoute] as MKRoute
////            }
//        })
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//}

