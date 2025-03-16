//
//  LoginTitleView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/16/25.
//

import SwiftUI

struct LoginTitleView: View {
    var body: some View {
        HStack {
            Image("PleaseDoLogo")
                .resizable()
                .scaledToFit()
            VStack(spacing: 3) {
                Text("Please Do")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(maxWidth: 175, maxHeight: 0.7)
                    .foregroundStyle(.gray)
                
                Text("A better to do list")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxHeight: 110)
        .padding(.horizontal)
    }
}

#Preview {
    LoginTitleView()
}
