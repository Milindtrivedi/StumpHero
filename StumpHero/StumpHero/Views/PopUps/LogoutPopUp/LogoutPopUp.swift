//
//  LogoutPopUp.swift
//  StumpHero
//
//  Created by Apple on 10/03/23.
//

import SwiftUI
struct LogoutPopUp: View {
    
    @Binding var isPresented: Bool
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var body: some View {
        VStack(spacing: 12) {
            
            Text(AppStrings.LogoutTitle)
                .foregroundColor(.white)
                .font(.system(size: 24))
                .bold()
                .padding(.top, 12)
            
            Text(AppStrings.LogoutSubTitle)
                .foregroundColor(.white)
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
                        .background(Color(hex: AppConstants.LogoutPopUpBtnClr))
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
                        .background(Color(hex: AppConstants.LogoutPopUpBtnClr))
                        .cornerRadius(7)
                }.buttonStyle(.plain)
                
            }
            
        }
        .padding(EdgeInsets(top: 37, leading: 24, bottom: 40, trailing: 24))
        .background(Color(hex: AppConstants.PopUpBgClr
                         ).cornerRadius(20))
        .shadowedStyle()
        .padding(.horizontal, 40)
    }
}

struct LogoutPopUp_Previews: PreviewProvider {
    static var previews: some View {
        LogoutPopUp(isPresented: .constant(true))
    }
}
