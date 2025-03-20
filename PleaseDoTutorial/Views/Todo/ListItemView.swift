//
//  ListItemView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/12/25.
//

import SwiftUI

struct ListItemView: View {
    
    let item: Item
    let height: CGFloat
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 3) {
                Text(item.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(item.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: item.priority.img)
                .resizable()
                .scaledToFit()
                .foregroundStyle(item.priority.color)
                .frame(maxWidth: height * 0.45)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListItemView(item: Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low), height: 100)
}
