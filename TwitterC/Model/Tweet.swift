//
//  Tweet.swift
//  TwitterC
//
//  Created by PDWS on 9/13/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable{
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
