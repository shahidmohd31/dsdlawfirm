//
//  MapViewController.swift
//  LawyerApp
//
//  Created by Naiyer Aghaz on 15/06/17.
//  Copyright © 2017 Naiyer Aghaz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//import LocationObjects

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet var mapUserView: MKMapView!
    var locationManager = CLLocationManager()
    let initialLocation = CLLocation(latitude:40.707194, longitude:-74.009673)
    let regionRadius: CLLocationDistance = 1000
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.requestAlwaysAuthorization()
        // For use in foreground
//        
        self.navigationController?.navigationBar.topItem?.title = ""
       self.locationManager.requestWhenInUseAuthorization()
//        
//        if (CLLocationManager.locationServicesEnabled())
//        {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//            locationManager.startUpdatingLocation()
        
        
        centerMapOnLocation(location: initialLocation)
        
        let objects = LocationObjects(
            title : "40 Wall Street ( The Trump Plaza Building) , 25th Floor", locationName : "New York, NY 10005", descipline: "", coordinate:CLLocationCoordinate2D(latitude:40.707194, longitude:-74.009673))
         mapUserView.addAnnotation(objects)
        
        let navView = UIView()
        navView.frame = CGRect.init(x: 0, y: 2, width: 80, height: 32)
       
        let callImage   = UIImage(named: "phone")!
        let mailImage = UIImage(named: "email-1-32")!
        let call   = UIBarButtonItem(image: callImage,  style: .plain, target: self, action: #selector(callMethod))
        
        
        call.tintColor = UIColor.white
        let mail = UIBarButtonItem(image: mailImage,  style: .plain, target: self, action:#selector(MapViewController.mailcalled))
        mail.tintColor = UIColor.white
        navigationItem.rightBarButtonItems = [call, mail]
    
        }
   
    
    func mailcalled(){
         print("email call !!")
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let contact = storyboard.instantiateViewController(withIdentifier: "mailToDSD")
        self.navigationController?.pushViewController(contact, animated: true)
        
    }

    
    func centerMapOnLocation(location:CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapUserView.setRegion(coordinateRegion, animated: true)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationItem.title = "Map Location"
    }
        
    }
extension MapViewController: MKMapViewDelegate {
    
    // 1
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? LocationObjects {
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapUserView.dequeueReusableAnnotationView(withIdentifier: identifier)
                as? MKPinAnnotationView { // 2
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure) as UIView
            }
            return view
        }
        return nil
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! LocationObjects
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
}
extension UIViewController{


    func callMethod(){
        
        let phone = "+1212-428-2000"
        if let phoneCallURL = URL(string: "tel://\(phone)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
}
    





