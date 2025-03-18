//
//  LoginView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/16/25.
//

import SwiftUI

struct LoginView: View {
    @State private var vm = LoginVM()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            LoginTitleView()
            
            Text("Login")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            if vm.isLoggingIn {
                LoginFields()
            } else {
                SignUpFields()
            }
            
            HStack {
                Spacer()
                
                LoginButton(title: "Login") {
                    print("Login Button Tapped")
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            TogglePromptView(text: $vm.toggleText, prompt: $vm.prompt, isLoggingIn: $vm.isLoggingIn)
        }
    }
}

#Preview {
    LoginView()
}
