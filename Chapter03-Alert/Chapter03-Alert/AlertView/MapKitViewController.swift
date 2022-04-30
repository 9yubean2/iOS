//
//  MapKitViewController.swift
//  Chapter03-Alert
//
//  Created by 이규빈 on 2022/05/01.
//

import UIKit
import MapKit

class MapKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //add mapkit view in viewcontroller
        let mapkitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.view = mapkitView
        self.preferredContentSize.height = 200
        //set position
        let pos = CLLocationCoordinate2D(latitude: 37.5068, longitude: 127.0257)
        //map property
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        //set map region
        let region = MKCoordinateRegion(center: pos, span: span)
        
        //display region in map
        mapkitView.region = region
        mapkitView.regionThatFits(region)
        
        //pin the location
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapkitView.addAnnotation(point)
    }
    

    

}
