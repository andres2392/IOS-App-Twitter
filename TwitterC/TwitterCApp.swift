//
//  TwitterCApp.swift
//  TwitterC
//
//  Created by PDWS on 9/1/22.
//

import SwiftUI
import Firebase

@main
struct TwitterCApp: App {
    // MARK: - PROPERTIES
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(viewModel)
        }
    }
}
