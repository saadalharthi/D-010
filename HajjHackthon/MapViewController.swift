//
//  MapViewController.swift
//  HajjHackthon
//
//  Created by 3bdelsalam on 8/2/18.
//  Copyright © 2018 3bdelsalam. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation


class MapViewController: UIViewController,GMSMapViewDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    var marks = [GMSMarker]()
    var doctors = [Doctor]()
    
    
    var locationManager = CLLocationManager()
    var center = CLLocationCoordinate2D()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func DrawMapMarkers(Doc:Doctor) {
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: Double(Doc.lat ?? "0.0")!, longitude: Double(Doc.longitude ?? "0.0")!)

        
        marker.title = Doc.name ?? ""
        marker.snippet = Doc.speciality ?? ""
        marker.map = mapView
        marker.userData = Doc
        marks.append(marker)
        
        
    }
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("info tapped")
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        mapView.selectedMarker = nil
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        var location = locations.last
        print(location)
        
        center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        
        
        
        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()
        
        // draw markers
        var doc1 = Doctor(name: "saad", spec: "قلب", long: "\((location?.coordinate.longitude)! - 0.003)", lat: "\((location?.coordinate.latitude)! - 0.00002)")
        
        var doc2 = Doctor(name: "مصطفى الحسيني", spec: "مخ وأعصاب", long: "\((location?.coordinate.longitude)! + 0.0004)", lat: "\((location?.coordinate.latitude)! + 0.0004)")

        
        var doc3 = Doctor(name: "yousif", spec: "باطنة", long: "\((location?.coordinate.longitude)! + 0.002)", lat: "\((location?.coordinate.latitude)!)")

        var doc4 = Doctor(name: "ather", spec: "نساء وتوليد", long: "\((location?.coordinate.longitude)! + 0.0008)", lat: "\((location?.coordinate.latitude)! + 0.0008)")
        
        var doc5 = Doctor(name: "samah", spec: "عظام", long: "\((location?.coordinate.longitude)! + 0.0004)", lat: "\((location?.coordinate.latitude)! + 0.0006)")
        
        self.doctors.append(doc1)
        self.doctors.append(doc2)
        self.doctors.append(doc3)
        self.doctors.append(doc4)
        self.doctors.append(doc5)

        
        for doc in self.doctors {
            self.DrawMapMarkers(Doc: doc)
        }
        var bounds = GMSCoordinateBounds()
        for marker in self.marks {
            bounds = bounds.includingCoordinate(marker.position)
        }
        bounds = bounds.includingCoordinate((location?.coordinate)!)
        self.mapView.animate(with: GMSCameraUpdate.fit(bounds, with: UIEdgeInsetsMake(50.0 , 50.0 ,50.0 ,50.0)))
        

        
    }
    
    
    
    
    
    
}
