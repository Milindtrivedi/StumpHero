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
            self.isLoading = false
            self.error = "Username and password are required"
            return
        }
        
        do {
            isLoading = true
            try authModel.authenticate(username: username, password: password) { [weak self] (result) in
                guard let self = self else { return }
                switch result {
                case .success:
                    self.isOnboarding = false
                    self.isLoading = false
                    break
                case .failure(let error):
                    self.showErrorPopup = true
                    self.error = error.self.localizedDescription
                    self.isLoading = false
                }
            }
        } catch let error {
            isLoading = false
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

