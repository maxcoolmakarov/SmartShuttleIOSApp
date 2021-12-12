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
    let charge: Int
    let price: Double
    let coordinate: CLLocationCoordinate2D
    
    init(id: Int, title: String, charge: Int, price: Double, coordinate: CLLocationCoordinate2D) {
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
    static var carArray: [Shuttle] = [.init(id: 1, title: "SShuttle", charge: 75, price: 167.4, coordinate: CLLocationCoordinate2D(latitude: 37.785834, longitude: -122.407517)),
                                      .init(id: 2, title: "SShuttle", charge: 37, price: 160.9, coordinate: CLLocationCoordinate2D(latitude: 37.786834, longitude: -122.405517)),
                                      .init(id: 3, title: "Busik", charge: 69, price: 201.6, coordinate: CLLocationCoordinate2D(latitude: 37.783834, longitude: -122.406017))
    ]
    
}


class Artwork: NSObject, MKAnnotation {
  let title: String?
  let locationName: String?
  let discipline: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    locationName: String?,
    discipline: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.locationName = locationName
    self.discipline = discipline
    self.coordinate = coordinate

    super.init()
  }

  var subtitle: String? {
    return locationName
  }
}
