//
//  LogoutPopUp.swift
//  StumpHero
//
//  Created by Milind Trivedi on 10/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI
struct LogoutPopUp: View {
    //MARK: - PROPERTIES
    @Binding var isPresented: Bool
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 12) {
            
            Text(AppStrings.LogoutTitle)
                .foregroundColor(.primary)
                .font(.system(size: 24))
                .bold()
                .padding(.top, 12)
            
            Text(AppStrings.LogoutSubTitle)
                .foregroundColor(.primary)
                .font(.system(size: 16))
                .opacity(0.6)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            
            HStack() {
                
                Button {
                    isPresented = false
                    isOnboarding = true
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(AppStrings.LogoutYes)
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .padding(.horizontal, 24)
                        .foregroundColor(.white)
                        .background(Color("LogoutPopUpBtnClr"))
                        .cornerRadius(7)
                }.buttonStyle(.plain)
                
                Spacer()
                
                Button {
                    isPresented = false
                } label: {
                    Text(AppStrings.LogoutNo)
                        .font(.system(size: 18, weight: .bold))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 18)
                        .padding(.horizontal, 24)
                        .foregroundColor(.white)
                        .background(Color("LogoutPopUpBtnClr"))
                        .cornerRadius(7)
                }.buttonStyle(.plain)
                
            }
            
        }
        .padding(EdgeInsets(top: 37, leading: 24, bottom: 40, trailing: 24))
        .background(Color("viewBG").cornerRadius(20))
        .shadowedStyle()
        .padding(.horizontal, 40)
    }
}
//MARK: - PREVIEW
struct LogoutPopUp_Previews: PreviewProvider {
    static var previews: some View {
        LogoutPopUp(isPresented: .constant(true))
    }
}
