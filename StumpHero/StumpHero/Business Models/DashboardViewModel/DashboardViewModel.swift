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
    @Published var matches: [MatchDatum] = [load("52.json"),load("60.json")]//= []//
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
            isLoading = false
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
    
    func getTeamName(id: String) -> MatchTeam? {
        
        for items in self.matches {
            guard let name = items.teams.first(where: {$0.key == id} ) else {
                return nil
            }
            return name.value
        }
        return nil
    }
    
    func getDayOfWeek(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        if let date = dateFormatter.date(from: dateString) {
            let calendar = Calendar(identifier: .gregorian)
            let dayOfWeek = calendar.component(.weekday, from: date)
            let weekdays = calendar.weekdaySymbols
            return weekdays[dayOfWeek - 1]
        } else {
            return nil
        }
    }
    
    func convertToAMPM(_ timeString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        if let date = dateFormatter.date(from: timeString) {
            dateFormatter.dateFormat = "h:mm a"
            return dateFormatter.string(from: date)
        } else {
            return nil
        }
    }

}


