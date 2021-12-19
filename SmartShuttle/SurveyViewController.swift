//
//  SurveyViewController.swift
//  SmartShuttle
//
//  Created by ms41 on 19.12.21.
//

import UIKit

class SurveyViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    var timer = Timer()
    var counter = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func stopTrip(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
            counter += 1
            timerLabel.text = "\(counter)"
        }

}
