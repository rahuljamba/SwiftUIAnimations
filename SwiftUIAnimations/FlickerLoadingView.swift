//
//  FlickerLoadingView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 05/02/24.
//

import SwiftUI

struct FlickerLoadingView: View {
    
    @State private var isSelected = false
    @Namespace private var swipeAnimation
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        VStack{
            Text("flickr")
                .font(.largeTitle).bold()
                .foregroundColor(.secondary)
            
            
            HStack(spacing: 20){
                
                if isSelected {
                    
                    SingleCircle(name: "Flicker1", color: Color("Flicker1"))
                    
                    SingleCircle(name: "Flicker2", color: Color("Flicker2"))
                    
                }else{
                    
                    SingleCircle(name: "Flicker2", color: Color("Flicker2"))
                    
                    SingleCircle(name: "Flicker1", color: Color("Flicker1"))
                }
                
            }
            .animation(.linear(duration: 0.4), value: isSelected)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.3))
        .onReceive(timer) { value in
            
            withAnimation {
                isSelected.toggle()
            }
            
        }
    }
    
    @ViewBuilder
    func SingleCircle(name:String, color: Color) -> some View {
        Circle()
            .foregroundColor(color)
            .frame(width:100, height: 100)
            .matchedGeometryEffect(id: name, in: swipeAnimation)
    }
    
}

#Preview {
    FlickerLoadingView()
}
