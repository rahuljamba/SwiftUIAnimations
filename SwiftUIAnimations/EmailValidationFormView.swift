//
//  EmailValidationFormView.swift
//  SwiftUIAnimations
//
//  Created by Rahul Jamba on 19/02/24.
//

import SwiftUI

struct EmailValidationFormView: View {
    
    @State private var isSelected:Bool = false
    @State var enterEmailText = String()
    
    var body: some View {
        ZStack{
         
            Color("BG").ignoresSafeArea()
            
            Text(enterEmailText)
                .foregroundColor(.black)
                .padding(.top, 100)
                .padding()
            
            HStack{
                
                
                TextField("", text: $enterEmailText, prompt: Text("Enter valid email").foregroundColor(.white))
                    .padding()
                    .foregroundColor(.white)
                    .onChange(of: enterEmailText) { newValue in
                        isSelected = newValue.isValidEmail()
                    }
                
                Image(systemName: "arrowshape.turn.up.right.fill")
                    .foregroundColor(.white)
                    .offset(x: isSelected ? -20 : 20)
                    .animation(.easeIn, value: isSelected)
                
            }
            .frame(height: 50)
            .background(Color("Text"))
            .cornerRadius(10)
            .padding()
            
        }
    }
}

#Preview {
    EmailValidationFormView()
}

