//
//  SideMenuRowView.swift
//  TwitterC
//
//  Created by Andres Gonzalez on 9/8/22.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    // MARK: -PROPERTIES
    let viewModel: SideMenuViewModel
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 16){
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(viewModel.title)
                .font(.subheadline)
                .foregroundColor(.black)
            
            Spacer()
        }//: HSTACK OPTIONS
        .frame(height: 40)
        .padding(.horizontal)
    }
}

// MARK: - PREVIEW
struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .profile)
    }
}
