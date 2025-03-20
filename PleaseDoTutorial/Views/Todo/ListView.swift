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
    @Binding var shouldReDraw: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            if shouldReDraw {
                EmptyView()
            }
            
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
                NavigationLink(value:
                    NavPath.details(item)) {
                    ListItemView(item: item, height: 100)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .listStyle(.insetGrouped)
    }
}

#Preview {
    ListView(title: "To Do", items: .constant([
        Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low),
        Item(id: "def456", authorId: "John Doe", title: "Second Name", description: "Second Description", startDate: .now + 5, status: .inProgress, priority: .medium),
        Item(id: "ghi789", authorId: "John Doe", title: "Third Name", description: "Third Description", startDate: .now + 10, status: .todo, priority: .low)
    ]), shouldReDraw: .constant(true))
}
