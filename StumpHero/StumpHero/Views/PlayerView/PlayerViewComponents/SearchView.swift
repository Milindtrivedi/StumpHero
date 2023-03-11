//
//  SearchView.swift
//  StumpHero
//
//  Created by Milind Trivedi on 10/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

struct SearchView: View {
    
    //MARK: - PROPERTIES
    @Binding var text: String
    
    //MARK: - BODY
    var body: some View {
                ZStack {
                    HStack {
                    TextField(AppStrings.SearchPlaceHolder, text: $text)
                        .padding(.horizontal, 25)
                        .frame(height: 50.0)
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button(AppStrings.ToolBarButtonTitle) {
                                    dissmissKeyBoard()
                                }
                            }
                        }
                    
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(Color(.systemGray3))
                            
                    }
                    .padding(.trailing, 20)
                }
            }
            .background(Color(.systemGray5))
            .cornerRadius(8)
            .padding(.horizontal)
        }
}
//MARK: - PREVIEW
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant("wer"))
    }
}
