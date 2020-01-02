//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Jenny  on 12/27/19.
//  Copyright © 2019 Allan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipSegment: UISegmentedControl!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = " Settings"
        let intValue = defaults.integer(forKey: "tipIndex")
        defaultTipSegment.selectedSegmentIndex = intValue;
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func changeDefaultTip(_ sender: Any) {
        let defaultTip = defaultTipSegment.selectedSegmentIndex
        defaults.set(defaultTip, forKey:"tipIndex")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
