//
//  CiResearchAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 10/02/24.
//

import SwiftUI

struct CiResearchAnimationView: View {
    
    @State private var scalSize: CGFloat = .zero
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(Color("OnBG").gradient)
                .ignoresSafeArea()
            
            Text("Searching for Cel-Fi devices...")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.top, -350)
            
            ForEach(1..<1000) { index in
                
                addCirleView(delayValue: CGFloat(Double(index) + 0.50))
                
            }
            
            Circle()
                .fill(.white)
                .frame(width: 150, height: 150)
                .overlay {
                    Image(systemName: "wifi")
                        .foregroundColor(Color.blue.opacity(0.6))
                        .font(.system(size: 50))
                }
            
        }.onReceive(timer) { _ in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                scalSize = 3
            }
            
        }
    }
    
    @ViewBuilder
    func addCirleView(delayValue: CGFloat) -> some View {
        
        Circle()
            .fill(.white.opacity(scalSize == 3 ? 0.0 : 1.3))
            .frame(width: 150, height: 150)
            .scaleEffect(scalSize)
            .animation(.easeInOut(duration: 5.4).delay(delayValue), value: scalSize)
        
    }
    
}

#Preview {
    CiResearchAnimationView()
}
