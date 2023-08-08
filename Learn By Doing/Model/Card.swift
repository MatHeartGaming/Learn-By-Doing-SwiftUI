//
//  Card.swift
//  Learn By Doing
//
//  Created by Matteo Buompastore on 08/08/23.
//

import SwiftUI

struct Card : Identifiable {
    
    let id : UUID = UUID()
    var title : String
    var headline : String
    var imageName : String
    var callToAction : String
    var message : String
    var gradientColors : [Color]
    
}
