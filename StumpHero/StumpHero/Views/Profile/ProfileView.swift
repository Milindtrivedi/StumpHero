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
                            .foregroundColor(.black)
                    }
                    
                    .frame(height: 50.0)
                }
                .padding(.trailing, 16)
                
                ProfileHeaderView(imageName: "person.circle.fill", personName: "Milind Trivedi")
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
                                    .foregroundColor(.black)
                                    .frame(width: 12.0, height: 12.0)
                                Text("Permissions")
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.leading,16)
                        // .padding(.top,16)
                        Spacer()
                    }
                    Divider()
                }
                Group {
                    HStack {
                        Button {
                            isShowUsers = true
                        } label: {
                            HStack(spacing: 16.0) {
                                Image(systemName: "person.2")
                                    .frame(width: 12.0, height: 12.0)
                                    .foregroundColor(.black)
                                Text("Users")
                                    .font(.system(size: 20, weight: .light))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.leading,16)
                        // .padding(.top,16)
                        Spacer()
                    }
                    Divider()
                    
                
                
            }
                
                HStack {
                    Button {
                        popups.showingMiddle = true
                    } label: {
                        Text("Sign Out")
                            .font(.system(size: 16.0, weight: .medium))
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                    }
                    .background(Color.black)
                    .clipShape(Capsule())
                    
                    Spacer()
                }
                .padding(.leading, 16)
                .padding(.top, 16)
                
                Spacer()
                
                
            }
            .background(
                Color.init(hex: AppConstants.ProfileViewBgClr)
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
