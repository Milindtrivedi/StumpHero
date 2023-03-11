//
//  PlayerDetailsPopup.swift
//  StumpHero
//
//  Created by Milind Trivedi on 10/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

struct PlayerDetailsPopup: View {
    
    //MARK: - PROPERTIES
    @Binding var Player : MatchPlayer?
    
    //MARK: - BODY
    var body: some View {
        ZStack{
            VStack(spacing: 16.0){
                ProfileHeaderView(imageName: "person.circle.fill", personName: Player?.nameFull ?? "")
                
                Text(Player?.playerInfo ?? "")
                    .foregroundColor(.primary)
                
                Divider()
                    .overlay(Color("Divider"))
                
                HStack {
                    Text(AppStrings.BattingTitle)
                        .foregroundColor(.primary)
                    .font(.title2)
                    .bold()
                    
                    Spacer()
                }.padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        VStack(alignment: .center, spacing: 12){
                            Text(AppStrings.BattingStyle)
                                .font(.title3)
                                .bold()
                            Text(Player?.batting.style.rawValue ?? "")
                        }.padding(.horizontal)
                            .foregroundColor(.primary)
                        
                        Divider()
                            .overlay(Color("Divider"))
                        
                        VStack(alignment: .center, spacing: 12){
                            Text(AppStrings.BattingAverage)
                                .font(.title3)
                                .bold()
                            Text(Player?.batting.average ?? "")
                        }.padding(.horizontal)
                            .foregroundColor(.primary)
                        
                        Divider()
                            .overlay(Color("Divider"))
                        
                        VStack(alignment: .center, spacing: 12){
                            Text(AppStrings.BattingStrikerate)
                                .font(.title3)
                                .bold()
                            Text(Player?.batting.strikerate ?? "")
                        }.padding(.horizontal)
                            .foregroundColor(.primary)
                        
                        Divider()
                            .overlay(Color("Divider"))
                        
                        VStack(alignment: .center, spacing: 12){
                            Text(AppStrings.BattingRuns)
                                .font(.title3)
                                .bold()
                            Text(Player?.batting.runs ?? "")
                        }.padding(.horizontal)
                            .foregroundColor(.primary)
                    }
                }.frame(height: 100.0)
                
                HStack {
                    Text(AppStrings.BowlingTitle)
                        .foregroundColor(.primary)
                    .font(.title2)
                    .bold()
                    
                    Spacer()
                }.padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        VStack(alignment: .center, spacing: 12){
                            Text(AppStrings.BowlingStyle)
                                .font(.title3)
                                .bold()
                            Text(Player?.bowling.style ?? "")
                        }.padding(.horizontal)
                            .foregroundColor(.primary)
                        
                        Divider()
                            .overlay(Color("Divider"))
                        
                        VStack(alignment: .center, spacing: 12){
                            Text(AppStrings.BowlingAverage)
                                .font(.title3)
                                .bold()
                            Text(Player?.bowling.average ?? "")
                        }.padding(.horizontal)
                            .foregroundColor(.primary)
                        
                        Divider()
                            .overlay(Color("Divider"))
                        
                        VStack(alignment: .center, spacing: 12){
                            Text(AppStrings.BowlingEconomyrate)
                                .font(.title3)
                                .bold()
                            Text(Player?.bowling.economyrate ?? "")
                        }.padding(.horizontal)
                            .foregroundColor(.primary)
                        
                        Divider()
                            .overlay(Color("Divider"))
                        
                        VStack(alignment: .center, spacing: 12){
                            Text(AppStrings.BowlingWickets)
                                .font(.title3)
                                .bold()
                            Text(Player?.bowling.wickets ?? "")
                        }.padding(.horizontal)
                            .foregroundColor(.primary)
                    }
                }.frame(height: 100.0)
                
              
                
                
            }.frame(width: UIScreen.screenWidth, height: 600.0)
        }.background(Color("viewBG"))
    }
}
//MARK: - PREVIEW
struct PlayerDetailsPopup_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailsPopup(Player: .constant(MatchPlayer(position: "1", nameFull: "Milind",iskeeper: false, batting: MatchBatting(style: MatchStyle.lhb, average: "17.60", strikerate: "99.43", runs: "176"), bowling: MatchBowling(style: "RFM", average: "27.21", economyrate: "5.66", wickets: "71"), iscaptain: false)))
    }
}
