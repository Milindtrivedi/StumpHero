//
//  AuthModel.swift
//  StumpHero
//
//  Created by Milind Trivedi on 09/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import Foundation

class AuthModel {
    func authenticate(username: String, password: String, completion: @escaping (Result<String,Error>) -> Void) throws {
        // send request to the server to authenticate the user
        // for example:
        // let endpoint = "https://example.com/authenticate"
        // let params = ["username": username, "password": password]
        // send request to endpoint with params
        // handle response and call completion with .success("authenticated") or .failure(Error)
        
        if isConnectedToNetwork() {
            if username.localizedCaseInsensitiveContains("milind") && password.localizedCaseInsensitiveContains("apple") {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5){
                    completion(.success("authenticated"))
                }
            } else {
                throw MyError.invalidInput(message: ErrorMessages.IncorrectLoginInput)
            }
        }  else {
            throw MyError.networkError(message: ErrorMessages.InternetErr)
        }
    }
}

enum MyError: Error {
    case invalidInput(message: String)
    case networkError(message: String)
    case parsingError(message: String)
}

