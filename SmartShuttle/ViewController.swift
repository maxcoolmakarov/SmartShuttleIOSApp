//
//  ViewController.swift
//  SmartShuttle
//
//  Created by ms41 on 11.11.21.
//

import UIKit
import MapKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //checkLocationServises(mapView)
//        self.navigationController?.addChild(MyViewController())
//        navigationController?.pushViewController(MyViewController(), animated:  true)
//        showMyViewPresentComtr()
//        present(vc, animated: true)
        present(vc, animated: true)
        
    }
    
    func showMyViewPresentComtr() {
        let mystoryboard = UIStoryboard(name: "ChoseShuttle", bundle: nil)
        let vc = mystoryboard.instantiateViewController(withIdentifier: "myVCID")
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
        present(vc, animated: true)
        
    }


    
    @IBOutlet weak var mapView: MKMapView!
    
    let clocationmanager = CLLocationManager()
    
//    let vc = MyViewController()
    let vc = WebController()
    
         
    
    func checkLocationServises(_ mapView: MKMapView) {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuth(mapView)
            clocationmanager.desiredAccuracy = kCLLocationAccuracyBest
            clocationmanager.distanceFilter = kCLHeadingFilterNone
            clocationmanager.startUpdatingLocation()
            let location = clocationmanager.location?.coordinate
            let viewRegion = MKCoordinateRegion(center: location!, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(viewRegion, animated: true)
        }
    }
    
    func checkLocationAuth(_ mapView: MKMapView) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
        case .notDetermined:
            clocationmanager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        }
    }
    
}

