//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var finalResult:String?
    var selectedTipButton:UIButton?
    var selectedTipValue:Double?
    var selectedSplitNum:Int?
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tenButton.isSelected = false
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        selectedTipButton = sender
        switch true {
        case sender == zeroButton:
            zeroButton?.isSelected = true
            twentyButton?.isSelected = false
            tenButton?.isSelected = false
            selectedTipValue = 0.0
        case sender == twentyButton:
            twentyButton?.isSelected = true
            tenButton?.isSelected = false
            zeroButton?.isSelected = false
            selectedTipValue = 0.2
        case sender == tenButton:
            tenButton?.isSelected = true
            zeroButton?.isSelected = false
            twentyButton?.isSelected = false
            selectedTipValue = 0.1
        case false:
            print("error")
        case true:
            print("error")
        }
      
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        stepperLabel.text = String(Int(sender.value))
        selectedSplitNum = Int(sender.value)
        
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
//        present(ResultViewController() , animated: true, completion: nil)
        let totalBill = Double(billTextField.text ?? "") ?? 0.0
        let result = (totalBill  + (totalBill * (selectedTipValue ??  0.0) )) / Double(selectedSplitNum ?? 2)
         finalResult = String(format:"%.2f", result)
        print( finalResult )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult"{
            let distnationVC = segue.destination as! ResultViewController
            distnationVC.result = finalResult
            distnationVC.splitters = selectedSplitNum
            distnationVC.tip = selectedTipButton?.titleLabel?.text
        
        }
    }
}

