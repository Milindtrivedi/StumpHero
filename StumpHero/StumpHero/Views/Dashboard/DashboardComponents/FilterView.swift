//
//  FilterView.swift
//  StumpHero
//
//  Created by Milind Trivedi on 09/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

struct FilterView: View {
    
    //MARK: - PROPERTIES
    @AppStorage("selection") var selection = 0
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Picker("", selection: $selection) {
                Text(AppStrings.filterLiveTitle).tag(0)
                Text(AppStrings.filterUpcomingTitle).tag(1)
                Text(AppStrings.filterNewsTitle).tag(2)
            }
            .pickerStyle(.segmented)
            .background {
                Color("viewBG")
            }
        }.background(Material.thin)
    }
}

//MARK: - PREVIEW
struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
