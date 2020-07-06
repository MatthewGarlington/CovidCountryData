//
//  CovidFetchResponse.swift
//  CovidCount
//
//  Created by Matthew Garlington on 7/5/20.
//

import Foundation
import SwiftyJSON
import Alamofire


class CovidFetchRequest: ObservableObject {
    
    
    
    @Published var allCountries: [CountryData] = []
    @Published var totalData: TotalData = testTotalData
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "0d5ce136acmsha0935b31dcc0e53p15e7b1jsn99349520e7b2"
    ]
   
    init() {
        
        getAllCountries()
        getCurrentTotal()
    }
        
        func getCurrentTotal() {
            
            
            
            AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
                
                let result = response.data
              
                if result != nil {
                    
                    let json = JSON(result!)
              //      print(json)
                    
                    let confirmed = json[0]["confirmed"].intValue
                    let recovered = json[0]["recovered"].intValue
                    let deaths = json[0]["deaths"].intValue
                    let critical = json[0]["critical"].intValue
                    
                    self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered)
                } else {
                    self.totalData = testTotalData
                }
        }
        }
    
    func getAllCountries() {
        
        
        AF.request("https://covid-19-data.p.rapidapi.com/country/all?format=json", headers: headers).responseJSON { response in
            
            let result = response.value
            var allCount: [CountryData] = []
            if result != nil {
                
                    let dataDictionary = result as! [Dictionary<String, Any>]
                
                for countryData in dataDictionary {
                    
                    let country = countryData["country"] as? String ?? "error"
                    let longitude = countryData["longitude"] as? Double ?? 0.0
                    let latitude = countryData["latitude"] as? Double ?? 0.0
                    let confirmed = countryData["confirmed"] as? Int ?? 0
                    let recovered = countryData["recovered"] as? Int ?? 0
                    let deaths = countryData["deaths"] as? Int ?? 0
                    let critical = countryData["critical"] as? Int ?? 0
                    
                    
                    let countryObject = CountryData(country: country, confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered, longitude: longitude, latitude: latitude)
                    
                    allCount.append(countryObject)
                }
            }
            self.allCountries = allCount.sorted(by:  { $0.confirmed > $1.confirmed})
            
    }
    
}

}

