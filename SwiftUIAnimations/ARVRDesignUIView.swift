//
//  ARVRDesignUIView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 15/02/24.
//

import SwiftUI

struct ARVRDesignUIView: View {
    
    @State private var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            
            Color.smoke.ignoresSafeArea()
            
            Text("Sell")
                .font(isSelected ? .title : .callout).bold()
                .foregroundColor(.white)
                .frame(width:  isSelected ? 150 : 100, height:  isSelected ? 60 : 50)
                .background(.red)
                .position(x: isSelected ? 220 : 250, y: 400)
                .blur(radius: isSelected ? 0 : 3)
                .rotation3DEffect(.degrees(isSelected ? -25 : 0), axis: (x: 0, y: 1, z: 0))
                .zIndex( isSelected ? 1 : 0)
                .onTapGesture {
                    withAnimation(.interpolatingSpring(stiffness: 170, damping: 8)) {
                        isSelected = true
                    }
                }
            
            Text("Rent")
                .font(!isSelected ? .title : .callout).bold()
                .foregroundColor(.white)
                .frame(width: !isSelected ? 150 : 100, height: !isSelected ? 60 : 50)
                .background(.red)
                .position(x: !isSelected ? 140 : 120, y: 400)
                .blur(radius: !isSelected ? 0 : 3)
                .rotation3DEffect(.degrees(!isSelected ? 25 :0), axis: (x: 0, y: 1, z: 0))
                .zIndex(!isSelected ? 1 : 0)
                .onTapGesture {
                    withAnimation(.interpolatingSpring(stiffness: 170, damping: 8)) {
                        isSelected = false
                    }
                }
            
        }
    }
}

#Preview {
    ARVRDesignUIView()
}
