//
//  LineCell.swift
//  Subte.io
//
//  Created by Mariano Molina on 14/6/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import UIKit
import MapKit

class LineCell: UICollectionViewCell {
    
    @IBOutlet weak var lineName: UILabel!
    @IBOutlet weak var lineState: UILabel!
    @IBOutlet weak var backgroundLine: UIView!
    @IBOutlet weak var lineMap: MKMapView!
    
}
