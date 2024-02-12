//
//  DeoxyribonucleicAcidView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 13/02/24.
//

import SwiftUI

struct DeoxyribonucleicAcidView: View {
    
    @State private var degreeValue: CGFloat = UIScreen.main.bounds.width - 100
    
    let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            
            Color.secondary.opacity(0.15).ignoresSafeArea()
            
            
            VStack(spacing: 20) {
                
                ForEach(0..<11, id: \.self) { index in
                    
                    LinesView(degreeValue: degreeValue, delay: CGFloat(index))
                }
            }
            
            
        }
        .onReceive(timer) { _ in
            withAnimation {
                if degreeValue == 10 {
                    degreeValue = UIScreen.main.bounds.width - 100
                }else{
                     degreeValue = 10
                }
            }
        }
    }
}

#Preview {
    DeoxyribonucleicAcidView()
}

struct LinesView: View {
    
    var degreeValue: CGFloat
    var delay: CGFloat
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            Circle()
                .fill(.black.gradient)
                .frame(width: 25, height: 25)
                .shadow(color: .black.opacity(0.3), radius: 7, x: -10, y: 15)
                .shadow(color: .black.opacity(0.2), radius: 16, x: -20, y: 30)
                .shadow(color: .black.opacity(0.2), radius: 18, x: -45, y: 50)
            
            
            Rectangle()
                .fill(Color("Off").gradient)
                .frame(maxWidth: .infinity)
                .frame(height: 3)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: -5)
            
            .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
            
            Circle()
                .fill(.black.gradient)
                .frame(width: 25, height: 25)
                .shadow(color: .black.opacity(0.3), radius: 7, x: -10, y: 15)
                .shadow(color: .black.opacity(0.2), radius: 16, x: -20, y: 30)
                .shadow(color: .black.opacity(0.2), radius: 18, x: -45, y: 50)
            
        }
        .frame(width: degreeValue == 10 ? UIScreen.main.bounds.width - 100 : 10)
        .animation(.interpolatingSpring(stiffness: 1.65, damping: 1.1).delay(delay), value: degreeValue)
        .padding()
    }
}
