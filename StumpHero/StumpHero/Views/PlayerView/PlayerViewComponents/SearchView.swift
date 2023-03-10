//
//  SearchView.swift
//  StumpHero
//
//  Created by Apple on 10/03/23.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var text: String
    
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
                                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                        let keyWindow = windowScene.windows.filter { $0.isKeyWindow }.first
                                        keyWindow?.endEditing(true)
                                    }
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant("wer"))
    }
}
