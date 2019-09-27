//
//  LocationObjects.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 16/06/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import MapKit
import AddressBook

class LocationObjects: NSObject, MKAnnotation  {
    
     var title: String?
    var locationName: String?
    var descipline: String?
    var coordinate: CLLocationCoordinate2D
    
     init(title: String, locationName: String, descipline: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.descipline = descipline
        self.coordinate = coordinate
        super.init()
    }
    var subtitle: String?{
    return locationName
    }
    func mapItem() -> MKMapItem {
    let addressDictionary = [String(kABPersonAddressStreetKey): subtitle]
    let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }

}
