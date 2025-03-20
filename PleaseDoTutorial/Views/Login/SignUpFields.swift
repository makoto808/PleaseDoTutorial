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
    
    enum Field: Hashable {
        case fname, lname, email, pw
    }
    @FocusState private var isKeyboardFocused: Field?
    
    var body: some View {
        VStack(spacing: 12) {
            KeyboardView(placeholder: "First Name", text: $fname)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
                .focused($isKeyboardFocused, equals: .fname)
            
            KeyboardView(placeholder: "Last Name", text: $lname)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
                .focused($isKeyboardFocused, equals: .lname)
            
            EmailTextField(placeholder: "user@email.com", text: $email)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
                .focused($isKeyboardFocused, equals: .email)
            
            PasswordField(placeholder: "password", text: $pw)
                .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
                .focused($isKeyboardFocused, equals: .pw)
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Cancel") {
                    guard let isKeyboardFocused else { return }
                    switch isKeyboardFocused {
                    case .fname:
                        fname = ""
                    case .lname:
                        lname = ""
                    case .email:
                        email = ""
                    case .pw:
                        pw = ""
                    }
                    self.isKeyboardFocused = nil
                }
                
                Button("Done") {
                    isKeyboardFocused = nil
                }
            }
        }
    }
}
#Preview {
    SignUpFields(fname: .constant(""), lname: .constant(""), email: .constant(""), pw: .constant(""))
}
