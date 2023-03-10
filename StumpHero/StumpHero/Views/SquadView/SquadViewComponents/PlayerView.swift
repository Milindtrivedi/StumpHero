//
//  PlayerView.swift
//  StumpHero
//
//  Created by Apple on 10/03/23.
//

import SwiftUI

struct PlayerView: View {
    
    @State private var searchText = ""
    @AppStorage("Filterselection") var Filterselection = 0
    
    var vm : DashboardViewModel
    var rows : MatchDatum
    var playerList = [MatchTeam]()
    var playersArrHome = [MatchPlayer]()
    var playersArrAway = [MatchPlayer]()
    
    
    init(searchText: String = "", Filterselection: Int = 0, vm: DashboardViewModel, rows: MatchDatum) {
        self.vm = vm
        self.rows = rows
        
        guard let HomeSquad = rows.teams[self.rows.matchdetail.teamHome] else { return }
        guard let AwaySquad = rows.teams[self.rows.matchdetail.teamAway] else { return }
        
        var teamarr = [MatchTeam]()
        
        teamarr.append(HomeSquad)
        teamarr.append(AwaySquad)
        
        self.playerList = teamarr
        
        
        for playeritemsHome in HomeSquad.players {
            playersArrHome.append(playeritemsHome.value)
        }
        
        for playeritemsaway in AwaySquad.players {
            playersArrAway.append(playeritemsaway.value)
        }
        
    }
    
    
    var filteredPlayerList: [MatchTeam] {
        
        var players = playerList
        
        
        if Filterselection == 0 {
            if searchText.isEmpty {
                players = playerList
            } else {
                players = playerList.filter {
                    $0.nameFull.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)) ||
                    $0.nameShort.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)) ||
                    $0.players.values.contains(where: { $0.nameFull.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)) })
                }
            }
        }
        
        if Filterselection == 1 {
            
            guard let HomeTeamName = playerList.first?.nameFull else {
                return playerList
            }
            players = players.filter { $0.nameFull == HomeTeamName}
            
        }
        
        if Filterselection == 2 {
            
            guard let AwayTeamName = playerList.last?.nameFull else {
                return playerList
            }
            players = players.filter { $0.nameFull == AwayTeamName}
            
            
        }
        
        return players
    }
    
    
    
    var body: some View {
        
        VStack(spacing: 16.0) {
            
            HeaderView(backImageName: "arrow.left", rightImageName: "gear", title: "Squad Information", isHideRightImg: true)
            
            SearchView(text: $searchText)
            
            CustomPlayerFilter(vm: vm, rows: rows)
            
            if filteredPlayerList.isEmpty {
                Text(AppStrings.PlayerNoDataTxt)
                Spacer()
            } else {
                
                List(filteredPlayerList) { list in
                    
                    Section(list.nameFull) {
                        if list.nameFull == vm.getTeamName(data: rows, id: rows.matchdetail.teamHome)?.nameFull {
                            ForEach(playersArrHome) { player in
                                if searchText.isEmpty {
                                    Text(player.nameFull)
                                } else {
                                    if player.nameFull.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)){
                                        Text(player.nameFull)
                                    }
                                }
                            }
                            .listRowBackground(Color(hex: AppConstants.ViewBackGroundClr))
                        } else {
                            
                            ForEach(playersArrAway) { player in
                                if searchText.isEmpty {
                                    Text(player.nameFull)
                                } else {
                                    if player.nameFull.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)){
                                        Text(player.nameFull)
                                    }
                                }
                            }
                            .listRowBackground(Color(hex: AppConstants.ViewBackGroundClr))
                        }
                    }
                    
                }//.listStyle(.plain)
            }
        }
        .background(
            Color(hex: AppConstants.ViewBackGroundClr)
        )
    }
    
    
    
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let json : [MatchDatum] = [load("60.json")]
        
        
        PlayerView(vm: DashboardViewModel(getMatchCase: getMatchCaseImpl()), rows: json.first!)
    }
}

