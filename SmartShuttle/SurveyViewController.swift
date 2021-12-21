//
//  SurveyViewController.swift
//  SmartShuttle
//
//  Created by ms41 on 19.12.21.
//

import UIKit
import MapKit

class SurveyViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet var speed: UILabel!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var charge: UIProgressView!
    var timer = Timer()
    var counter = 0
    var price = 0.0
    let locationManager = CLLocationManager()
    
    @IBOutlet var map: MKMapView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func stopTrip(_ sender: Any) {
        showAlert()
//        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.invalidate()
        charge.transform = charge.transform.scaledBy(x: 1, y: 3)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        map.showsScale = true
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
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        map.mapType = MKMapType.standard
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: locValue, span: span)
        map.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        map.addAnnotation(annotation)
        
    }
    
    @objc func timerAction() {
            counter += 1
            timerLabel.text = "\(counter)"
        let curspeed = 1.0 - Float((counter*4)%100)/100
            charge.setProgress(curspeed, animated: true)
            charge.progressTintColor = UIProgressView.getButteryColour(progress: curspeed)
            speed.text = "\((counter*3)%50)"
        }
    
    func showAlert() {
        let mesg: String
        mesg = "The Shuttle will stop. The cost of your trip: " + String(format: "%.2f", price*Double(counter)/3600) + " will be deducted from your account."
        let alert = UIAlertController(title: "End the trip?", message: mesg, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
                //Cancel Action
            }))
            alert.addAction(UIAlertAction(title: "Stop the trip",
                                          style: UIAlertAction.Style.default,
                                          handler: {(_: UIAlertAction!) in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        let Identifier = "myLocation"
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Identifier) ??  MKPinAnnotationView(annotation: annotation, reuseIdentifier: Identifier)

        annotationView.canShowCallout = false
        if annotation is MKUserLocation {
            return nil
        } else {
            annotationView.image = UIImage(named: "logo")
            annotationView.frame.size = CGSize(width: 70, height: 70)
            return annotationView
        }
    }

}

