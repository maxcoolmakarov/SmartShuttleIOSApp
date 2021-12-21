//
//  MyViewController.swift
//  SmartShuttle
//
//  Created by ms41 on 12.11.21.
//

import UIKit
import MapKit

class MyViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    @IBOutlet var myview: UIView!
    @IBOutlet weak var ChargeBar: UIProgressView!
    @IBOutlet weak var modelDetails: UIView!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet var shuttleDescription: UITextView!
    
    var opened = false
    var pic =  UIImage(named: "SShuttle")
    var pricePerHour = 0.0
    
    
    let mainBoard = UIStoryboard(name: "Main", bundle: nil)
    
    @IBOutlet var price: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChargeBar.transform = ChargeBar.transform.scaledBy(x: 1, y: 3)
        ChargeBar.setProgress(1, animated: true)
        shuttleDescription.isEditable = false
        shuttleDescription.isSelectable = false
        opened = true
        picture.image = pic
        modelDetails.isHidden = true
        print("Did load")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("DidDesapiar")
        opened = false
        
    }
    
    
    func setData(_ shuttle: Shuttle){
        price.text = String(shuttle.price)
        pricePerHour = shuttle.price
        ChargeBar.progressTintColor = UIProgressView.getButteryColour(progress: shuttle.charge/100)
        ChargeBar.setProgress(shuttle.charge/100, animated: true)
        if shuttle.title == "SShuttle" {
            print("shuttle")
            picture.image = UIImage(named: "SShuttle")
            shuttleDescription.text = "\n Max load: 300 kg \n Shuttle weight: 600 kg \n Max speed: 40 km/hr \n"
            
        } else {
            print("Busik")
            picture.image = UIImage(named: "Busik")
        }
    }
    
    @IBAction func rentMe(_ sender: Any) {
        print("rent me")
        let mainBoard = UIStoryboard(name: "Main", bundle: nil)
        let surveyVC = mainBoard.instantiateViewController(identifier: "surveyID") as! SurveyViewController
        surveyVC.price = pricePerHour
        self.dismiss(animated: true, completion: nil)
        presentingViewController?.show(surveyVC, sender: nil)
    }
    
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController){

        if sheetPresentationController.selectedDetentIdentifier == .large {
            modelDetails?.isHidden = false
        } else {
            modelDetails?.isHidden = true
        }
    }
}

extension UIProgressView {
    static func getButteryColour(progress: Float) -> UIColor{
        if progress < 0.2 {
            return UIColor.red
        } else if progress < 0.6 {
            return UIColor.yellow
        } else {
            return UIColor.systemGreen
        }
    }
}

