//
//  MapViewController.swift
//  Test01
//
//  Created by Max Pavlov on 12.01.22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    var viewModel: MapViewModelType?
    let annotation = MKPointAnnotation()

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let viewModel = viewModel else { return }
        annotation.coordinate = CLLocationCoordinate2D(latitude: viewModel.latitude, longitude: viewModel.longitude)
        annotation.title = "\(viewModel.name)\n \(viewModel.adress)"
        mapView.addAnnotation(annotation)
    }
}
