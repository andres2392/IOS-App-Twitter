//
//  ExploteView.swift
//  TwitterC
//
//  Created by PDWS on 9/8/22.
//

import SwiftUI

struct ExploreView: View {
    // MARK: - PROPERTIES
    @ObservedObject var viewModel = ExploreViewModel()
    
    // MARK: - BODY
    var body: some View {
        VStack{
            SearchBar(text: $viewModel.searchText)
                .padding()
            
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.searchableUsers){user in
                        NavigationLink{
                                ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }//: LOOP
                }//: LAZYV
            }//: SCROLL
        }//: VSTACK
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - PREVIEW
struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
