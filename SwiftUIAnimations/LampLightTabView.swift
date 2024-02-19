//
//  LampLightTabView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 19/02/24.
//

import SwiftUI

struct LampLightTabView: View {
    
    @State private var xPositionView: CGFloat = .zero
    @State private var textValue:String = ""
    
    let systemImages = ["pencil.circle.fill", "pencil.tip", "trash.fill", "books.vertical", "globe.asia.australia.fill"]
    
    
    var body: some View {
        VStack{
            
            Spacer()
                .frame(height: 300)
            
            Image(systemName: textValue)
                .foregroundStyle(.white)
                .font(.system(size: 100))
            
            Spacer()
            
            HStack(spacing: 10){
                ForEach(systemImages, id: \.self) { imageName in
                    GeometryReader { reader in
                        
                        Image(systemName: imageName)
//                            .resizable()
                            .font(.system(size: 25))
                            //.font(.caption)
                            .foregroundColor(textValue == imageName ? .white : .black)
                            .onTapGesture {
                                withAnimation {
                                    textValue = imageName
                                    xPositionView = reader.frame(in: .global).midX - 2.5
                                }
                            }
                            .onAppear {
                                textValue = imageName
                                xPositionView = reader.frame(in: .global).midX - 2.5
                            }
                        
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 18)
                    
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color.secondary)
            .cornerRadius(10)
            .padding()
            .overlay {
                VStack(spacing:2){
                    Rectangle()
                        .fill(.white)
                        .frame(width: 50, height: 5)
                        
                    Rectangle()
                        .frame(width: 50, height: 40)
                        .foregroundStyle(LinearGradient(colors: [.white,.white.opacity(0.8),.white.opacity(0.7),.white.opacity(0.7),.white.opacity(0.6),.white.opacity(0.5),.white.opacity(0.45),.white.opacity(0.4),.white.opacity(0.3),.white.opacity(0.2)], startPoint: .top, endPoint: .bottom))
                        .clipShape(ParllShape())
                    
                }
                .position(x: xPositionView, y: 45)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.secondary.opacity(0.5))
    }
}

#Preview {
    LampLightTabView()
}

struct ParllShape: Shape {
    func path(in rect: CGRect) -> Path {
 
        var path = Path()
        
        path.move(to: CGPoint(x: rect.width * 0.15, y: 0))
        
        path.addLine(to: CGPoint(x: rect.width * 0.85, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        return path
        
    }
}
