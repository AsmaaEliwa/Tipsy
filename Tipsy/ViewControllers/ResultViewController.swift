//
//  ResultViewController.swift
//  Tipsy
//
//  Created by asmaa gamal  on 03/05/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var result:String?
    var splitters:Int?
    var tip:String?
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var resultInfoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = result
        resultInfoLabel.text = "Split between \(String(describing: splitters) ?? "") people, with \(String(describing: tip) ?? "") tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
   

}
