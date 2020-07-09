//
//  StateDetailView.swift
//  CovidCount
//
//  Created by Matthew Garlington on 7/6/20.
//
//
import SwiftUI

struct StateDetailView: View {
    var finalData: FinalData
    

    @ObservedObject var covidFetch = CovidFetchRequest()
    
    
    var body: some View {
        
        NavigationView{
        
        VStack {
        VStack{
            
            StateDetailRow(number: finalData.state, name: "State")
            StateDetailRow(number: finalData.lastUpdateEt, name: "Last Updated Time")
            StateDetailRow(number: finalData.positive.formatNumber(), name: "Positive", color: .red)
            StateDetailRow(number: finalData.death.formatNumber(), name: "Deaths", color: .red)
            StateDetailRow(number: finalData.negative.formatNumber(), name: "Negative", color: .green)
            StateDetailRow(number: finalData.recovered.formatNumber(), name: "Recovered", color: .green)
            
            
        }
        .background(Color("cardBackgroundGray"))
        .cornerRadius(8)
        .padding()
            
    Spacer()
         
}
        
        .navigationTitle("\(finalData.state.uppercased())")
        .font(.title)
        .foregroundColor(.black)
        .padding(.top,2)
    }
}
}

struct StateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StateDetailView(finalData: testFinalData)
    }
}
