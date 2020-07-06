//
//  TotalDataView.swift
//  CovidCount
//
//  Created by Matthew Garlington on 7/5/20.
//

import SwiftUI

struct TotalDataView: View {
    var totalData: TotalData
    
    var body: some View {
        VStack {
            
            HStack {
                
                TotalDataCard(number: totalData.confirmed.formatNumber(), name: "Confirmed")
               
                TotalDataCard(number: totalData.critical.formatNumber(), name: "Critical", color: .yellow)
                
                TotalDataCard(number: totalData.deaths.formatNumber(), name: "Deaths", color: .red)
                
              
            }
            
            HStack {
                
                TotalDataCard(number: String(format: "%.2f", totalData.fatalityRate), name: "Death %", color: .red)
               
                TotalDataCard(number: totalData.recovered.formatNumber(), name: "Recovered", color: .green)
                
                TotalDataCard(number: String(format: "%.2f", totalData.recoveredRate), name: "Recovery %", color: .green)
                
              
        }
        } .frame(height: 170)
        .padding (/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
}
}

struct TotalDataView_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataView(totalData: testTotalData)
    }
}
