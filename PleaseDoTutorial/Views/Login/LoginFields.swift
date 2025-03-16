//
//  LoginFields.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/16/25.
//

import SwiftUI

struct LoginFields: View {
    @State private var email = ""
    var body: some View {
        VStack(spacing: 12) {
            EmailTextField(placeholder: "user@email.com", text: $email)
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    LoginFields()
}
