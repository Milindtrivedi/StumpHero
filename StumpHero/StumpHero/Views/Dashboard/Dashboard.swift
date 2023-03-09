//
//  Dashboard.swift
//  StumpHero
//
//  Created by Apple on 09/03/23.
//

import SwiftUI

struct Dashboard: View {
    
    @StateObject private var viewModel = DashboardViewModel(getMatchCase: getMatchCaseImpl())
    @AppStorage("selection") var selection = 0
    
    var body: some View {
        
        VStack {
            
            HeaderView(backImageName: "bell", rightImageName: "gear", title: "Fixtures")
            
            FilterView()
                .padding(.horizontal)
            
            if selection == 0 {
                Group {
                    ScrollView {
                        VStack(spacing: 16.0) {
                            
                            ForEach(viewModel.matches, id: \.self) { rows in
                                MatchView(vm: viewModel, rows: rows)
                                    .padding()
                            }
                            Spacer()
                            
                        }
                        .frame(width: UIScreen.screenWidth)
                    }
                }
            } else {
                Spacer()
                
                Text(AppStrings.DashboardNoDataTxt)
                
                Spacer()
            }
        }
        
        .background(Color(hex: AppConstants.ViewBackGroundClr))
        
        //        .task {
        //            await viewModel.getMatchData()
        //        }
        
        .alert(isPresented: $viewModel.showErrorPopup) {
            Alert(title: Text(viewModel.error),
                  message: nil,
                  dismissButton: .default(Text("OK")){
                viewModel.showErrorPopup = false
                viewModel.error = ""
            }
            )
        }
        
        .overlay {
            if viewModel.isLoading {
                ZStack {
                    Color(white: 0, opacity: 0.55)
                    AppLoader()
                }.ignoresSafeArea(.all)
                    .onTapGesture {
                        viewModel.isLoading = false
                    }
            }
        }
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
