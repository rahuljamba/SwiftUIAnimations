//
//  MotionDesignView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 29/01/24.
//

import SwiftUI

struct MotionDesignView: View {
    
    let size = UIScreen.main.bounds
    @State var whiteSize: CGFloat = UIScreen.main.bounds.width / 2
    @State var blackSize: CGFloat = 0
    
    @Namespace var animation
    
    var body: some View {
        HStack(spacing: 0) {
            
            Rectangle()
                .fill(Color.smoke)
                .overlay {
                    Circle()
                        .fill(.black)
                        .frame(width: whiteSize, height: whiteSize)
                        .position(x: size.width / 2 - whiteSize / 2, y: size.midY)
                        .animation(.easeOut(duration: 1.4).repeatForever(), value: whiteSize)
                    
                }
            
            Rectangle()
                .fill(.black)
                .overlay {
                    Circle()
                        .fill(Color.smoke)
                        .frame(width: blackSize, height: blackSize)
                        .position(x: size.minX + blackSize / 2, y: size.midY)
                        .animation(.easeOut(duration: 1.4).repeatForever(), value: blackSize)
                }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .onAppear {
            withAnimation {
                whiteSize = 1
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(80)) {
                    blackSize = UIScreen.main.bounds.width / 2
                }
            }
        }
    }
}

#Preview {
    MotionDesignView()
}
