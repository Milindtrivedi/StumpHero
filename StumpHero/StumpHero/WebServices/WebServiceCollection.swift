//
//  WebServiceCollection.swift
//  StumpHero
//
//  Created by Milind Trivedi on 09/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import Foundation


protocol getMatchCase {
    func getMatchDetails() async throws -> MatchDatum
}

class getMatchCaseImpl: getMatchCase {
    func getMatchDetails() async throws -> MatchDatum {
        
        if isConnectedToNetwork() {
            
            //MARK: - IMPORTANT READ INSTRUCTIONS GIVEN BELOW FIRST !!
            
            //MARK: - IN ORDER TO SWITCH URL JUST CHANGE THE GetWSUrl(.nzin/or/.sapk)
            /// This will automatically return string constructed with Endpoint with baseURL
            /// This comes very handy when dealing with large list of webservice calls
            /// And most impotantly avoid duplicate and will also help with managing API verison
            
            let url = WebServicePrefix.GetWSUrl(.sapk)
            guard let url = URL(string: url) else {
                throw MyError.invalidInput(message: ErrorMessages.InvalidURL)
            }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let STRVO_MTCH = try JSONDecoder().decode(MatchDatum.self, from: data)
            
            return STRVO_MTCH
            
        } else {
            throw MyError.networkError(message: ErrorMessages.InternetErr)
        }
    }
}
