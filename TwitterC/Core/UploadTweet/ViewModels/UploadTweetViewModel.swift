//
//  UploadTweetViewModel.swift
//  TwitterC
//
//  Created by PDWS on 9/13/22.
//

import Foundation

class UploadTweetViewModel: ObservableObject{
    // MARK: - PROPERTIES
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption){ success in
            if success{
                //dismiss screen somehow
                self.didUploadTweet = true
            }else {
                //show error message to user..
                
            }
        }
    }
}
