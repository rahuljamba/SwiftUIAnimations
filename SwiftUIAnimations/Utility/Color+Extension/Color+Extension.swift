//
//  Color+Extension.swift
//  DemoSwiftUI
//
//  Created by Rahul Jamba on 22/02/23.
//

import Foundation
import SwiftUI

extension Color {
   // static let cream = Color("Cream")
    static let smoke = Color("Somke")
    static let darkPink = Color("Flicker1")
    static let darkVanila = Color("Text")
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}


//extension View {
//    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
//        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
//    }
//}
