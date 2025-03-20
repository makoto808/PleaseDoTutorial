//
//  ContentView.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/9/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = LoginVM()
    
    var body: some View {
        switch vm.loginStatus {
        case .unknown:
            Text("unknown")
        case .loggedIn:
            HomeView()
        case .loggedOut:
            LoginView()
                .environmentObject(vm)
        }
    }
}

#Preview {
    ContentView()
}
