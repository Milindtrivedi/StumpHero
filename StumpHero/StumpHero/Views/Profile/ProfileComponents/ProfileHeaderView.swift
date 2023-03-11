//
//  ProfileHeaderView.swift
//  StumpHero
//
//  Created by Milind Trivedi on 10/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

struct ProfileHeaderView: View {
    
    //MARK: - PROPERTIES
    var imageName : String
    var personName : String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 100,height: 100)
                    .foregroundColor(.primary)
                
                Text(personName)
                    .font(.title)
                    .bold()
                    .foregroundColor(.primary)
            }
            
        }
    }
}

//MARK: - PREVIEW
struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(imageName: "personplaceholder", personName: "John Doe")
    }
}


