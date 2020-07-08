//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    let eggType: [String:Int] = ["Soft" : 5 , "Medium" : 7 , "Hard" : 12]
    var eggTimer:Timer? = nil
    
    @IBAction func eggClicked(_ sender: UIButton) {
        if eggTimer == nil {
            
            let eggTypeSelected = sender.currentTitle!
            self.lblTitle.text = String(format:"Selected: %@", eggTypeSelected)
            
            let timeSelected = eggType[eggTypeSelected]!
            var timePassed = 0
            
            self.eggTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                
                timePassed += 1
                self.lblTitle.text = String(format:"%d seconds..", timePassed)
                self.progressBar.setProgress(Float(timePassed)/Float(timeSelected), animated: true)
                if timePassed == timeSelected {
                    print("\nHell yeah! Your ", eggTypeSelected, " egg is ready!")
                    self.eggTimer?.invalidate()
                    self.eggTimer = nil
                }
            }
        }
        
    }
    
}
