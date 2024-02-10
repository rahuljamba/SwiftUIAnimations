//
//  MoonAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 10/02/24.
//

import SwiftUI

struct MoonAnimationView: View {
    
    @State private var progress:CGFloat = .zero
    
    var body: some View {
        ZStack {
            
            MoonBackGroundView()
            
            GeometryReader { geo in
                
                let localFrame = geo.frame(in: .local)
                let diameter = geo.size.width
                let radius = diameter / 2
                let angle = progress * .pi
                
                Circle()
                    .stroke(Color.gray.opacity(0.4),lineWidth: 5)
                    .rotationEffect(.degrees(-180))
                    .frame(width: diameter)
                    .position(x: localFrame.midX, y: localFrame.midY)
                    .overlay {
                        
                        Circle()
                            .stroke(Color.white,lineWidth: 5)
                            .frame(width: 50)
                            .position(x: radius * (1 - cos(angle)), y: geo.size.height / 2 - radius * sin(angle))
                    }
                
                
                
                
            }
            .frame(width: 420)
            
            Circle()
                .fill(.gray.opacity(0.4))
                .frame(width: 310)
            
            Circle()
                .fill(.gray.opacity(0.5))
                .frame(width: 280)
            
            GeometryReader { reader in
                
                let localFrame = reader.frame(in: .local)
                
                Circle()
                    .fill(.white.gradient)
                    .position(x: localFrame.midX, y: localFrame.midY)
                    .overlay {
                        
                        ZStack {
                            
                            Circle()
                                .fill(.gray.opacity(0.2))
                                .frame(width: 60)
                                .position(x: localFrame.midX - 60, y: localFrame.midY - 60)
                            
                            
                            Circle()
                                .fill(.gray.opacity(0.2))
                                .frame(width: 40)
                                .position(x: localFrame.midX - 90, y: localFrame.midY + 20)
                            
                            
                            Circle()
                                .fill(.gray.opacity(0.2))
                                .frame(width:  25)
                                .position(x: localFrame.midX - 40, y: localFrame.midY - 20)
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    }
                
            }
            .frame(width: 250)
            
            Text("M")
                .foregroundColor(.white)
                .font(.system(size: 140)).bold()
                .position(x: 100, y: UIScreen.main.bounds.height / 2)
            
            Text("N")
                .foregroundColor(.white)
                .font(.system(size: 140)).bold()
                .position(x: UIScreen.main.bounds.width - 100, y: UIScreen.main.bounds.height / 2)
            
            
        }
        .onAppear {
            
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                withAnimation {
                    progress += 0.04
                }
            }
            
        }
        
        
        
    }
}

struct MoonBackGroundView : View {
    
    var body: some View {
        
        ZStack {
            
            Color("Moon").ignoresSafeArea()
            
            ForEach(1..<150, id: \.self) { index in
                
                let xPosition = Array(1...Int(UIScreen.main.bounds.width)).randomElement() ?? 0
                let yPosition = Array(1...Int(UIScreen.main.bounds.height)).randomElement() ?? 0
                
                
                Circle()
                    .fill(xPosition % 2 == 0 ? .white : .gray)
                    .frame(width: xPosition % 2 == 0 ? 5 : 3)
                    .position(x: CGFloat(xPosition), y: CGFloat(yPosition))
                
            }
        }
        
    }
    
}

#Preview {
    MoonAnimationView()
}
