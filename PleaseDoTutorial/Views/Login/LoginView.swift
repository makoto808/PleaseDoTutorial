//
//  LoginView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/16/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginVM()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            LoginTitleView()
            
            Text(vm.titleText)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            if vm.isLoggingIn {
                LoginFields(email: $vm.email, pw: $vm.pw)
            } else {
                SignUpFields(fname: $vm.fname, lname: $vm.lname, email: $vm.newEmail, pw: $vm.newPW)
            }
            
            HStack {
                Spacer()
                
                LoginButton(title: vm.titleText) {
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
