//
//  WebServicePrefix.swift
//  StumpHero
//
//  Created by Milind Trivedi on 11/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import Foundation

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
