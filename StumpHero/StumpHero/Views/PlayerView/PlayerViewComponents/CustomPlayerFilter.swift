//
//  CustomPlayerFilter.swift
//  StumpHero
//
//  Created by Apple on 10/03/23.
//

import SwiftUI

struct CustomPlayerFilter: View {
    
    var vm : DashboardViewModel
    var rows : MatchDatum
    @AppStorage("Filterselection") var Filterselection = 0
    
    var body: some View {
        VStack {
            Picker("", selection: $Filterselection) {
                Text(AppStrings.CustomPlayerFilterButtonAllTitle).tag(0)
                Text(vm.getTeamName(data: rows,id: rows.matchdetail.teamHome)?.nameFull ?? "err").tag(1)
                Text(vm.getTeamName(data: rows,id: rows.matchdetail.teamAway)?.nameFull ?? "err").tag(2)
                    .foregroundColor(.cyan)
            }
            .pickerStyle(.segmented)
            .background {
                Color(hex: AppConstants.ViewBackGroundClr)
            }
        }.background(Material.thin)
            .padding()
    }
}

struct CustomPlayerFilter_Previews: PreviewProvider {
    static var previews: some View {
        
        let json : [MatchDatum] = [load("60.json")]
        CustomPlayerFilter(vm: DashboardViewModel(getMatchCase: getMatchCaseImpl()), rows: json.first!)
    }
}
