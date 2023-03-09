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
    
    var body: some View {
        ZStack {
            HStack {
                Button {
                    
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
                
                
            }.padding()
            
        }.background(Color(hex: AppConstants.ViewBackGroundClr))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(backImageName: "arrow.left", rightImageName: "gear", title: "Swap")
    }
}
