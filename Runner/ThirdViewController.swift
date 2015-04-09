//
//  ThirdViewController.swift
//  Runner
//
//  Created by Derek Feddon on 4/9/15.
//  Copyright (c) 2015 Derek Feddon. All rights reserved.
//

import UIKit
import MapKit

class ThirdViewController: UIViewController
{
        @IBOutlet weak var mapView: MKMapView!
    
    var source:MKMapItem = MKMapItem()
    var destination:MKMapItem = MKMapItem()
    var directionsResponse:MKDirectionsResponse = MKDirectionsResponse()
    var currentRoute = MKRoute()
    var route = MKRoute()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var sourceLatitude:Double = 28.3252880
        var sourceLongitude:Double = -81.5331290
        
        var destinationLatitude:Double = 43.0667
        var destinationLongitude:Double = -89.4000
        
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: sourceLatitude, longitude: sourceLongitude)
        
        geocoder.reverseGeocodeLocation(location, completionHandler:
        {
            (placemarks:[AnyObject]?, error:NSError?) -> Void in
            
            if placemarks?.count > 0
            {
                if let placemark: MKPlacemark = placemarks![0] as? MKPlacemark
                {
                    self.source =  MKMapItem(placemark: placemark)
                }
            }
        })
        
        let geocoder2 = CLGeocoder()
        let location2 = CLLocation(latitude: destinationLatitude, longitude: destinationLongitude)
        
        geocoder2.reverseGeocodeLocation(location2, completionHandler:
            {
                (placemarks:[AnyObject]?, error:NSError?) -> Void in
                if placemarks?.count > 0
                {
                    if let placemark: MKPlacemark = placemarks![0] as? MKPlacemark
                    {
                        self.source =  MKMapItem(placemark: placemark)
                    }
                }
        })
        
        let directionsRequest:MKDirectionsRequest = MKDirectionsRequest()
        
        // source and destination are the relevant MKMapItems
        directionsRequest.setSource(source)
        directionsRequest.setDestination(destination)
        
        // Specify the transportation type
        directionsRequest.transportType = MKDirectionsTransportType.Walking// .Automobile;
        
        // If you're open to getting more than one route,
        // requestsAlternateRoutes = true; else requestsAlternateRoutes = false;
        directionsRequest.requestsAlternateRoutes = false
        
        let directions = MKDirections(request: directionsRequest)
        
        directions.calculateDirectionsWithCompletionHandler ({
            (response: MKDirectionsResponse?, error: NSError?) in
            println(response?.description)
            
            if (error != nil) {println(error)}
//            if error == nil
//            {
//                self.directionsResponse = response!
//                // Get whichever currentRoute you'd like, ex. 0
//                self.route = self.directionsResponse.routes[self.currentRoute] as MKRoute
//            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

