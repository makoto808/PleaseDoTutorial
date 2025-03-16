//
//  CTAButton.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/16/25.
//

import SwiftUI

struct CTAButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                
                Text(title)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
        }
        .frame(maxHeight: 65)
    }
}

#Preview {
    CTAButton(title: "Confirm") {}
}
