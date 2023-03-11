//
//  Dashboard.swift
//  StumpHero
//
//  Created by Milind Trivedi on 09/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

struct Dashboard: View {
    
    //MARK: - PROPERTIES
    
    @StateObject private var viewModel = DashboardViewModel(getMatchCase: getMatchCaseImpl())
    @AppStorage("selection") var selection = 0
    @State var ShowPlayerScreen = false
    @AppStorage("Filterselection") var Filterselection = 0
    let notificationManager = NotificationManager()
    @State private var hasRequestedNotificationPermission = false
    @State var ShowNotificationAlert = false
    
    //MARK: - BODY
    
    var body: some View {
        
        VStack {
            
            HeaderView(backImageName: "bell", rightImageName: "gear", title: AppStrings.DashboardHeaderTitle, isHideRightImg: false)
            
            FilterView()
                .padding(.horizontal)
            
            if selection == 0 && !viewModel.matches.isEmpty {
                Group {
                    ScrollView {
                        VStack(spacing: 16.0) {
                            
                            ForEach(viewModel.matches, id: \.self) { rows in
                                MatchView(vm: viewModel, rows: rows)
                                    .padding()
                                    .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 0, y: 0)
                                    .onTapGesture {
                                        Filterselection = 0
                                        ShowPlayerScreen = true
                                    }
                                    .navigationDestination(isPresented: $ShowPlayerScreen) {
                                        PlayerView(vm: viewModel, rows: rows)
                                            .navigationBarBackButtonHidden()
                                            .navigationBarHidden(true)
                                    }
                                
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
        
        .background(Color("viewBG"))
        
        .task {
            if viewModel.matches.isEmpty {
                await viewModel.getMatchData()
            }
        }
        
        .alert(isPresented: $viewModel.showErrorPopup) {
            Alert(title: Text(viewModel.error),
                  message: nil,
                  dismissButton: .default(Text(AppStrings.ok)){
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
        
        .onAppear{
            if !hasRequestedNotificationPermission {
                notificationManager.requestPermission { granted in
                    if granted {
                        ShowNotificationAlert = false
                        notificationManager.scheduleNotification(title: Notifications.Title, body: Notifications.Body, timeInterval: Notifications.timeInterval)
                    } else {
                        ShowNotificationAlert = true
                    }
                }
                hasRequestedNotificationPermission = true
            }
        }
        
        .alert(isPresented: $ShowNotificationAlert) {
            Alert(title: Text(Notifications.PrompAlertTitle),
                  message: Text(Notifications.PrompAlertSubTitle),
                  primaryButton: .destructive(Text(Notifications.PrompAlertNo)) {
                ShowNotificationAlert = false
            },
                  secondaryButton: .default(Text(Notifications.PrompAlertYes)) {
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                
                UIApplication.shared.open(settingsUrl)
            })
        }
    }
}
//MARK: - PREVIEW
struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
