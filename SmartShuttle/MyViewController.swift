//
//  MyViewController.swift
//  SmartShuttle
//
//  Created by ms41 on 12.11.21.
//

import UIKit

class MyViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    @IBOutlet var myview: UIView!
    
    @IBOutlet weak var ChargeBar: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ChargeBar.transform = ChargeBar.transform.scaledBy(x: 1, y: 3)
        print("Did load")
        check()
        print(self)
        self.sheetPresentationController?.delegate = self
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("DidDesapiar")
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("will desapear")
        check()
    }
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var ModelDetails: UIView!
    func showMyViewPresentComtr()-> UIViewController {
        let mystoryboard = UIStoryboard(name: "ChoseShuttle", bundle: nil)
        let vc = mystoryboard.instantiateViewController(withIdentifier: "myVCID")
        print("delegare self", self)
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.prefersEdgeAttachedInCompactHeight = true
            print("delegare self", self)
            sheet.delegate = self

        }
        return vc
    
//        present(vc, animated: true)
        
        
        
    }
    func check(){
        print (self.text)
        print(self.picture)
    }
    
    @IBOutlet weak var text: UITextField!
    
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController){

        if sheetPresentationController.selectedDetentIdentifier == .large {
            text?.isHidden = false
            self.check()
            print("aaa")
            print(self)
        } else {
            text?.isHidden = true
            print("bbb")
        }
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
extension UISheetPresentationController {
   
}
