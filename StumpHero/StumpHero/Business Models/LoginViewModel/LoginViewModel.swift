//
//  LoginViewModel.swift
//  StumpHero
//
//  Created by Apple on 09/03/23.
//

import SwiftUI


class LoginViewModel: ObservableObject {
    let characterLimit = 10
    @Published var isOk = true
    @Published var username: String = "" {
        didSet {
            if username.count > characterLimit {
                username = String(username.prefix(characterLimit))
                isOk = false
            } else {
                isOk = true
            }
        }
    }
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    @Published var showErrorPopup = false
    @Published var error: String = ""
    @Published var loggedIn : Bool = false
    
    
    
    let authModel = AuthModel()
    
    func login() {
        guard !username.isEmpty && !password.isEmpty else {
            self.showErrorPopup = true
            self.error = "Username and password are required"
            return
        }
        isLoading = true
        
        do {
            try authModel.authenticate(username: username, password: password) { [weak self] (result) in
                guard let self = self else { return }
                self.isLoading = false
                switch result {
                case .success:
                    self.isOnboarding = false
                    break
                case .failure(let error):
                    self.showErrorPopup = true
                    self.error = error.self.localizedDescription
                }
            }
        } catch let error {
            switch error {
            case MyError.invalidInput(let message):
                self.showErrorPopup = true
                self.error = message
            case MyError.networkError(let message):
                self.showErrorPopup = true
                self.error = message
            default:
                break
            }
        }
        
    }
}

