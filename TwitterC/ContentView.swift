//
//  ContentView.swift
//  TwitterC
//
//  Created by PDWS on 9/1/22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - BODY
    var body: some View {
        Group{
            //No user logged in
            if viewModel.userSession == nil{
                LoginView()
            } else {
                //Have logged in
                mainInterfaceView
            }
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView{
    
    var mainInterfaceView: some View{
        ZStack(alignment: .topLeading){
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu{
                ZStack{
                    Color(.black)
                        .opacity(showMenu ? 0.25 : 0.0)
                }.onTapGesture {
                    withAnimation(.easeInOut){
                        showMenu = false
                    }
                }
                .ignoresSafeArea()
            }//: IF SHOWMENU
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? Color.white : Color.clear)
        }//: ZSTACK
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                if let user = viewModel.currentUser {
                    Button{
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 32, height: 32)
                }
                }
            }//: BUTTON PROFILE
        }//: TOOLBAR
        .onAppear{
            showMenu = false
        }
    }
}
