//
//  FeedView.swift
//  TwitterC
//
//  Created by PDWS on 9/1/22.
//

import SwiftUI

struct FeedView: View {
    // MARK: - PROPERTIES
    @State private var ShowNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.tweets) { tweet in
                        TweetRowView(tweet: tweet)
                            .padding()
                    }//: LOOP
                }//: LAZYV
            }//: SCROLL
            
            Button{
                ShowNewTweetView.toggle()
            }label: {
                Image(systemName: "pencil.and.outline")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(Color(.white))
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $ShowNewTweetView){
                NewTeetView()
            }//: BUTTON NEWTWEET
        }//: ZSTACK
        .navigationBarTitleDisplayMode(.inline)
    }
}


// MARK: - PREVIEW
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
