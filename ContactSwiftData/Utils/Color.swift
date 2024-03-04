//
//  Color.swift
//  ContactSwiftData
//
//  Created by LAANAYA Abderrazak on 4/3/2024.
//

import SwiftUI

extension Color {
    
    static var randomColor: Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
}
