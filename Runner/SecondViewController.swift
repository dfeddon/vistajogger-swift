//
//  SecondViewController.swift
//  Runner
//
//  Created by Ben Willems on 4/9/15.
//  Copyright (c) 2015 Ben Willems. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var location = CLLocationCoordinate2D(
            latitude: 43.0667,
            longitude: -89.4000
        )
        
        var span = MKCoordinateSpanMake(0.5, 0.5)
        var region = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location//setCoordinate(location)
        annotation.title = "Madison"
        annotation.subtitle = "Wisconsin!"
        
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

