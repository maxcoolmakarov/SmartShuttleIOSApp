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
    
    
    let shuttleBoard = UIStoryboard(name: "ChoseShuttle", bundle: nil)
    var shuttleVC = MyViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        checkLocationServises(mapView)
    }

    
    @IBOutlet weak var mapView: MKMapView!
    
    let clocationmanager = CLLocationManager()
    
    func sheetPrepare() {
        shuttleVC = shuttleBoard.instantiateViewController(identifier: "myVCID") as! MyViewController
        if let sheet = shuttleVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.prefersEdgeAttachedInCompactHeight = true
            print("delegare self", self)
            sheet.delegate = shuttleVC
        }
    }


    func checkLocationServises(_ mapView: MKMapView) {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuth(mapView)
            clocationmanager.desiredAccuracy = kCLLocationAccuracyBest
            clocationmanager.distanceFilter = kCLHeadingFilterNone
            clocationmanager.startUpdatingLocation()
            let location = clocationmanager.location?.coordinate
            mapView.addAnnotations(ShuttleData.carArray)
            let viewRegion = MKCoordinateRegion(center: location!, latitudinalMeters: 300, longitudinalMeters: 300)
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

extension ViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        let Identifier = "annotation"
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Identifier) ??  MKPinAnnotationView(annotation: annotation, reuseIdentifier: Identifier)

        annotationView.canShowCallout = true
        if annotation is MKUserLocation {
            return nil
        } else if annotation is Shuttle {
            annotationView.image = UIImage(named: "logo")
            annotationView.frame.size = CGSize(width: 70, height: 70)
            return annotationView
        } else {
            return nil
        }
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView)
        {
            if view.annotation is Shuttle {
                let selectedShuttle = view.annotation as! Shuttle
                if !shuttleVC.opened {
                    sheetPrepare()
                    present(shuttleVC, animated: true)
                    shuttleVC.setData(selectedShuttle)
                } else {
                    shuttleVC.setData(selectedShuttle)
                }
            }
        }
}

