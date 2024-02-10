//
//  OlegView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 10/02/24.
//

import SwiftUI

struct OlegView : View {
    
    @State var selectedIndex: Int = 0
    @Namespace var firstAnimation
    @Namespace var secondAnimation
    @Namespace var thirdAnimation
    @State var listArray:[HorizontalAlignment] = [.leading, .center, .trailing]
    
    var body: some View {
        
        VStack {
                Spacer()
    
                Text("Code \n Psychiatrist")
                    .font(.largeTitle).bold()
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
    
                Spacer()
            
            HStack(spacing: 100) {
                
                ForEach(0...2, id: \.self) { index in
                    VStack(alignment: listArray[index]) {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.5))
                            .frame(width: 50, height: 6)
                            .background(Color.white)
                            .matchedGeometryEffect(id: index, in: firstAnimation, properties: .frame ,isSource: true)
                        
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.5))
                            .frame(width: 40, height: 6)
                            .background(Color.white)
                            .matchedGeometryEffect(id: index, in: secondAnimation, properties: .frame ,isSource: true)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.gray.opacity(0.5))
                            .frame(width: 30, height: 6)
                            .background(Color.white)
                            .matchedGeometryEffect(id: index, in: thirdAnimation, properties: .frame ,isSource: true)
                    }
                    .padding(.horizontal, -10)
                    .onTapGesture {
                        withAnimation {
                            selectedIndex = index
                        }
                    }
                    
                }
            }
           .frame(maxWidth: .infinity)
           .frame(height: 80)
           .background(Color.white)
           .cornerRadius(10)
           .shadow(color: .gray.opacity(0.5), radius: 10)
           .padding()
           .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .matchedGeometryEffect(id: selectedIndex, in: firstAnimation, properties: .frame, isSource: false)
                    .frame(width: 30, height: 30)
                    .animation(.linear(duration: 0.6), value: selectedIndex)

                RoundedRectangle(cornerRadius: 10)
                    .matchedGeometryEffect(id: selectedIndex, in: secondAnimation, properties: .frame, isSource: false)
                    .frame(width: 30, height: 30)
                    .animation(.linear(duration: 0.6).delay(0.1), value: selectedIndex)

                RoundedRectangle(cornerRadius: 10)
                    .matchedGeometryEffect(id: selectedIndex , in: thirdAnimation, properties: .frame, isSource: false)
                    .frame(width: 30, height: 30)
                    .animation(.linear(duration: 0.6).delay(0.2), value: selectedIndex )
            }
        }
        .background(Color.smoke)
        
    }
    
}

#Preview {
    OlegView()
}
