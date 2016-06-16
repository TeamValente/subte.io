//
//  SubwayService.swift
//  Subte.io
//
//  Created by Mariano Molina on 14/6/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIColor_Hex_Swift

class SubwayService {
    // TODO: service methods
    
    let endPointUrl = "http://www.metrovias.com.ar/Subterraneos/Estado?site=Metrovias"
    
    // MARK: funciones privadas
    
    private func generarURLValida(url: String) -> String {
        return url.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
    }
    
    private func jsonParser(json: JSON) -> [SubwayLine] {
        
        var listadoLineas = [SubwayLine]()
        
        for (_, subJson):(String, JSON) in json {
            
            let lineName = "\(subJson["LineName"])"
            let lineStatus = "\(subJson["LineStatus"])"
            let lineFrequency = "\(subJson["LineFrequency"])"
            let lineColor = getLineColor("\(subJson["LineName"])")
            
            //Cargo el punto
            let lineaSubte = SubwayLine(name: lineName, status: lineStatus,frequency: lineFrequency, color: lineColor)
            
            listadoLineas.append(lineaSubte)
            
            
        }
        
        return listadoLineas
    }
    
    // MARK: metodos publicos
    
    func getSubwayLines(callback: [SubwayLine]? -> () ) {
       
        Alamofire.request(.GET, self.generarURLValida(endPointUrl), parameters: nil)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .Success:
                    print("Validation Successful")
                    if let value = response.result.value {
                        let json = JSON(value)
                        dispatch_async(dispatch_get_main_queue()){
                            callback(self.jsonParser(json))
                        }
                    }
                case .Failure(let error):
                    print(error)
                    dispatch_async(dispatch_get_main_queue()){
                        callback(nil)
                    }
                }
        }
 
    }
    
    
    func getLineColor(lineName: String) -> UIColor {        
        var color: UIColor?
        
        switch lineName {
         case "A":
            color = UIColor(rgba: "#05ADDE")
            break
         case "B":
            color = UIColor(rgba: "#E81526")
            break
         case "C":
            color = UIColor(rgba: "#046AB4")
            break
         case "D":
            color = UIColor(rgba: "#087F69")
            break
         case "E":
            color = UIColor(rgba: "#6D2281")
            break
         case "H":
            color = UIColor(rgba: "#FDC903")
            break
         case "P":
            color = UIColor(rgba: "#FDBA2D")
            break
            
         default:
            color = UIColor(rgba: "#F56D1C")
            break
        }

        return color!
    }
   
    /**
    func calculateFrequency(strFrequency: String) -> String {
        var frequency = Double(strFrequency)
        
        if frequency != 0.0 {
            frequency = frequency! / 60.0;
        } else {
            frequency = 0.0
        }
        
        return "\(frequency)"
    }
     */
    
}