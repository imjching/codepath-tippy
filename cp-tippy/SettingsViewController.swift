//
//  SettingsViewController.swift
//  cp-tippy
//
//  Created by Jay on 9/29/16.
//  Copyright © 2016 Jay. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var roundTipSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func defaultTipChanged(_ sender: AnyObject) {
        let tipIndex = tipControl.selectedSegmentIndex
        
        let defaults = UserDefaults.standard
        defaults.set(tipIndex, forKey: "tipIndex")
        defaults.set(true, forKey: "defaultChanged")
        defaults.synchronize()
    }
    
    @IBAction func roundTipSwitchChanged(_ sender: AnyObject) {
        let isOn = roundTipSwitch.isOn
        
        let defaults = UserDefaults.standard
        defaults.set(isOn, forKey: "roundTip")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "tipIndex")
        let roundTipBool = defaults.bool(forKey: "roundTip")
        
        tipControl.selectedSegmentIndex = intValue
        roundTipSwitch.setOn(roundTipBool, animated: false)
    }
}
