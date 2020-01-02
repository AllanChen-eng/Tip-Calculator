//
//  ViewController.swift
//  Tippy
//
//  Created by Jenny  on 12/25/19.
//  Copyright © 2019 Allan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tipValue=0.1;
    let defaults = UserDefaults.standard;
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        
        let intValue = defaults.integer(forKey: "tipIndex")
        tipControl.selectedSegmentIndex = intValue;
        
        // Do any additional setup after loading the view.
    }

    @IBAction func tipSlider(_ sender: UISlider) {
        tipValue=Double(round(sender.value)/100)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill=Double(billField.text!) ?? 0
        let tipPercentages=[0.12,0.15,0.18,tipValue]
         let tipIndex = tipControl.selectedSegmentIndex
        let tipButtons=tipPercentages[tipIndex];
        let tip=bill * tipButtons
        let total = bill+tip

        tipPercentLabel.text=String(format: "%.0f%%", tipButtons * 100)
        tipLabel.text=String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

