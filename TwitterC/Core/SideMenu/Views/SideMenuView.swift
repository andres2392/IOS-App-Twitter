//
//  SideMenuView.swift
//  TwitterC
//
//  Created by PDWS on 9/8/22.
//

import SwiftUI

struct SideMenuView: View {
// MARK: - PROPERTIES
    @EnvironmentObject var authViewModel: AuthViewModel
    
// MARK: - BODY
    var body: some View {
        
        VStack (alignment: .leading, spacing: 32){
            VStack(alignment: .leading){
                Circle()
                    .frame(width: 48, height: 48)
                
                VStack(alignment: .leading, spacing: 4){
                    Text("Andres Gonzalez")
                        .font(.headline)
                    
                    Text("@aigonz")
                        .font(.caption)
                        .foregroundColor(.gray)
                }//: VSTACK PROFILE NAME
                
                UserStatsView()
                    .padding(.vertical)
                
            }//VSTACK HEADERVIEW
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue){ viewModel in
                if viewModel == .profile {
                    NavigationLink{
                        ProfileView()
                    }label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else if viewModel == .logout {
                    Button{
                        authViewModel.signOut()
                    }label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                }else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }//: COMPARISON
                
            }//: LOOP
            
            Spacer()
        }//: VSTACK SIDEBAR
        

    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
