//
//  FeedViewModel.swift
//  TwitterC
//
//  Created by PDWS on 9/13/22.
//

import Foundation

class FeedViewModel: ObservableObject{
    // MARK: - PROPERTIES
    @Published var tweets = [Tweet]()
    let tweetService = TweetService()
    let userService = UserService()
    
    
    init(){
        fetchTweets()
    }
    
    func fetchTweets(){
        tweetService.fetchTweets{ tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count{
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.tweets[i].user = user
                }
            }
        }
    }
}
