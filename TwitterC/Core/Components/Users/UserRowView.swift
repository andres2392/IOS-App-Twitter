//
//  UserRowView.swift
//  TwitterC
//
//  Created by PDWS on 9/8/22.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    // MARK: - PROPERTIES
    let user: User
    
    // MARK: - BODY
    var body: some View {
        HStack(spacing: 12){
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 56, height: 56)
            
            VStack(alignment: .leading, spacing: 4){
                Text(user.username)
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text(user.fullname)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }//: VSTACK
            Spacer()
        }//: HSTACK
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

