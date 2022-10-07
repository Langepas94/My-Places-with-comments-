//
//  MapVCViewController.swift
//  My Places (with comments)
//
//  Created by Артём Тюрморезов on 06.10.2022.
//

import UIKit
import MapKit
class MapVCViewController: UIViewController {
    
    let annotationViewIdentifier = "annotationViewIdentifier"
    var place = Place()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        setupPlaceMark()
       
    }
    
    @IBAction func closeVC(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func setupPlaceMark() {
        guard let location = place.location else { return }
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print("error")
                return
            }
            guard let placemarks = placemarks else { return }
            let placemark = placemarks.first
            
            let annotation = MKPointAnnotation()
            annotation.title = self.place.name
            annotation.subtitle = self.place.type
            
            guard let placeMarkLocation = placemark?.location else { return }
            
            annotation.coordinate = placeMarkLocation.coordinate
            
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
        }
    }

}

extension MapVCViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard !(annotation is MKUserLocation) else { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationViewIdentifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationViewIdentifier)
            annotationView?.canShowCallout = true
        }
        if let imageData = place.imageData {
            let imageForBanner = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            imageForBanner.layer.cornerRadius = 10
            imageForBanner.clipsToBounds = true
            imageForBanner.image = UIImage(data: imageData)
            annotationView?.rightCalloutAccessoryView = imageForBanner
        }
        return annotationView
    }
}
