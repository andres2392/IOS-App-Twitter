//
//  AuthenticationHeader.swift
//  TwitterC
//
//  Created by PDWS on 9/9/22.
//

import SwiftUI

struct AuthHeaderView: View {
    // MARK: - PROPERTIES
    let title1: String
    let title2: String
    
    var body: some View {
        // Header View
        VStack(alignment: .leading){
            HStack{ Spacer() }
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
        }//:VSTACK BLUE HEADER
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Hello", title2: "Welcome back.")
    }
}
