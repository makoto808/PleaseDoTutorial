//
//  LoginButton.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/16/25.
//

import SwiftUI

struct LoginButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(
                        LinearGradient(colors: [.lightGray, .white],
                                       startPoint: .leading,
                                       endPoint: .trailing)
                    )
                
                Image(systemName: "arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 30, maxHeight: 30)
                    .padding(.trailing)
                    .foregroundStyle(.white)
            }
        }
        .background(
            LinearGradient(colors: [.dullBlue, .lightBlue],
                           startPoint: .leading,
                           endPoint: .trailing)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LoginButton(title: "Login") {}
}
