//
//  SliderRangeView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 10/02/24.
//

import SwiftUI

struct SliderRangeView: View {
    
    @State private var sliderRangeValue:Float = 0.0
    
    var body: some View {
        VStack(spacing: 30) {
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .frame(width: 200, height: 200)
                .shadow(radius: 10)
                .rotationEffect(Angle(degrees: Double(sliderRangeValue * 10)))
                .overlay {
                    Text("\(Int(sliderRangeValue * 10))")
                        .foregroundColor(.gray)
                        .font(.largeTitle).bold()
                }
            
            Slider(value: $sliderRangeValue, in: 0...10)
                .tint(.white)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.4))
    }
}

#Preview {
    SliderRangeView()
}
