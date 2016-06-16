//
//  StatusViewController.swift
//  Subte.io
//
//  Created by Mariano Molina on 14/6/16.
//  Copyright © 2016 marianomolina.xyz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "LineCell"

class StatusViewController: UIViewController, PassbookCollectionViewLayoutDelegate, UICollectionViewDataSource, UINavigationBarDelegate {

    // MARK: - View Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    
    // MARK: - data
    let servicioSubte = SubwayService()
    var listadoLineas = [SubwayLine]()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = servicioSubte.getSubwayLines { (SubwayService) -> () in
            if let lines = SubwayService {
                
                self.listadoLineas = lines
                self.collectionView.reloadData()
            }
        }
        
        let transparent = UIImage()
        navigationBar.shadowImage = transparent
        navigationBar.setBackgroundImage(transparent, forBarMetrics: .Default)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let navigationBarHeight = navigationBar.frame.size.height
        collectionView.contentInset.top = navigationBarHeight
        
        let layout = collectionView.collectionViewLayout as! PassbookCollectionViewLayout
        let height = collectionView.bounds.size.height - 2 * navigationBarHeight - 2 * layout.bottomStackHeight
        layout.cellSize = CGSize(width: 0, height: height - fmod(height, 20))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Collection View
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listadoLineas.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! LineCell
        
        let currentItem = listadoLineas[indexPath.item]
        
        cell.lineName.text = "Linea \(currentItem.lineName)"
        cell.lineState.text = "Estado de la línea: \(currentItem.lineStatus)"
        cell.backgroundLine.backgroundColor = currentItem.lineColor
        
//        let fq = servicioSubte.calculateFrequency(currentItem.lineFrequency)
//        
//        print("Frequencia \(fq)")
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let layout = collectionView.collectionViewLayout as! PassbookCollectionViewLayout
        layout.indexPathForSelectedItem = layout.indexPathForSelectedItem == nil ? indexPath : nil
    }
    
    
    // MARK: - Navigation Bar
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
    

}
