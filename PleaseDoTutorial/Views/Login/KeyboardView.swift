//
//  KeyboardView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/16/25.
//

import SwiftUI

struct KeyboardView: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(.roundedBorder)
            .submitLabel(.done)
            .textInputAutocapitalization(.words)
            .keyboardType(.default)
            .background(Color.clear)
    }
}

#Preview {
    KeyboardView(placeholder: "First Name", text: .constant(""))
}
