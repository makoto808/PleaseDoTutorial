//
//  LoginManager.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/17/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol LoginManagerDelegate where Self: LoginVM {
    func authStateDidChange(isLoggedIn: Bool)
}

final class LoginManager {
    
    weak var delegate: LoginManagerDelegate?
    private let db = Firestore.firestore()
    private var handler: AuthStateDidChangeListenerHandle?
    var currentUser: User? {
        didSet {
            delegate?.authStateDidChange(isLoggedIn: currentUser != nil)
        }
    }
    
    init() {
        setupListener()
    }
    
    deinit {
        removeListener()
    }
    
    func signUp(_ fname: String, _ lname: String, _ email: String, _ pw: String) {
        Task {
            do {
                let result = try await Auth.auth().createUser(withEmail: email, password: pw)
                currentUser = result.user
                let id = result.user.uid
                try await db.collection("Users").document(id).setData([
                    "fname": fname,
                    "lname": lname,
                    "email": email,
                    "id": id
                ])
                print("Document successfully written!")
                setupListener()
            } catch {
                print(error)
            }
        }
    }
    
    func signIn( _ email: String, _ pw: String) {
        Task {
            do {
                let result =  try await Auth.auth().signIn(withEmail: email, password: pw)
                currentUser = result.user
                print("Successfully signed in user!")
                setupListener()
            } catch {
                print(error)
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            removeListener()
            print("Successfully signed out user!")
        } catch {
            print(error)
        }
    }
    
    func setupListener() {
        guard handler == nil else { return }
        handler = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            guard let self else { return }
            currentUser = auth.currentUser
            
        }
    }
    
    func removeListener() {
        if let h = handler {
            Auth.auth().removeStateDidChangeListener(h)
        }
    }
}
