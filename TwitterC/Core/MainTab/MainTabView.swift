//
//  MainTabView.swift
//  TwitterC
//
//  Created by PDWS on 9/8/22.
//

import SwiftUI

struct MainTabView: View {
    // MARK: - PROPERTIES
    @State private var selectedIndex = 0
    
    // MARK: - BODY
    var body: some View {
        TabView(selection: $selectedIndex){
            FeedView()
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem{
                    Image(systemName: "house")
                }
                .tag(0)
            ExploreView()
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            NotificationView()
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem{
                    Image(systemName: "bell")
                }
                .tag(2)
            MessagesView()
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem{
                    Image(systemName: "envelope")
                }
                .tag(3)
        }//: TABVIEW
    }
}

// MARK: - PREVIEW
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
