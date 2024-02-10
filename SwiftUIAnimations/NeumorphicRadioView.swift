//
//  NeumorphicRadioView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 10/02/24.
//

import SwiftUI

struct NeumorphicRadioView: View {
    
    @State private var selectedItem: String = ""
    
    let textArray = ["a) close", "b) remove", "c) delete", "d) all of above"]
    
    var body: some View {
        
        ZStack {
            
            Color.smoke.ignoresSafeArea()
            
            
            RoundedRectangle(cornerRadius: 15)
                .fill(
                    Color.smoke
                        .shadow(.inner(color: .white.opacity(0.7), radius: 5, x: -5, y: -5))
                        .shadow(.inner(color: .gray.opacity(0.7), radius: 5, x: 5, y: 5))
                )
                .frame(width:  300, height: 300)
                .overlay {
                    
                    VStack(spacing: 20) {
                        
                        ForEach(textArray.indices , id: \.self) { index in
                            
                            
                            HStack {
                                
                                Circle()
                                    .fill(Color.smoke)
                                    .frame(width: 35, height: 35)
                                    .shadow(color: .white, radius: 5, x: -5, y: -5)
                                    .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                                    .overlay(content: {
                                        
                                        Group {
                                            
                                            if selectedItem == textArray[index] {
                                                Circle()
                                                    .fill(Color.smoke)
                                                    .frame(width: 28, height: 28)
                                                    .shadow(color: .gray.opacity(0.14), radius: 1, x: -2, y: -2)
                                                    .shadow(color: .white, radius: 1, x: 1, y: 1)
                                                
                                                
                                            }else {
                                                Circle()
                                                    .fill(Color.smoke)
                                                    .frame(width: 28, height: 28)
                                                    .shadow(color: .white, radius: 2, x: -2, y: -2)
                                                    .shadow(color: .gray.opacity(0.5), radius: 2, x: 2, y: 2)
                                                    
                                            }
                                            
                                        }
                                        
                                    })
                                    .onTapGesture {
                                        withAnimation {
                                            selectedItem = textArray[index]
                                        }
                                    }
                                
                                Text(textArray[index])
                                    .foregroundColor(selectedItem == textArray[index] ? Color.black : Color.gray)
                                    .font(selectedItem == textArray[index] ? .system(.title3).bold() : .system(.title3))
                                    .padding(.leading, selectedItem == textArray[index] ? 20 : 10)
                                
                                Spacer()
                                
                            }
                            
                        }
                        
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    
                }
            
        }
        
    }
}

#Preview {
    NeumorphicRadioView()
}
