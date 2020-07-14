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
    
    @Published var allFinal: [FinalData] = []
    @Published var allStatesInfo: [StateData] = []
    @Published var allStates: [StateData] = []
    @Published var stateData: StateData = testStateData
    @Published var allCountries: [CountryData] = []
    @Published var totalData: TotalData = testTotalData
    @Published var finalData: FinalData = testFinalData
    @Published var totalStateData: TotalStateData = testTotalStateData
    @Published var allHistoricStateData: [HistoricStateData] = []
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "0d5ce136acmsha0935b31dcc0e53p15e7b1jsn99349520e7b2"
    ]
   
    init() {
        
        getHistoricStateData()
        getCurrentStateTotal()
        getFinalData()
        getAllStatesInfo()
        AllStates()
        getAllStates()
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
    func getAllStates() {
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "covid19-data.p.rapidapi.com",
            "x-rapidapi-key": "0d5ce136acmsha0935b31dcc0e53p15e7b1jsn99349520e7b2"
        ]

        
        
        AF.request("https://covid19-data.p.rapidapi.com/us", headers: headers).responseJSON { response in
           
            let result = response.data
           
            if result != nil {
                
                let json = JSON(result!)
                
               // print(json)
                
                   
                
              
                    
                let countrycode = json[0]["countrycode"].stringValue
                let country = json[0]["country"].stringValue
                let state = json[0]["state"].stringValue
                let latitude = json[0]["latitude"].doubleValue
                let longitude = json[0]["longitude"].doubleValue
                let confirmed = json[0]["confirmed"].intValue
                let deaths = json[0]["deaths"].intValue
                    
                    
            self.stateData = StateData(countrycode: countrycode, country: country, state: state, latitude: latitude, longitude: longitude, confirmed: confirmed, deaths: deaths)
                
               
            } else {
                self.stateData = testStateData
                    
            }
        }
            
    }
    
func AllStates() {
    
    
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid19-data.p.rapidapi.com",
        "x-rapidapi-key": "0d5ce136acmsha0935b31dcc0e53p15e7b1jsn99349520e7b2"
    ]
    AF.request("https://covid19-data.p.rapidapi.com/us", headers: headers).responseJSON { response in
       
        let result = response.data
       
        if result != nil {
            
            let json = JSON(result!)
            
           // print(json)
            
            
            
                
                
                let countrycode = json[0]["countrycode"].stringValue
                let country = json[0]["country"].stringValue
                let state = json[0]["state"].stringValue
                let latitude = json[0]["latitude"].doubleValue
                let longitude = json[0]["longitude"].doubleValue
                let confirmed = json[0]["confirmed"].intValue
                let deaths = json[0]["deaths"].intValue
                    
              
                
                
                
                
                let stateObject = Value(countrycode: countrycode, country: country, state: state, latitude: latitude, longitude: longitude, confirmed: confirmed, deaths: deaths)
                
            
            }
            
        }
        
       
    }
    func getAllStatesInfo() {
        
        
        
        let headers: HTTPHeaders = [
            "x-rapidapi-host": "covid19-data.p.rapidapi.com",
            "x-rapidapi-key": "0d5ce136acmsha0935b31dcc0e53p15e7b1jsn99349520e7b2"
        ]
        AF.request("https://covid19-data.p.rapidapi.com/us", headers: headers).responseJSON { response in
        
      
           
            
             let result = response.value
             
             if result != nil {
               
                }
          
                var json: JSON =  [result!]
                json["countrycode"] = "countrycode"
                json["country"] = "country"
                json["state"] = "state"
                json["latitude"] = "latitude"
                json["longitude"] = "longitude"
                json["confirmed"] = "confirmed"
                json["deaths"] = "deaths"
                
                
                
                
                
                
            
                   

                
               
                      
                    }
        }
        
        
func getFinalData() {
    
  
    
    AF.request("https://covidtracking.com/api/v1/states/current.json").responseJSON { response in
        
        let result = response.value
        var allFin: [FinalData] = []
        if result != nil {
            
                let dataDictionary = result as! [Dictionary<String, Any>]
            
            for finalData in dataDictionary {
                
               
              
                
                let negative = finalData["negative"] as? Int ?? 0
                let lastUpdateEt = finalData["lastUpdateEt"] as? String ?? "error"
                let recovered = finalData["recovered"] as? Int ?? 0
                let state = finalData["state"] as? String ?? "error"
                let death = finalData["death"] as? Int ?? 0
                let date = finalData["date"] as? Int ?? 0
                let positive = finalData["positive"] as? Int ?? 0
                let deathIncrease = finalData["deathIncrease"] as? Int ?? 0
                let onVentilatorCurrently = finalData["onVentilatorCurrently"] as? Int ?? 0
                let pending = finalData["pending"] as? Int ?? 0
                
           
                let finalObject = FinalData(negative: negative, lastUpdateEt: lastUpdateEt, recovered: recovered, state: state, death: death, date: date, positive: positive, deathIncrease: deathIncrease, onVentilatorCurrently: onVentilatorCurrently, pending: pending)
                
                allFin.append(finalObject)
            }
        }
        self.allFinal = allFin.sorted(by:  { $0.deathIncrease > $1.deathIncrease})
        
}

}
    func getCurrentStateTotal() {
        
        
        
        AF.request("https://covidtracking.com/api/v1/us/daily.json").responseJSON { response in
            
            let result = response.data
          
            if result != nil {
                
                let json = JSON(result!)
          //      print(json)
                
                let total = json[0]["total"].intValue
                let positive = json[0]["positive"].intValue
                let hospitalized = json[0]["hospitalized"].intValue
                let death = json[0]["death"].intValue
                let recovered = json[0]["recovered"].intValue
                
                self.totalStateData = TotalStateData(total: total, positive: positive, hospitalized: hospitalized, death: death, recovered: recovered)
            } else {
                self.totalStateData = testTotalStateData
            }
    }
    }
    func getHistoricStateData() {
        
        
        AF.request("https://covidtracking.com/api/v1/states/ca/daily.json").responseJSON { response in
           
            let result = response.value
            var allHistoricStateData: [HistoricStateData] = []
            if result != nil {
                
                    let dataDictionary = result as! [Dictionary<String, Any>]
                
                for historicStateData in dataDictionary {
                    
                   
                  
                    
                    let state = historicStateData["state"] as? String ?? "error"
                    let lastUpdateEt = historicStateData["lastUpdateEt"] as? Int ?? 0
                    let total = historicStateData["total"] as? Int ?? 0
                    let death = historicStateData["death"] as? Int ?? 0
                    let deathIncrease = historicStateData["deathIncrease"] as? Int ?? 0
                    let hospitalizedCurrently = historicStateData["hospitalizedCurrently"] as? Int ?? 0
                    let inIcuCurrently = historicStateData["inIcuCurrently"] as? Int ?? 0
                    let positive = historicStateData["positive"] as? Int ?? 0
                    
               
                    let HistoricStateDataObject = HistoricStateData(state: state, lastUpdateEt: lastUpdateEt, total: total, death: death, deathIncrease: deathIncrease, hospitalizedCurrently: hospitalizedCurrently, inIcuCurrently: inIcuCurrently, positive: positive)
                    
                    allHistoricStateData.append(HistoricStateDataObject)
                }
            }
            self.allHistoricStateData = allHistoricStateData.sorted(by:  { $0.positive > $1.positive})
            
    }
    
}
}
            


