//
//  HeaderView.swift
//  StumpHero
//
//  Created by Milind Trivedi on 09/03/23.
//

import SwiftUI

struct HeaderView: View {
    
    var backImageName : String
    var rightImageName : String
    var title : String
    var isHideRightImg : Bool
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    if backImageName.localizedCaseInsensitiveContains("arrow.left"){
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Image(systemName: backImageName)
                        .foregroundColor(.white)
                        .frame(width: 40.0,height: 40.0)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20.0)
                                .stroke(Color(hex: AppConstants.BorderClr))
                        }
                }
                Spacer()
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.title2)
                    
                
                Spacer()
                
               
                    Button {
                        
                    } label: {
                        Image(systemName: rightImageName)
                            .foregroundColor(.white)
                            .frame(width: 40.0,height: 40.0)
                            .overlay {
                                RoundedRectangle(cornerRadius: 20.0)
                                    .stroke(Color(hex: AppConstants.BorderClr))
                            }
                    }
                    .opacity(isHideRightImg ? 0.0 : 1.0)
                
                
                
            }.padding()
            
        }.background(Color(hex: AppConstants.ViewBackGroundClr))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(backImageName: "arrow.left", rightImageName: "gear", title: "Swap", isHideRightImg: true)
    }
}
