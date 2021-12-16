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
    
    let shuttlecontroller = MyViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        // Do any additional setup after loading the view.
        checkLocationServises(mapView)
//        present(showMyViewPresentComtr(), animated: true)
//        showMyViewPresentComtr()
//        mapView.addAnnotation(ShuttleData.carArray[0])
        print(ShuttleData.carArray[0].title)
        
        let artwork = Artwork(
          title: "King David Kalakaua",
          locationName: "Waikiki Gateway Park",
          discipline: "Sculpture",
          coordinate: CLLocationCoordinate2D(latitude: 37.786834, longitude: -122.405517))
//        mapView.addAnnotation(artwork)
    }
    
    func showMyViewPresentComtr() {
        print("delegare self", shuttlecontroller)
        present(shuttlecontroller, animated: true)
        if let sheet = shuttlecontroller.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.prefersEdgeAttachedInCompactHeight = true
            print("delegare self", shuttlecontroller)
//            sheet.delegate = shuttlecontroller
            
        }
       
    }

    
    @IBOutlet weak var mapView: MKMapView!
    
    let clocationmanager = CLLocationManager()
    
    
    func checkLocationServises(_ mapView: MKMapView) {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuth(mapView)
//            clocationmanager.delegate = self
            clocationmanager.desiredAccuracy = kCLLocationAccuracyBest
            clocationmanager.distanceFilter = kCLHeadingFilterNone
            clocationmanager.startUpdatingLocation()
            let location = clocationmanager.location?.coordinate
            mapView.addAnnotations(ShuttleData.carArray)
//            mapView.interactions =
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
                let artwork = view.annotation as? Shuttle
                print(artwork?.id)
                print("blalala")
//                showMyViewPresentComtr()
                present(shuttlecontroller.showMyViewPresentComtr(), animated: true)
            }
        }
}

