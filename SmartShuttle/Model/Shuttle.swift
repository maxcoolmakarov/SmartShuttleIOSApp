//
//  Shuttle.swift
//  SmartShuttle
//
//  Created by ms41 on 12.12.21.
//

import Foundation
import MapKit

class Shuttle: NSObject, MKAnnotation {
    let id: Int
    let title: String?
    let charge: Float
    let price: Double
    let coordinate: CLLocationCoordinate2D
    
    init(id: Int, title: String, charge: Float, price: Double, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.charge = charge
        self.price = price
        self.id = id
        self.title = title
        
        super.init()
    }
    
    var subtitle: String? {
        return String(price)
      }
    
}

struct ShuttleData {
    static var carArray: [Shuttle] = [.init(id: 1, title: "SShuttle", charge: 75, price: 167.4, coordinate: CLLocationCoordinate2D(latitude: 55.756786, longitude: 37.617633)),
                                      .init(id: 2, title: "SShuttle", charge: 37, price: 160.9, coordinate: CLLocationCoordinate2D(latitude: 55.755786, longitude: 37.614633)),
                                      .init(id: 3, title: "Busik", charge: 8, price: 201.6, coordinate: CLLocationCoordinate2D(latitude: 55.758786, longitude: 37.615633))
    ]
    
}
