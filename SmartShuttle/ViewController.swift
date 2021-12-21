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
    
    let locationManager = CLLocationManager()
    
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


    func checkLocationServises(_ map: MKMapView) {
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.requestAlwaysAuthorization()
            self.locationManager.requestWhenInUseAuthorization()
            
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
            }
            map.delegate = self
            if let coor = map.userLocation.location?.coordinate {
                map.setCenter(coor, animated: true)
            }
            mapView.addAnnotations(ShuttleData.carArray)
        }
    }
    
    
    
    func checkLocationAuth(_ mapView: MKMapView) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        mapView.mapType = MKMapType.standard
        print(locValue)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        let Identifier = "annotation"
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Identifier) ??  MKPinAnnotationView(annotation: annotation, reuseIdentifier: Identifier)

        annotationView.canShowCallout = false
        if annotation is MKUserLocation {
            return nil
        } else if annotation is Shuttle {
            annotationView.image = UIImage(named: "logo")
            annotationView.frame.size = CGSize(width: 70, height: 70)
            return annotationView
        } else {
            annotationView.isSelected = false
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
                mapView.deselectAnnotation(view.annotation, animated: false)
            }
        }
}

