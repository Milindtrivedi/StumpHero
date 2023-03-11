//
//  PlayerListRow.swift
//  StumpHero
//
//  Created by Milind Trivedi on 11/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

struct PlayerListRow: View {
    
    //MARK: - PROPERTIES
    var Player : MatchPlayer
    
    //MARK: - BODY
    var body: some View {
        
        HStack(alignment: .center, spacing: 16.0){
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .foregroundColor(Color("ImgForeGroundClr"))
                .frame(width: 50.0, height: 50.0)
                .background(
                    Color.clear
                        .clipShape(Circle())
                )
            
            VStack(alignment: .leading){
                Text(Player.nameFull)
                    .foregroundColor(Color.primary)
                    .font(.title2)
                
                Text(Player.playerInfo)
                    .foregroundColor(Color("SubtitleTxtClr"))
                    .font(.callout)
                    .minimumScaleFactor(0.5)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                HStack(spacing: 4.0){
                    Text(AppStrings.viewButtonTitle)
                        .foregroundColor(.primary)
                        .padding(.horizontal, 10)
                        .font(.callout)
                }.padding(8)
                    .background(
                        Color("CapsuleBackGroundClr")
                    )
                    .clipShape(Capsule())
            }
            .disabled(true)
            
        }.padding()
            .background(Color("MatchViewBgClr"))
            .cornerRadius(9.0)
            
    }
}
//MARK: - PREVIEW
struct PlayerListRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListRow(Player: MatchPlayer(position: "1", nameFull: "Milind",iskeeper: false, batting: MatchBatting(style: MatchStyle.lhb, average: "17.60", strikerate: "99.43", runs: "176"), bowling: MatchBowling(style: "RFM", average: "27.21", economyrate: "5.66", wickets: "71"), iscaptain: false))
    }
}
