//
//  MyViewController.swift
//  SmartShuttle
//
//  Created by ms41 on 12.11.21.
//

import UIKit

class MyViewController: UIViewController {
    
    @IBOutlet var myview: UIView!
    
    
    override func loadView() {
//        view.addSubview(myview)
        
        let mystoryboard = UIStoryboard(name: "ChoseShuttle", bundle: nil)
        let vc = mystoryboard.instantiateViewController(withIdentifier: "myVCID")
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.prefersEdgeAttachedInCompactHeight = true
        }
        
//        present(self, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
