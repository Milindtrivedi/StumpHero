//
//  SplashScreen.swift
//  StumpHero
//
//  Created by Apple on 09/03/23.
//

import SwiftUI

struct SplashScreen: View {
    
    //MARK: - PROPERTIES
    @State private var isAnimating: Bool = false
    @State private var MoveToDashboard: Bool = false
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(systemName: "figure.cricket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.screenWidth * 0.7, height: UIScreen.screenWidth * 0.9)
                    .opacity(isAnimating ? 1.0 : 0.1)
                    .foregroundColor(Color(hex: AppConstants.TextYellowClr))
                    .padding()
                
            }//:ZSTACK
            .frame(maxWidth: UIScreen.screenWidth, maxHeight: UIScreen.screenHeight)
            .ignoresSafeArea()
            .background(
                Color(hex: AppConstants.ViewBackGroundClr)
            )
            .onAppear{
                withAnimation(Animation.easeInOut(duration: 0.99).repeatForever()) {
                    isAnimating = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.8){
                    self.MoveToDashboard = true
                }
            }//: ON APPEAR
            .onDisappear{
                
            }//: ON DISAPPEAR IN CASE ANY COMPLETION TASK NEEDS TO BE PERFORMED 
            .navigationDestination(isPresented: $MoveToDashboard) {
                
                if isOnboarding {
                    LoginView()
                       .navigationBarBackButtonHidden()
                       .navigationBarHidden(true)
                } else {
                    Dashboard()
                        .navigationBarBackButtonHidden()
                        .navigationBarHidden(true)
                }
            }
        }//: NSTACK
        .navigationViewStyle(.stack)
    }//: BODY
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
