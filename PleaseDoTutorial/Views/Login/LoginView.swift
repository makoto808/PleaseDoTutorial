//
//  LoginView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/16/25.
//

import SwiftUI

struct LoginView: View {
    @State private var text = "Don't have an account?"
    @State private var prompt = "Sign up here"
    @State private var isLoggingIn = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            LoginTitleView()
            
            Text("Login")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            LoginFields()

            HStack {
                Spacer()
                
                LoginButton(title: "Login") {
                    print("Login Button Tapped")
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            TogglePromptView(text: $text, prompt: $prompt, isLoggingIn: $isLoggingIn)
        }
    }
}

#Preview {
    LoginView()
}
