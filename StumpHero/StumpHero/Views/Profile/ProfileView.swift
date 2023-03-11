//
//  ProfileView.swift
//  StumpHero
//
//  Created by Milind Trivedi on 10/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

struct ProfileView: View {
    //MARK: - PROPERTIES
    @Binding var isShowing : Bool
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    @State var popups = PopupsState()
    @State var isShowProfileInfo = false
    @State var isShowSettings = false
    @State var isShowPermissions = false
    @State var isShowNotifications = false
    @State var isShowUsers = false
    
    //MARK: - BODY
    var body: some View {
        ZStack(alignment: .top) {
            
            VStack(spacing: 16.0){
                
                
                HStack(spacing: 16.0) {
                    Spacer()
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.primary)
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
                    .overlay(Color("Divider"))
               
                Group {
                    HStack {
                        Button {
                            isShowPermissions = true
                        } label: {
                            HStack(spacing: 16.0) {
                                Image(systemName: "person.badge.key")
                                    .foregroundColor(.primary)
                                    .frame(width: 12.0, height: 12.0)
                                Text(AppStrings.PermissionTitleTxt)
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(.primary)
                            }
                        }
                        .padding(.leading,16)
                        // .padding(.top,16)
                        Spacer()
                    }
                    Divider()
                        .overlay(Color("Divider"))
                }
                Group {
                    HStack {
                        Button {
                            isShowUsers = true
                        } label: {
                            HStack(spacing: 16.0) {
                                Image(systemName: "person.2")
                                    .frame(width: 12.0, height: 12.0)
                                    .foregroundColor(.primary)
                                Text(AppStrings.UsersTitleTxt)
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(.primary)
                            }
                        }
                        .padding(.leading,16)
                        // .padding(.top,16)
                        Spacer()
                    }
                    Divider()
                        .overlay(Color("Divider"))
                    
                
                
            }
                
                HStack {
                    Button {
                        popups.showingMiddle = true
                    } label: {
                        Text(AppStrings.SignOutTitleTxt)
                            .font(.system(size: 16.0, weight: .medium))
                            .foregroundColor(.primary)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                    }
                    .background(Color("CapsuleBackGroundClr"))
                    .clipShape(Capsule())
                    
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 16)
                
                Spacer()
                
                
            }
            .background(
                Color("viewBG")
            )
        }
        .popup(isPresented: $popups.showingMiddle, type: .`default`, closeOnTap: false, backgroundColor: .black.opacity(0.4)) {
            LogoutPopUp(isPresented: $popups.showingMiddle)
        }
    }
}
//MARK: - PREVIEW
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isShowing: .constant(true))
    }
}
