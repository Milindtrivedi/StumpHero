//
//  ProfileHeaderView.swift
//  StumpHero
//
//  Created by Apple on 10/03/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var imageName : String
    var personName : String
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 100,height: 100)
                    .foregroundColor(.black)
                
                Text(personName)
                    .font(.system(size: 20.0))
                    .bold()
                    .foregroundColor(.black)
            }
            .padding(.leading, 16)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(imageName: "personplaceholder", personName: "John Doe")
    }
}


