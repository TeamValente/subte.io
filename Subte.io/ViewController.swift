//
//  ViewController.swift
//  Subte.io
//
//  Created by Mariano Molina on 27/9/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Controller Properties
    let servicioSubte = SubwayServices()
    var lineLists = [SubwayLine]()
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

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

