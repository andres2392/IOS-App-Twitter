//
//  ProfilePhotoSelectorView.swift
//  TwitterC
//
//  Created by PDWS on 9/9/22.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    // MARK: -  PROPERTIES
    @State private var showImagePicker = false
    @State private var selectedImage : UIImage?
    @State private var profileimage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - BODY
    var body: some View {
        
        VStack{
            AuthHeaderView(title1: "Setup account.",
                           title2: "Add a profile photo")
            
            Button{
                showImagePicker.toggle()
            }label: {
                if let profileimage = profileimage {
                    profileimage
                        .resizable()
                        .modifier(ProfileImageModifier())
                }else {
                    Image(systemName: "photo.circle")
                        .resizable()
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage){
                ImagePicker(selectedImage: $selectedImage)
            }
            .padding(.top, 44)
            
            if let selectedImage = selectedImage {
                Button{
                    viewModel.uploadProfileImage(selectedImage)
                }label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }//: BUTTON SAVE IMAGE
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
            }//: COMPARISON
            
            Spacer()
        }//: VSTACK
        .ignoresSafeArea()
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else { return }
        profileimage = Image(uiImage: selectedImage)

    }
}

private struct ProfileImageModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFit()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

// MARK: -  PREVIEW
struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}


