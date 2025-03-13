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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ListItemView(item: Item(id: "abc123", authorId: "John Doe", title: "First Name", description: "First Description", startDate: .now, status: .todo, priority: .low), height: 100)
}
