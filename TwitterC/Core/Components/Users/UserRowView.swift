//
//  UserRowView.swift
//  TwitterC
//
//  Created by PDWS on 9/8/22.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12){
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4){
                Text("joder")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("Heath leadger")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }//: VSTACK
            Spacer()
        }//: HSTACK
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
