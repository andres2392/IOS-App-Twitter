//
//  ExploreViewModel.swift
//  TwitterC
//
//  Created by PDWS on 9/13/22.
//

import Foundation

class ExploreViewModel: ObservableObject{
    // MARK: - PROPERTIES
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchableUsers: [User]{
        if searchText.isEmpty{
            return users
        }else {
            let lowercasedQuery = searchText.lowercased()
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }//: COMPARISON
    }
    
    let service = UserService()
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
        }
    }
}
