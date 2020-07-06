//
//  ListHeaderView.swift
//  CovidCount
//
//  Created by Matthew Garlington on 7/5/20.
//

import SwiftUI

struct ListHeaderView: View {
    
    
    
    
    var body: some View {
        
        HStack {
            Text("Country")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 60, alignment: .leading)
                .padding(.leading, 15)
            Spacer()
            
            Text("Confirmed")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 60)
                .padding(.leading, 5)
            Spacer()
            Text("Death")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 60)
                .padding(.leading, 5)
            Spacer()
            Text("Recovered")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 70)
                .padding(.trailing, 15)
            Spacer()
         }
        .background(Color.gray)
         }
        }
     

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView()
    }
}
