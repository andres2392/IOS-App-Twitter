//
//  TweetRowViewModel.swift
//  TwitterC
//
//  Created by PDWS on 9/13/22.
//

import Foundation

class TweetRowViewModel: ObservableObject {
    // MARK: - PROPERTIES
    @Published var tweet: Tweet
    private let service = TweetService()
    
    init(tweet: Tweet){
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    // MARK: - FUNCTIONS
    func likeTweet() {
        service.likeTweet(tweet){
            self.tweet.didLike = true
        }
    }
    
    func unlikeTweet(){
        service.unlikeTweet(tweet){
            self.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet(){
        service.checkIfUserLikedTweet(tweet) { didLike in
            if didLike{
                self.tweet.didLike = true
            }
        }
    }
}
