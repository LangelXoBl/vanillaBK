//
//  structureReutilizables.swift
//  vanillaBK
//
//  Created by IMAC 04 on 13/07/23.
//

import Foundation
import SwiftUI


struct ButtonGeneric: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .frame(width: 320, height: 50)
            .foregroundColor(.black)
            .background(
                configuration.isPressed ? Color(red: 0.5098039215686274, green: 0.5803921568627451, blue: 0.7686274509803922 , opacity: 1.0) : Color(red: 0.5098039215686274, green: 0.5803921568627451, blue: 0.7686274509803922)
            ).cornerRadius(14)
    }
}

