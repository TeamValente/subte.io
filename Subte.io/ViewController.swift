//
//  ViewController.swift
//  Subte.io
//
//  Created by Mariano Molina on 27/9/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let servicioSubte = SubwayServices()
    var lineLists = [SubwayLine]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        servicioSubte.fetch { (lines) in
            if let list = lines {
                self.lineLists = list
                
                print("Listado: \(self.lineLists)")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

