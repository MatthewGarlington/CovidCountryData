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

struct StateData {
    
    let countrycode: String
    let country: String
    let state: String
    let latitude: Double
    let longitude: Double
    let confirmed: Int
    let deaths: Int
}
struct Value {
    
    let countrycode: String
    let country: String
    let state: String
    let latitude: Double
    let longitude: Double
    let confirmed: Int
    let deaths: Int
}

struct FinalData {
    
    var negative: Int
    var lastUpdateEt: String
    var recovered: Int
    var state: String
    var death: Int
    var date: Int
    var positive: Int
    

}
    
    
    
    












let testFinalData = FinalData(negative: 200, lastUpdateEt: "10-1", recovered: 100, state: "MD", death: 200, date: 200, positive: 200)

let testTotalData = TotalData(confirmed: 200, critical: 200, deaths: 200, recovered: 200)

let testCountryData = CountryData(country: "USA", confirmed: 500, critical: 300, deaths: 200, recovered: 100, longitude: 0.0, latitude: 0.0)
    
let testStateData = StateData(countrycode: "US", country: "United States of America", state: "Maryland", latitude: 0.0, longitude: 0.0, confirmed: 200, deaths: 200)
let testValueData = Value(countrycode: "US", country: "United States of America", state: "Maryland", latitude: 0.0, longitude: 0.0, confirmed: 200, deaths: 200)


