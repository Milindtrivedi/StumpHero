//
//  Dashboard.swift
//  StumpHero
//
//  Created by Apple on 09/03/23.
//

import SwiftUI

struct Dashboard: View {
    
    @StateObject private var viewModel = DashboardViewModel(getMatchCase: getMatchCaseImpl())
    
    var body: some View {
        
        VStack {
            if viewModel.matches.isEmpty {
                Text("Loading...")
            } else {
                
                Text(String(describing: viewModel.matches.count))
                
            }
        }
        .task {
            await viewModel.getMatchData()
        }
        
        .alert(isPresented: $viewModel.showErrorPopup) {
            Alert(title: Text(viewModel.error),
                  message: nil,
                  dismissButton: .default(Text("OK")){
                viewModel.showErrorPopup = false
                viewModel.error = ""
            }
            )
        }
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
