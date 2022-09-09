//
//  NewTeetView.swift
//  TwitterC
//
//  Created by Andres Gonzalez on 9/8/22.
//

import SwiftUI

struct NewTeetView: View {
    // MARK: - PROPERTIES
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    
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
                    print("Tweet")
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
              Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("What's happening? ", text: $caption )
            }//: HSTACK IMAGE
            .padding()
        }//: VSTACK
    }
}

struct NewTeetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTeetView()
    }
}
