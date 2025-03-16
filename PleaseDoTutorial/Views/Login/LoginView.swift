//
//  LoginView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/16/25.
//

import SwiftUI

struct LoginView: View {
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
        }
    }
}

#Preview {
    LoginView()
}
