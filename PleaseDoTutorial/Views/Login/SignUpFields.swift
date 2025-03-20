//
//  SignUpFields.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/16/25.
//

import SwiftUI

struct SignUpFields: View {
    @Binding var fname: String
    @Binding var lname: String
    @Binding var email: String
    @Binding var pw: String
    
    var body: some View {
        VStack(spacing: 12) {
            KeyboardView(placeholder: "First Name", text: $fname)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
            
            KeyboardView(placeholder: "Last Name", text: $lname)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
            
            EmailTextField(placeholder: "user@email.com", text: $email)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
            
            PasswordField(placeholder: "password", text: $pw)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
        }
        .padding(.horizontal)
    }
}
#Preview {
    SignUpFields(fname: .constant(""), lname: .constant(""), email: .constant(""), pw: .constant(""))
}
