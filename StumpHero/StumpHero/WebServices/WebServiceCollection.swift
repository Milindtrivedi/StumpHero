//
//  WebServiceCollection.swift
//  StumpHero
//
//  Created by Apple on 09/03/23.
//

import Foundation


protocol getMatchCase {
    func getMatchDetails() async throws -> MatchDatum
}

class getMatchCaseImpl: getMatchCase {
    func getMatchDetails() async throws -> MatchDatum {
        
        if isConnectedToNetwork() {
            
            guard let url = URL(string: "https://demo.sportz.io/sapk01222019186652.json") else {
                throw MyError.invalidInput(message: "URL is Invalid")
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let STRVO_MTCH = try JSONDecoder().decode(MatchDatum.self, from: data)
            
            return STRVO_MTCH
            
        } else {
            throw MyError.networkError(message: "You are not connected with the internet please check your connectivity")
        }
    }
}
