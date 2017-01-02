//
//  ViewController.swift
//  HellaCollectionCells
//
//  Created by Flatiron School on 10/6/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class HellaViewController: UIViewController {
    
    @IBOutlet weak var fiboCollectionView: UICollectionView!
    let cellIdentifier = "fiboCell"
    let segueIdentifier = "fiboSegue"
    var index: Int!
    var fiboColors: UIColor!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        fiboCollectionView.delegate = self
        fiboCollectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != segueIdentifier { return }
        if let dest = segue.destination as? HellaDetailViewController {
            dest.fiboNum = "\(index)"
            dest.newColor = fiboColors
        }
    }
    
    func fibonacci(_ index: Int) -> Int {
        switch index {
        case 0:
            return 0
        case 1:
            return 1
        default:
            return fibonacci(index - 2) + fibonacci(index - 1)
        }
    }
}

extension HellaViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        
        cell.backgroundColor = indexPath.row == fibonacci(indexPath.row) ? .purple : .yellow
        index = indexPath.row
        fiboColors = cell.backgroundColor

        return cell
    }
}

