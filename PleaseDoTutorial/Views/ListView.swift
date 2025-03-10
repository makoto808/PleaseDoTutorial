//
//  ListView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/9/25.
//

import SwiftUI

struct ListView: View {
    let title: String
    @Binding var items: [Item]
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, maxHeight: 32)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.orange)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.white, lineWidth: 2)
                        }
                }
                .padding(.horizontal)
                .padding(.top)
            
            List($items) { $item in
                Text("item 1")
                
                Text("item 1")
                
                Text("item 1")
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    ListView(title: "To Do", items: .constant([
        Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now),
        Item(id: "def456", authorId: "John Doe", title: "Second Name", description: "Second Description", startDate: .now + 5),
        Item(id: "ghi789", authorId: "John Doe", title: "Third Name", description: "Third Description", startDate: .now + 10)
    ]))
}
