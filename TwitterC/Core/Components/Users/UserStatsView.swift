//
//  UserStatsView.swift
//  TwitterC
//
//  Created by Andres Gonzalez on 9/8/22.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("807")
                    .font(.subheadline)
                    .bold()
                
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }//: HSTACK FOLLOWIN
             

            HStack(spacing: 4){
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                    
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
                }//: HSTACK FOLLOWER
        }//: HSTACK FOLLOWS
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
