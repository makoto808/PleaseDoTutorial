//
//  LoginVM.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/17/25.
//

import Foundation

final class LoginVM: ObservableObject {
    
    enum Status {
        case unknown, loggedIn, loggedOut
    }
    @Published var loginStatus: Status = .unknown
    
    @Published var isLoggingIn = true {
        didSet {
            if isLoggingIn {
                toggleText = "Don't have an account?"
                prompt = "Sign up here!"
            } else {
                toggleText = "Already have an account?"
                prompt = "Login here!"
            }
        }
    }
    
    @Published var toggleText = "Don't have an account?"
    @Published var prompt = "Sign up here!"
}
