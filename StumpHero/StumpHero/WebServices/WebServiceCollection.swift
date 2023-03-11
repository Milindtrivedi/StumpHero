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
            
            let url = WebServicePrefix.GetWSUrl(.sapk)
            guard let url = URL(string: url) else {
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

let BASE_URL = "https://demo.sportz.io/"

struct WebServicePrefix {
    
    static func GetWSUrl(_ serviceType : WSRequestType) -> String {
        
        var serviceURl: NSString?
        switch serviceType {
        case .nzin:
            serviceURl = "nzin01312019187360.json"
            break
        case .sapk:
            serviceURl = "sapk01222019186652.json"
            break
        }
        return "\(BASE_URL)\(serviceURl!)"
    }
}
    

public enum WSRequestType : Int {
    case nzin
    case sapk
}
