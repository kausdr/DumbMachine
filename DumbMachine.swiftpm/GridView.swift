//
//  GridView.swift
//  WWDC24
//
//  Created by Kauane Santana on 09/02/24.
//

import SwiftUI

struct GridView: View {
    
    var body: some View {
        VStack (alignment: .leading){
                Text("OUTPUT:")
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                
            
            Image("grid")
                .resizable()
                .frame(width: 400, height: 400)
            
        }
        
    }
}

#Preview {
    GridView()
}
