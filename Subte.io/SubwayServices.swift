//
//  SubwayServices.swift
//  Subte.io
//
//  Created by Mariano Molina on 27/9/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIColor_Hex_Swift

struct SubwayServices {
    
    let endPointUrl = "http://www.metrovias.com.ar/Subterraneos/Estado?site=Metrovias"
    
    /**
     Fetch data from API.

     - Parameter callback: return `SubwayLine` collection.
     */
    func fetch(callback: @escaping ([SubwayLine]?) -> ()) {
        
        Alamofire.request(endPointUrl).validate().responseJSON { response in
            
            switch response.result {
                case .success:
                    print("Validation Successful 😎")
                
                    if let jsonData = response.result.value {
                        let json = JSON(jsonData)
                        DispatchQueue.main.async {
                            callback(self.jsonParser(json: json))
                        }
                    }
                
                case .failure(let error):
                    print("Error 😰: \(error)")
                    
                    DispatchQueue.main.async {
                        callback(nil)
                    }
                
            }
        
        }
    }
    
    
    /**
     Calculate Line Frequency.
     
     - Parameter strFrequency: `String`.
     
     - Returns: `String` frequency.
     */
    func calculateFrequency(strFrequency: String) -> String {
        var frequency = "--"
        
        if let df = Double(strFrequency) {
            if df != 0.0 {
                let rdf = (round((df / 60.0)*1000) / 1000)
                frequency = "\(rdf)"
            }
        }
        
        return "\(frequency)"
    }
    
    
    /**
     Parse JSON data.
     
     - Parameter json: `json` object from network.
     
     - Returns: `SubwayLine` objects collection.
     */
    private func jsonParser(json: JSON) -> [SubwayLine] {
        var listadoLineas = [SubwayLine]()
        
        for (_, subJson):(String, JSON) in json {
            
            let lineName = subJson["LineName"].stringValue
            let lineStatus = subJson["LineStatus"].stringValue
            let lineFrequency = calculateFrequency(strFrequency: subJson["LineFrequency"].stringValue)
            let lineColor = getLineColor(lineName: subJson["LineName"].stringValue)
            
            //Cargo el punto
            let lineaSubte = SubwayLine(name: lineName, status: lineStatus,frequency: lineFrequency, color: lineColor)
            
            listadoLineas.append(lineaSubte)
        }
        
        return listadoLineas
    }
    
    
    /**
     Set Color for Line.
     
     - Parameter lineName: `String`.
     
     - Returns: `UIColor` line color.
     */
    private func getLineColor(lineName: String) -> UIColor {
        var color: UIColor?
        
        switch lineName {
        case "A":
            color = UIColor("#05ADDE")
            break
        case "B":
            color = UIColor("#E81526")
            break
        case "C":
            color = UIColor("#046AB4")
            break
        case "D":
            color = UIColor("#087F69")
            break
        case "E":
            color = UIColor("#6D2281")
            break
        case "H":
            color = UIColor("#FDC903")
            break
        case "P":
            color = UIColor("#FDBA2D")
            break
            
        default:
            color = UIColor("#F56D1C")
            break
        }
        
        return color!
    }
    
    
}
