//
//  LineaSubte.swift
//  Subte.io
//
//  Created by Hernan Matias Coppola on 14/6/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import Foundation

class SubwayLine
{


    var lineName: String
    var lineStatus: String
    var lineFrequency: String
    
    
    init(name: String, status: String, frequency: String)
    {
        self.lineName = name
        self.lineStatus = status
        self.lineFrequency = frequency
    }
    
    

}