//
//  TweetRowView.swift
//  TwitterC
//
//  Created by PDWS on 9/1/22.
//

import SwiftUI

struct TweetRowView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading){
            
            //Profile Image and User Tweet
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
                
                // User Info & Tweet Caption
                VStack(alignment: .leading, spacing: 4){
                    
                    //User Info
                    HStack {
                        Text("Bruce Wayne")
                            .font(.subheadline)
                        .bold()
                        
                        Text("@batman")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                    }//: HSTACK USER INFO
                    
                    //Tweet Caption
                    Text("I beleive in Harvey Dent")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                }//: VSTACK USER AND TWEET

            }//: HSTACK PRO AND TWEET
            
            //Action Buttons
            HStack{
                Button{
                    //action here
                }label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    //action here
                }label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    //action here
                }label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    //action here
                }label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }//: HSTACK BUTTONS
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }//: VSTACK
    }
}

// MARK: - PREVIEW
struct TweetRowView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
