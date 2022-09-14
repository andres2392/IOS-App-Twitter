//
//  NewTeetView.swift
//  TwitterC
//
//  Created by Andres Gonzalez on 9/8/22.
//

import SwiftUI
import Kingfisher

struct NewTeetView: View {
    // MARK: - PROPERTIES
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }//: BUTTON CANCEL
                
                Spacer()
                
                Button{
                    viewModel.uploadTweet(withCaption: caption)
                }label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    
                }//: BUTTON TWEET
            }//: HSTACK
            .padding()
            HStack(alignment: .top){
                if let user = authViewModel.currentUser{
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64 , height: 64) 
                } 
                
                TextArea("What's happening? ", text: $caption )
            }//: HSTACK IMAGE
            .padding()
        }//: VSTACK
        .onReceive(viewModel.$didUploadTweet) { success in
            if success{
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewTeetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTeetView()
    }
}
