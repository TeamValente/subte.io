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
            
            
            //Cargo el punto
            let lineaSubte = SubwayLine(name: lineName,status: lineStatus,frequency: lineFrequency)
            
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
    
    
    
    
}