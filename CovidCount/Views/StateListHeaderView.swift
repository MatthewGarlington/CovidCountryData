//
//  StateListHeader.swift
//  CovidCount
//
//  Created by Matthew Garlington on 7/6/20.
//

import SwiftUI

struct StateListHeaderView: View {
    
    
    
    
    var body: some View {
        
        HStack {
            Text("State")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(width: 60, alignment: .leading)
                .padding(.leading, 15)
            Spacer()
            
            Text("Positive")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 60)
                .padding(.leading, 5)
            Spacer()
            Text("Deaths")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 60)
                .padding(.leading, 5)
            Spacer()
            Text("Recovered")
                .fontWeight(.bold)
                .font(.subheadline)
                .frame(height: 60)
                .padding(.leading, 5)
            Spacer()
        
         }
        .background(Color.gray)
         }
        }
     

struct StateListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StateListHeaderView()
    }
}
