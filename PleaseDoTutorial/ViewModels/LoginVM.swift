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
                titleText = "Login"
                toggleText = "Don't have an account?"
                prompt = "Sign up here!"
            } else {
                titleText = "Sign Up"
                toggleText = "Already have an account?"
                prompt = "Login here!"
            }
        }
    }
    
    @Published var titleText = "Login"
    @Published var toggleText = "Don't have an account?"
    @Published var prompt = "Sign up here!"
    
    @Published var email = ""
    @Published var pw = ""
    
    @Published var newEmail = ""
    @Published var newPW = ""
    @Published var fname = ""
    @Published var lname = ""
}
