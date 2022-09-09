//
//  ProfileView.swift
//  TwitterC
//
//  Created by PDWS on 9/8/22.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - PROPERTIES
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .leading){
            headerView
            
            actionButtons
            
            userInfoDetails
            
            tweetFilterBar
            
            tweetsView

            Spacer()
            
        }//: VSTACK HEADER
    }
}

// MARK: - PREVIEW
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

// MARK: - EXTENSION
extension ProfileView{
    
    // MARK: - HEADER VIEW
    var headerView: some View{
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack{
                Button{
                    mode.wrappedValue.dismiss()
                }label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }//: BUTTON BACK
                
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x:16, y:24)
            }//: VSTACK PROFILE PHOTO
        }//: ZSTACK
        .frame(height: 96)
        
    }
    
    // MARK: - HEADER BUTTONS ACTIONS
    var actionButtons: some View{
        HStack(spacing: 12){
            Spacer()
            
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button{
                
            }label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }//: BUTTONS RIGHT
        .padding(.trailing)
        
    }
    
    // MARK: - USER INFO
    var userInfoDetails: some View{
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text("Andres Gonzalez")
                    .font(.title2)
                    .bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }//: HSTACK
            
            Text("@aigonz")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("your favorite developer")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing: 24){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text("Miami, FL")
                }//: HSTACK LOCATION
                 
                HStack{
                    Image(systemName: "link")
                    
                    Text("www.aigonzalez.dev")
                }//: HSTACK LINK
            }//: HSTACK INFO
            .font(.caption)
            .foregroundColor(.gray)
            
            UserStatsView()
            .padding(.vertical)
            
        }//: VSTACK NAMES
        .padding(.horizontal)
        
    }
    
    // MARK: - TWITTER FILTER
    var tweetFilterBar: some View{
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue){ item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if selectedFilter == item{
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else{
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture{
                    withAnimation(.easeInOut){
                        self.selectedFilter = item
                    }
                }
            }//: HSTACK FILTER BAR
        }//: HSTACK FILTER BAR
        .overlay(Divider().offset(x: 0, y: 16))
        
    }
    
    // MARK: - TWEETS VIEW
    var tweetsView: some View{
        ScrollView{
            LazyVStack{
                ForEach(0 ... 9, id: \.self){_ in
                    TweetRowView()
                        .padding()
                }
            }//: LAZYVSTACK
        }//: SCROLL TWEETS
    }
}
