//
//  HeaderView.swift
//  StumpHero
//
//  Created by Milind Trivedi on 09/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

struct HeaderView: View {
    
    //MARK: - PROPERTIES
    var backImageName : String
    var rightImageName : String
    var title : String
    var isHideRightImg : Bool
    
    @State private var isShowProfile = false
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    //MARK: - BODY
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    if backImageName.localizedCaseInsensitiveContains("arrow.left"){
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Image(systemName: backImageName)
                        .foregroundColor(.primary)
                        .frame(width: 40.0,height: 40.0)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20.0)
                                .stroke(Color("BorderClr"))
                        }
                }
                Spacer()
                
                Text(title)
                    .foregroundColor(.primary)
                    .font(.title2)
                    
                
                Spacer()
                
               
                    Button {
                        if rightImageName.localizedCaseInsensitiveContains("gear"){
                            self.isShowProfile = true
                        }
                    } label: {
                        Image(systemName: rightImageName)
                            .foregroundColor(.primary)
                            .frame(width: 40.0,height: 40.0)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20.0)
                                    .stroke(Color("BorderClr"))
                            }
                    }
                    .opacity(isHideRightImg ? 0.0 : 1.0)
                
                
                
            }.padding()
            
        }.background(Color("viewBG"))
        
            .navigationDestination(isPresented: $isShowProfile) {
                ProfileView(isShowing: $isShowProfile)
                    .navigationBarBackButtonHidden()
            }
    }
}
//MARK: - PREVIEW

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(backImageName: "arrow.left", rightImageName: "gear", title: "Swap", isHideRightImg: true)
    }
}
