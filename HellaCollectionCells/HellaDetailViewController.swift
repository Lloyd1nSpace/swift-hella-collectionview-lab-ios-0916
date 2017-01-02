//
//  HellaDetailViewController.swift
//  HellaCollectionCells
//
//  Created by Lloyd W. Sykes on 1/2/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class HellaDetailViewController: UIViewController {
    
    var fiboNum: String!
    var newColor: UIColor!
    @IBOutlet weak var indexLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCustomizations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewCustomizations()
    }
    
    func viewCustomizations() {
        view.backgroundColor = newColor
        indexLabel.text = fiboNum
    }
    
}
