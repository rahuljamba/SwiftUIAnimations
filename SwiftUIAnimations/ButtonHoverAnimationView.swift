//
//  ButtonHoverAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 10/02/24.
//

import SwiftUI

struct ButtonHoverAnimationView: View {
    
    @State private var introTextOpacity = 0.0

    
    var body: some View {
        ZStack {
            Button("Submit") {

            }.buttonStyle(CutomeButtinModifier())
        }
    }
}

struct CutomeButtinModifier: ButtonStyle {
    
    
    private let halfWidth = UIScreen.main.bounds.width / 2
    private let halfHeight = UIScreen.main.bounds.height / 2
    private let buttonSize = CGSize(width: 200, height: 80)
    private let spacing: (tenSpace: CGFloat, twentySpace: CGFloat) = (10, 20)
    
    func makeBody(configuration: Configuration) -> some View {
        
        let postionFirstX = configuration.isPressed ? halfWidth + spacing.tenSpace : halfWidth
        let postionFirstY = configuration.isPressed ? halfHeight - spacing.tenSpace : halfHeight
        
        
        ZStack {
            
            let positionFirst = CGPoint(x: postionFirstX, y: postionFirstY)
            
            addCutomeButtonView(isPressed: configuration.isPressed, position: positionFirst)
            
            let positionSecond = CGPoint(x: halfWidth + spacing.tenSpace, y: halfHeight - spacing.tenSpace)
            
            
            addCutomeButtonView(isPressed: configuration.isPressed, position: positionSecond)
            
            
            let positionThird = CGPoint(x: configuration.isPressed ?  halfWidth + spacing.tenSpace : halfWidth + spacing.twentySpace , y: configuration.isPressed ? halfHeight - spacing.tenSpace : halfHeight -  spacing.twentySpace)
            
            addCutomeButtonView(fillColor: .white, isPressed: configuration.isPressed, position: positionThird)
                .overlay {
                    
                    Text("Submit")
                        .foregroundColor(configuration.isPressed ? .white : .black)
                        .font(.system(size: 30, weight: .bold))
                        .frame(width: buttonSize.width, height: buttonSize.height)
                        .background(configuration.isPressed ? .black : .clear)
                        .position(x: configuration.isPressed ? halfWidth + spacing.tenSpace : halfWidth + spacing.twentySpace, y: configuration.isPressed ? halfHeight - spacing.tenSpace : halfHeight - spacing.twentySpace)
                        .animation(.easeInOut(duration: 0.4), value: configuration.isPressed)
                    
                }
            
            
            
        }
        
    }
    
    
    @ViewBuilder
    func addCutomeButtonView(fillColor: Color = .clear, isPressed: Bool, position: CGPoint) -> some View {
        
        Rectangle()
            .fill(fillColor)
            .frame(width: buttonSize.width, height: buttonSize.height)
            .border(.black, width: 2)
            .position(x: position.x, y: position.y)
            .animation(.easeInOut(duration: 0.4), value: isPressed)
            
    }
    
}

#Preview {
    ButtonHoverAnimationView()
}
