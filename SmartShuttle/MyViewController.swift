//
//  MyViewController.swift
//  SmartShuttle
//
//  Created by ms41 on 12.11.21.
//

import UIKit

class MyViewController: UIViewController {
    
    @IBOutlet var myview: UIView!
    
    
    @IBOutlet weak var ChargeBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ChargeBar.transform = ChargeBar.transform.scaledBy(x: 1, y: 3)
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
