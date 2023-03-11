//
//  PlayerView.swift
//  StumpHero
//
//  Created by Milind Trivedi on 10/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

struct PlayerView: View {
    
    //MARK: - PROPERTIES
    @State private var searchText = ""
    @AppStorage("Filterselection") var Filterselection = 0
    var vm : DashboardViewModel
    var rows : MatchDatum
    var playerList = [MatchTeam]()
    var playersArrHome = [MatchPlayer]()
    var playersArrAway = [MatchPlayer]()
    @State var ShowPlayerPopUp = false
    @State private var TappedPlayer : MatchPlayer?
    
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
        
        self.playersArrHome = playersArrHome.sorted {
            guard let pos1 = Int($0.position), let pos2 = Int($1.position) else {
                return false // positions are not valid numbers, so don't swap them
            }
            return pos1 < pos2 // sort by ascending position number
        }
        
        
        self.playersArrAway = playersArrAway.sorted {
            guard let pos1 = Int($0.position), let pos2 = Int($1.position) else {
                return false // positions are not valid numbers, so don't swap them
            }
            return pos1 < pos2 // sort by ascending position number
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
            
            if searchText.isEmpty {
                players = playerList
            } else {
                players = playerList.filter {
                    $0.nameFull.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)) ||
                    $0.nameShort.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)) ||
                    $0.players.values.contains(where: { $0.nameFull.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)) })
                }
            }
            
            players = players.filter { $0.nameFull == HomeTeamName}
            
        }
        
        if Filterselection == 2 {
            
            guard let AwayTeamName = playerList.last?.nameFull else {
                return playerList
            }
            
            
            if searchText.isEmpty {
                players = playerList
            } else {
                players = playerList.filter {
                    $0.nameFull.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)) ||
                    $0.nameShort.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)) ||
                    $0.players.values.contains(where: { $0.nameFull.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)) })
                }
            }
            
            
            players = players.filter { $0.nameFull == AwayTeamName}
            
            
        }
        
        return players
    }
    
    
    //MARK: - BODY
    var body: some View {
        
        VStack(spacing: 16.0) {
            
            HeaderView(backImageName: "arrow.left", rightImageName: "gear", title: AppStrings.SquadScreentitle, isHideRightImg: true)
            
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
                                    Button {
                                        dissmissKeyBoard()
                                        TappedPlayer = player
                                        ShowPlayerPopUp = true
                                        
                                    } label: {
                                        HStack(spacing: 8.0){
                                            Text(player.position)
                                            Text(player.nameFull)
                                            
                                            Spacer()
                                            
                                            Text(player.playerInfo)
                                            
                                        }.padding()
                                            .foregroundColor(.primary)
                                    }
                                    
                                } else {
                                    if player.nameFull.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)){
                                        Button {
                                            dissmissKeyBoard()
                                            TappedPlayer = player
                                            ShowPlayerPopUp = true
                                        } label: {
                                            HStack(spacing: 8.0){
                                                Text(player.position)
                                                Text(player.nameFull)
                                                
                                                Spacer()
                                                
                                                Text(player.playerInfo)
                                                
                                            }.padding()
                                                .foregroundColor(.primary)
                                        }
                                        
                                    }
                                }
                                
                            }
                            .listRowBackground(Color("viewBG"))
                            
                        } else {
                            
                            ForEach(playersArrAway) { player in
                                if searchText.isEmpty {
                                    
                                    Button {
                                        dissmissKeyBoard()
                                        TappedPlayer = player
                                        ShowPlayerPopUp = true
                                    } label: {
                                        HStack(spacing: 8.0){
                                            Text(player.position)
                                            Text(player.nameFull)
                                            
                                            Spacer()
                                            
                                            Text(player.playerInfo)
                                            
                                        }.padding()
                                            .foregroundColor(.primary)
                                    }
                                    
                                    
                                } else {
                                    if player.nameFull.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces)){
                                        
                                        Button {
                                            dissmissKeyBoard()
                                            TappedPlayer = player
                                            ShowPlayerPopUp = true
                                        } label: {
                                            HStack(spacing: 8.0){
                                                Text(player.position)
                                                Text(player.nameFull)
                                                
                                                Spacer()
                                                
                                                Text(player.playerInfo)
                                                
                                            }.padding()
                                                .foregroundColor(.primary)
                                        }
                                    }
                                }
                            }
                            .listRowBackground(Color("viewBG"))
                        }
                    }
                }//.listStyle(.plain)
            }
        }
        .background(
            Color("viewBG")
        )
        .popup(isPresented: $ShowPlayerPopUp, type: .floater(verticalPadding: 0, useSafeAreaInset: true), position: .bottom, closeOnTap: false, closeOnTapOutside: true, backgroundColor: .black.opacity(0.4)) {
            
            PlayerDetailsPopup(Player: $TappedPlayer)
            
            
        }
    }
}

//MARK: - PREVIEW
struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        let json : [MatchDatum] = [load("60.json")]
        PlayerView(vm: DashboardViewModel(getMatchCase: getMatchCaseImpl()), rows: json.first!)
    }
}

