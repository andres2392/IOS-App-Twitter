//
//  ExploteView.swift
//  TwitterC
//
//  Created by PDWS on 9/8/22.
//

import SwiftUI

struct ExploreView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    LazyVStack{
                        ForEach(0 ... 25, id: \.self){_ in
                            NavigationLink{
                                ProfileView()
                            } label: {
                                UserRowView()
                            }
                        }//: LOOP
                    }//: LAZYV
                }//: SCROLL
            }//: VSTACK
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }//: NAV VIEW
    }
}

// MARK: - PREVIEW
struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
