//
//  Model.swift
//  CovidCount
//
//  Created by Matthew Garlington on 7/5/20.
//

import Foundation



struct TotalData {
    
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    
    var fatalityRate: Double {
        
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    var recoveredRate: Double {
        
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

struct CountryData {
    
    let country: String
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    let longitude: Double
    let latitude: Double
    
    
    var fatalityRate: Double {
        
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    var recoveredRate: Double {
        
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

let testTotalData = TotalData(confirmed: 200, critical: 200, deaths: 200, recovered: 200)

let testCountryData = CountryData(country: "USA", confirmed: 500, critical: 300, deaths: 200, recovered: 100, longitude: 0.0, latitude: 0.0)
