//
//  CustomInputField.swift
//  TwitterC
//
//  Created by Andres Gonzalez on 9/8/22.
//

import SwiftUI

struct CustomInputField: View {
    // MARK: - PROPERTIES
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    
    // MARK: - BODY
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholderText, text: $text)
            }//: VSTACK
            
            Divider()
                .background(Color(.darkGray))
        }//: HSTACK
    }
}

// MARK: - PREVIEW
struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope", placeholderText: "Email", text: .constant(""))
    }
}
