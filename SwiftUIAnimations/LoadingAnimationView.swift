//
//  LoadingAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 10/02/24.
//

import SwiftUI

struct LoadingAnimationView: View {
    
    @State private var changeScale: Bool = false
    
    // Make circle responsive for any screen size
    
    let size = UIScreen.main.bounds.width * 0.2
    
    var body: some View {
        VStack {
            
            HStack(spacing: 30) {
                
                addCircleView(dealyTime: 0.2, endScale: 0.2)
                addCircleView(dealyTime: 0.3, endScale: 0.5)
                addCircleView(dealyTime: 0.7, endScale: 0.2)
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.smoke)
        .onAppear {
            withAnimation {
                changeScale.toggle()
            }
        }
    }
    
    @ViewBuilder
    func addCircleView(dealyTime: CGFloat, endScale: CGFloat) -> some View {
        ZStack {
            
            Circle()
                .fill(.red)
                .frame(width: size, height: size)
                .overlay {
                    Circle()
                        .fill(Color.smoke)
                        .scaleEffect(changeScale ? 0.8 : endScale)
                        .animation(.easeInOut(duration: 0.7).repeatForever().delay(dealyTime), value: changeScale)
                }
            
        }
    }
    
}

#Preview {
    LoadingAnimationView()
}
