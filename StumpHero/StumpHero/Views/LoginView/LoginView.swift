//
//  LoginView.swift
//  StumpHero
//
//  Created by Apple on 09/03/23.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: - PROPERTIES
    
    @ObservedObject var viewModel = LoginViewModel()
    @AppStorage("isOnboarding") var isOnboarding : Bool = true
    private var borderColour = Color(hex: AppConstants.LoginBorderClr)
    @State private var isSecured: Bool = true
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    VStack(alignment: .center, spacing: 16.0) {
                        TextField("", text: $viewModel.username)
                            .placeholder(when: viewModel.username.isEmpty) {
                                Text(AppStrings.Username).foregroundColor(Color(hex: AppConstants.LoginPlaceHolderClr))
                                    .font(.system(size: 18, weight: .bold, design: .default))
                                
                            }
                            .keyboardType(.namePhonePad)
                            .frame(height: 55)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 16)
                            .cornerRadius(7)
                            .overlay(RoundedRectangle(cornerRadius: 7).stroke(viewModel.isOk ? borderColour : .red))
                            .toolbar {
                                ToolbarItemGroup(placement: .keyboard) {
                                    Spacer()
                                    Button(AppStrings.ToolBarButtonTitle) {
                                        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                            let keyWindow = windowScene.windows.filter { $0.isKeyWindow }.first
                                            keyWindow?.endEditing(true)
                                        }
                                    }.padding(.trailing, 16)
                                }
                            }
                        
                        ZStack(alignment: .trailing) {
                            Group {
                                if isSecured {
                                    SecureField("", text: $viewModel.password)
                                        .placeholder(when: viewModel.password.isEmpty) {
                                            Text(AppStrings.Password).foregroundColor(Color(hex: AppConstants.LoginPlaceHolderClr))
                                                .font(.system(size: 18, weight: .bold, design: .default))
                                        }
                                    
                                        .frame(height: 55)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .padding([.leading], 16)
                                        .padding([.trailing], 50)
                                        .cornerRadius(7)
                                        .overlay(RoundedRectangle(cornerRadius: 7).stroke(borderColour))
                                } else {
                                    TextField("", text: $viewModel.password)
                                        .placeholder(when: viewModel.password.isEmpty) {
                                            Text(AppStrings.Password).foregroundColor(Color(hex: AppConstants.LoginPlaceHolderClr))
                                                .font(.system(size: 18, weight: .bold, design: .default))
                                        }
                                    
                                        .frame(height: 55)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        .padding([.leading], 16)
                                        .padding([.trailing], 50)
                                        .cornerRadius(7)
                                        .overlay(RoundedRectangle(cornerRadius: 7).stroke(borderColour))
                                }
                            }
                            
                            Button(action: {
                                isSecured.toggle()
                            }) {
                                Image(systemName: self.isSecured ? "eye.slash.fill" : "eye.fill")
                                    .accentColor(.gray)
                            }.padding(.trailing, 16)
                        }
                        
                        Button {
                            viewModel.login()
                        } label: {
                            Text("Sign In")
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(
                                    RoundedRectangle(cornerRadius: 7)
                                        .fill(Color(hex: AppConstants.LogoutPopUpBtnClr))
                                    //.shadow(color: .white, radius: 2, x: 0, y: 2)
                                )
                        }
                        .navigationDestination(isPresented: $viewModel.loggedIn) {
                            Dashboard()
                        }
                    }.padding([.horizontal], 24)
                        .position(x: geo.size.width / 2, y: geo.size.height / 2)
                    
                }
                .navigationBarTitle(AppStrings.loginTitle)
                .navigationBarHidden(false)
                
                .background(
                    Color(hex: AppConstants.ViewBackGroundClr)
                )
            }
        }
        
        .alert(isPresented: $viewModel.showErrorPopup) {
            Alert(title: Text(viewModel.error),
                  message: nil,
                  dismissButton: .default(Text(AppStrings.ok)){
                viewModel.showErrorPopup = false
                viewModel.error = ""
            }
            )
        }
        
        .overlay {
            if viewModel.isLoading {
                ZStack {
                    Color(white: 0, opacity: 0.55)
                    AppLoader()
                }.ignoresSafeArea(.all)
                    .onTapGesture {
                        viewModel.isLoading = false
                    }
            }
        }
    }
}

//MARK: - PREVIEW
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
