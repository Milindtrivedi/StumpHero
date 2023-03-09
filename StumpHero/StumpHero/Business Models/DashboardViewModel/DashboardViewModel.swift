//
//  DashboardViewModel.swift
//  StumpHero
//
//  Created by Apple on 09/03/23.
//

import SwiftUI

@MainActor
class DashboardViewModel: ObservableObject {
    
    private let getMatchCase: getMatchCase
    @Published var matches: [MatchDatum] = []
    @Published var showErrorPopup = false
    @Published var error: String = ""
    @Published var isLoading: Bool = false
    
    
    init(getMatchCase: getMatchCase) {
        self.getMatchCase = getMatchCase
    }
    
    func getMatchData() async {
        
        isLoading = true
        
        do {
            let dataRecieved = try await getMatchCase.getMatchDetails()
            self.matches.removeAll()
            self.matches.append(dataRecieved)
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
                self.showErrorPopup = true
                self.error = error.localizedDescription
            }
        }
    }
}
