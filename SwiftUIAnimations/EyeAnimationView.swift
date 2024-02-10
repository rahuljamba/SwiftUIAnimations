//
//  EyeAnimationView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 10/02/24.
//

import SwiftUI

struct EyeAnimationView: View {
    
    @State private var xPosition:CGFloat = 0
    @State private var yPosition:CGFloat = 12
    
    @State var changePosition = 0
   
    let timer = Timer.publish(every: 0.4, on: .main, in: .common).autoconnect()
     
    
    var body: some View {
        ZStack{
            Color.pink.opacity(0.5).ignoresSafeArea()
            
            Circle()
                .foregroundColor(.yellow)
                .frame(width: 250, height: 250)
                .overlay {
                    HStack(spacing: 25){
                        
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(
                                Circle()
                                    .foregroundColor(.white.opacity(0.4))
                                    .frame(width: 50, height: 50)
                                    .offset(x: 8)
                            )
                            .overlay {
                                Circle()
                                    .foregroundColor(.black)
                                    .frame(width: 20, height: 20)
                                    .offset(x: xPosition, y: yPosition)
                            }
                        
                        
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(
                                Circle()
                                    .foregroundColor(.white.opacity(0.4))
                                    .frame(width: 50, height: 50)
                                    .offset(x: 8)
                            )
                            .overlay {
                                Circle()
                                    .foregroundColor(.black)
                                    .frame(width: 20, height: 20)
                                    .offset(x: xPosition, y: yPosition)
                            }
                        
                    }
                    
                    HStack{
                        Circle()
                            .foregroundColor(.red.opacity(0.5))
                            .frame(width: 20, height: 20)
                            .blur(radius: 9)
                            .padding(.leading ,70)
                        
                        Spacer()
                        
                        Circle()
                            .foregroundColor(.red.opacity(0.5))
                            .frame(width: 20, height: 20)
                            .blur(radius: 9)
                            .padding(.trailing ,70)
                    }
                    .padding(.top, 110)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black)
                        .frame(width: 50, height: 8)
                        .padding(.top, 180)
                    
                }
        }.onReceive(timer) { _ in
            withAnimation(.easeOut(duration: 0.5)) {
                if changePosition == 0 {
                    xPosition = -9
                    yPosition = 5
                    self.changePosition = 1
                }else if changePosition == 1 {
                    xPosition = 0
                    yPosition = -5
                    self.changePosition = 2
                }else if changePosition == 2 {
                    xPosition = 10
                    yPosition = 2
                    self.changePosition = 3
                }else
                if changePosition == 3 {
                    xPosition = 0
                    yPosition = 12
                    self.changePosition = 0
                }
            }
        }
    }
}

#Preview {
    EyeAnimationView()
}
