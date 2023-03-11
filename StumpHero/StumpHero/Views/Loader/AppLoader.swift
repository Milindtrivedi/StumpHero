//
//  AppLoader.swift
//  StumpHero
//
//  Created by Milind Trivedi on 09/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved

import SwiftUI

struct AppLoader: View {
    
    //MARK: - PROPERTIES
    
    @State private var drawingStroke = false
    let customloadingclr = Color(#colorLiteral(red: 0.9725490196, green: 0.6078431373, blue: 0.02745098039, alpha: 1))
    let animation = Animation
        .easeOut(duration: 3)
        .repeatForever(autoreverses: false)
        .delay(0.5)
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            ring(for: customloadingclr)
                .frame(width: UIScreen.screenWidth * 0.4)
        }
        .animation(animation, value: drawingStroke)
        .onAppear {
            drawingStroke.toggle()
        }
        .ignoresSafeArea()
    }
    
    func ring(for color: Color) -> some View {
        // Background ring
        Circle()
            .stroke(style: StrokeStyle(lineWidth: 16))
            .foregroundStyle(.tertiary)
            .overlay {
                // Foreground ring
                Circle()
                    .trim(from: 0, to: drawingStroke ? 1 : 0)
                    .stroke(color.gradient,
                            style: StrokeStyle(lineWidth: 16, lineCap: .round))
            }
            .rotationEffect(.degrees(-90))
    }
}

//MARK: - PREVIEW
struct AppLoader_Previews: PreviewProvider {
    static var previews: some View {
        AppLoader()
    }
}
