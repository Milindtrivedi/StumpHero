//
//  FilterView.swift
//  StumpHero
//
//  Created by Milind Trivedi on 09/03/23.
//

import SwiftUI

struct FilterView: View {
   
    @AppStorage("selection") var selection = 0
    
    var body: some View {
        VStack {
            Picker("", selection: $selection) {
                Text("Live").tag(0)
                Text("Upcoming").tag(1)
                Text("News").tag(2)
                    .foregroundColor(.cyan)
            }
            .pickerStyle(.segmented)
            .background {
                Color(hex: AppConstants.ViewBackGroundClr)
            }
        }.background(Material.thin)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
