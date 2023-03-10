//
//  PlayerDetailsPopup.swift
//  StumpHero
//
//  Created by Milind Trivedi on 10/03/23.
//

import SwiftUI

struct PlayerDetailsPopup: View {
    
    var Player : MatchPlayer
    
    var body: some View {
        ZStack{
            VStack(spacing: 16.0){
                ProfileHeaderView(imageName: "person.circle.fill", personName: Player.nameFull)
                
                Text(Player.playerInfo)
                    .foregroundColor(.white)
                
                Divider()
                    .overlay {
                        Color.white
                    }
                
                HStack {
                Text("Batting")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                    
                    Spacer()
                }.padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        VStack(alignment: .center, spacing: 12){
                            Text("Style")
                                .font(.title3)
                                .bold()
                            Text(Player.batting.style.rawValue)
                        }.padding(.horizontal)
                            .foregroundColor(.white)
                        
                        Divider()
                            .overlay {
                                Color.white
                            }
                        
                        VStack(alignment: .center, spacing: 12){
                            Text("Average")
                                .font(.title3)
                                .bold()
                            Text(Player.batting.average)
                        }.padding(.horizontal)
                            .foregroundColor(.white)
                        
                        Divider()
                            .overlay {
                                Color.white
                            }
                        
                        VStack(alignment: .center, spacing: 12){
                            Text("Strikerate")
                                .font(.title3)
                                .bold()
                            Text(Player.batting.strikerate)
                        }.padding(.horizontal)
                            .foregroundColor(.white)
                        
                        Divider()
                            .overlay {
                                Color.white
                            }
                        
                        VStack(alignment: .center, spacing: 12){
                            Text("Runs")
                                .font(.title3)
                                .bold()
                            Text(Player.batting.runs)
                        }.padding(.horizontal)
                            .foregroundColor(.white)
                    }
                }.frame(height: 100.0)
                
                HStack {
                Text("Bowling")
                    .foregroundColor(.white)
                    .font(.title2)
                    .bold()
                    
                    Spacer()
                }.padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        VStack(alignment: .center, spacing: 12){
                            Text("Style")
                                .font(.title3)
                                .bold()
                            Text(Player.bowling.style)
                        }.padding(.horizontal)
                            .foregroundColor(.white)
                        
                        Divider()
                            .overlay {
                                Color.white
                            }
                        
                        VStack(alignment: .center, spacing: 12){
                            Text("Average")
                                .font(.title3)
                                .bold()
                            Text(Player.bowling.average)
                        }.padding(.horizontal)
                            .foregroundColor(.white)
                        
                        Divider()
                            .overlay {
                                Color.white
                            }
                        
                        VStack(alignment: .center, spacing: 12){
                            Text("Economyrate")
                                .font(.title3)
                                .bold()
                            Text(Player.bowling.economyrate)
                        }.padding(.horizontal)
                            .foregroundColor(.white)
                        
                        Divider()
                            .overlay {
                                Color.white
                            }
                        
                        VStack(alignment: .center, spacing: 12){
                            Text("Wickets")
                                .font(.title3)
                                .bold()
                            Text(Player.bowling.wickets)
                        }.padding(.horizontal)
                            .foregroundColor(.white)
                    }
                }.frame(height: 100.0)
                
              
                
                
            }.frame(width: UIScreen.screenWidth, height: 600.0)
        }.background(Color(hex: AppConstants.PopUpBgClr))
    }
}

struct PlayerDetailsPopup_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailsPopup(Player: MatchPlayer(position: "1", nameFull: "Milind",iskeeper: false, batting: MatchBatting(style: MatchStyle.lhb, average: "17.60", strikerate: "99.43", runs: "176"), bowling: MatchBowling(style: "RFM", average: "27.21", economyrate: "5.66", wickets: "71"), iscaptain: false))
    }
}
