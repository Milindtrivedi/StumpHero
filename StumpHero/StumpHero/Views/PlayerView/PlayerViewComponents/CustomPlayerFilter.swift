//
//  CustomPlayerFilter.swift
//  StumpHero
//
//  Created by Milind Trivedi on 10/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

struct CustomPlayerFilter: View {
    
    //MARK: - PROPERTIES
    var vm : DashboardViewModel
    var rows : MatchDatum
    @AppStorage("Filterselection") var Filterselection = 0
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Picker("", selection: $Filterselection) {
                Text(AppStrings.CustomPlayerFilterButtonAllTitle).tag(0)
                Text(vm.getTeamName(data: rows,id: rows.matchdetail.teamHome)?.nameFull ?? "err").tag(1)
                Text(vm.getTeamName(data: rows,id: rows.matchdetail.teamAway)?.nameFull ?? "err").tag(2)
            }
            .pickerStyle(.segmented)
            .background {
                Color("viewBG")
            }
        }.background(Material.thin)
            .padding()
    }
}

//MARK: - PREVIEW
struct CustomPlayerFilter_Previews: PreviewProvider {
    static var previews: some View {
        
        let json : [MatchDatum] = [load("60.json")]
        CustomPlayerFilter(vm: DashboardViewModel(getMatchCase: getMatchCaseImpl()), rows: json.first!)
    }
}
