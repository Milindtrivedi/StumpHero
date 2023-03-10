//
//  ProfileView.swift
//  StumpHero
//
//  Created by Apple on 10/03/23.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var isShowing : Bool
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    @State var popups = PopupsState()
    @State var isShowProfileInfo = false
    @State var isShowSettings = false
    @State var isShowPermissions = false
    @State var isShowNotifications = false
    @State var isShowUsers = false
    
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(spacing: 16.0){
                
                
                HStack(spacing: 16.0) {
                    Spacer()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.white)
                    }
                    
                    .frame(height: 50.0)
                }
                .padding(.trailing, 16)
                
                ProfileHeaderView(imageName: "person.circle.fill", personName: AppStrings.UserName)
                    .onTapGesture {
                        isShowProfileInfo = true
                    }
                
                Divider()
                    .frame(height: 3.0)
                    .overlay(Color.white)
               
                Group {
                    HStack {
                        Button {
                            isShowPermissions = true
                        } label: {
                            HStack(spacing: 16.0) {
                                Image(systemName: "person.badge.key")
                                    .foregroundColor(.white)
                                    .frame(width: 12.0, height: 12.0)
                                Text(AppStrings.PermissionTitleTxt)
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.leading,16)
                        // .padding(.top,16)
                        Spacer()
                    }
                    Divider()
                        .overlay {
                            Color.white
                        }
                }
                Group {
                    HStack {
                        Button {
                            isShowUsers = true
                        } label: {
                            HStack(spacing: 16.0) {
                                Image(systemName: "person.2")
                                    .frame(width: 12.0, height: 12.0)
                                    .foregroundColor(.white)
                                Text(AppStrings.UsersTitleTxt)
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(.leading,16)
                        // .padding(.top,16)
                        Spacer()
                    }
                    Divider()
                        .overlay {
                            Color.white
                        }
                    
                
                
            }
                
                HStack {
                    Button {
                        popups.showingMiddle = true
                    } label: {
                        Text(AppStrings.SignOutTitleTxt)
                            .font(.system(size: 16.0, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                    }
                    .background(Color(hex: AppConstants.CapsuleBackGroundClr))
                    .clipShape(Capsule())
                    
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 16)
                
                Spacer()
                
                
            }
            .background(
                Color.init(hex: AppConstants.ViewBackGroundClr)
            )
        }
        .popup(isPresented: $popups.showingMiddle, type: .`default`, closeOnTap: false, backgroundColor: .black.opacity(0.4)) {
            LogoutPopUp(isPresented: $popups.showingMiddle)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isShowing: .constant(true))
    }
}
