//
//  LineaSubte.swift
//  Subte.io
//
//  Created by Hernan Matias Coppola on 14/6/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import Foundation
import UIColor_Hex_Swift

class SubwayLine {
    
    let lineName: String
    let lineStatus: String
    let lineFrequency: String
    let lineColor: UIColor
    
    init(name: String, status: String, frequency: String, color: UIColor) {
        self.lineName = name
        self.lineStatus = status
        self.lineFrequency = frequency
        self.lineColor = color
    }
    
    

}