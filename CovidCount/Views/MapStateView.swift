//
//  MapStateView.swift
//  CovidCount
//
//  Created by Matthew Garlington on 7/11/20.
//

import Foundation
import UIKit
import MapKit
import SwiftUI


struct MapStateView: UIViewRepresentable {

    
    
    @Binding var finalData: [FinalData]
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext <MapView>) {
        
        
        var allAnnotations: [CoronaCaseAnnotation] = []
        
        for data in finalData {
            
            let title = data.state + "\n Positive " + data.confirmed.formatNumber() + "\n Deaths " + data.deaths.formatNumber()
            
            let coordinate = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
            
            allAnnotations.append(CoronaCaseAnnotation(title: title, coordinate: coordinate))
        }
        
        
        uiView.annotations.forEach {uiView.removeAnnotation($0)}
        uiView.addAnnotations(allAnnotations)
        
        
    }
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }
}


class CoronaCaseAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
    
    self.title = title
    self.coordinate = coordinate
 }
}
