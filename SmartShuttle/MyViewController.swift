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
    @IBOutlet var price: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChargeBar.transform = ChargeBar.transform.scaledBy(x: 1, y: 3)
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
        ChargeBar.progress = shuttle.charge/100
        if shuttle.title == "SShuttle" {
            print("shuttle")
            picture.image = UIImage(named: "SShuttle")
            shuttleDescription.text = "\n Max load: 300 kg \n Shuttle weight: 600 kg \n Max speed: 40 km/hr \n"
            
        } else {
            print("Busik")
            picture.image = UIImage(named: "Busik")
        }
    }
    
    
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController){

        if sheetPresentationController.selectedDetentIdentifier == .large {
            modelDetails?.isHidden = false
        } else {
            modelDetails?.isHidden = true
        }
    }
}
