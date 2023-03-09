//
//  AuthModel.swift
//  StumpHero
//
//  Created by Apple on 09/03/23.
//

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
                throw MyError.invalidInput(message: "Username and Password is incorrect")
            }
        }  else {
            throw MyError.networkError(message: "You are not connected with the internet please check your connectivity")
        }
    }
}

enum MyError: Error {
    case invalidInput(message: String)
    case networkError(message: String)
    case parsingError(message: String)
}

