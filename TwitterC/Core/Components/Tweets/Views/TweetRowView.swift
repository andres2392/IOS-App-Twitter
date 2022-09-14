//
//  TweetRowView.swift
//  TwitterC
//
//  Created by PDWS on 9/1/22.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    // MARK: - PROPERTIES
    @ObservedObject var viewModel: TweetRowViewModel
    
    init(tweet: Tweet){
        self.viewModel = TweetRowViewModel(tweet: tweet)
    }
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading){
            
            //Profile Image and User Tweet
            if let user = viewModel.tweet.user{
                HStack(alignment: .top, spacing: 12){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    
                    // User Info & Tweet Caption
                    VStack(alignment: .leading, spacing: 4){
                        
                        //User Info
                            HStack {
                                Text(user.fullname)
                                    .font(.subheadline)
                                .bold()
                                
                                Text("@\(user.username)")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                
                                Text("2w")
                                    .foregroundColor(.gray)
                                    .font(.caption)
                                
                            }//: HSTACK USER INFO
                        
                        //Tweet Caption
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                        
                    }//: VSTACK USER AND TWEET

                }//: HSTACK PRO AND TWEET
                
            }
            
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
                    viewModel.tweet.didLike ?? false ?
                    viewModel.unlikeTweet() :
                    viewModel.likeTweet()
                }label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.tweet.didLike ?? false ? .red : .gray )
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
