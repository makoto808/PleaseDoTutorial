//
//  TitledTextField.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/15/25.
//

import SwiftUI

struct TitledTextField: View {
    let title: String
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(title):")
                .font(.caption2)
                .foregroundStyle(.secondary)
            
            TextField(placeholder, text: $text, axis: .vertical)
        }
    }
}

#Preview {
    TitledTextField(title: "Title", text: .constant(""), placeholder: "Type something here")
}

