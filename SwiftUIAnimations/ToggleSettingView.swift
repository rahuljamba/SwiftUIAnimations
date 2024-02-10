//
//  ToggleSettingView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 10/02/24.
//

import SwiftUI

struct ToggleSettingView: View {
    
    @State private var isSwitch: Bool = false
    
    var body: some View {
        VStack {
            
            GeometryReader { reader in
                
                
                Capsule()
                    .fill( isSwitch ? Color("OnBG") : Color("OffBG"))
                    .frame(width: 150, height: 70)
                    .position(x: reader.size.width / 2, y: reader.size.height / 2)
                    .overlay {
                        Circle()
                            .fill(isSwitch ? .white : Color("Off"))
                            .frame(width: 50, height: 50)
                            .offset(x: isSwitch ? 35 : reader.frame(in: .global).minX - 35, y: 0)
                            .shadow(color: isSwitch ? .white : .clear, radius: 10)
                            .shadow(color: isSwitch ? .white : .clear, radius: 20)
                            .shadow(color: isSwitch ? .white : .clear, radius: 20)
                    }
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.4)) {
                            isSwitch.toggle()
                        }
                    }
                
                
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue.gradient)
        .ignoresSafeArea()
    }
}

#Preview {
    ToggleSettingView()
}
