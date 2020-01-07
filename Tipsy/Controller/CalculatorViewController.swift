//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    let activeColors : [String : String] = ["text" : "#00b06b" , "background": "#d7f9ea"]
    let inactiveColors : [String : String] = ["text":"#ffffff", "background":"#d7f9ea"]
    
    var tipsyBrain = TipsyBrain()
    
    var previousButton: UIButton?

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
//        previousButton?.tintColor = hexStringToUIColor(hex: inactiveColors["background"]!)
//        previousButton?.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        let buttonLabel = sender.title(for: .normal)!
        
        if buttonLabel == "0%"{
            tipsyBrain.setTip(0)
        }
        else if buttonLabel == "10%" {
            tipsyBrain.setTip(10)
        }
        else{
            tipsyBrain.setTip(20)
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        tipsyBrain.setSplitFactor(Int(sender.value))
        splitNumberLabel.text = String(format:"%.0f",sender.value )
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        tipsyBrain.calculateIndividualBill()
        self.performSegue(withIdentifier: "showResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.individualValue = String(format: "%.2f", tipsyBrain.getPersonalBill())
            destinationVC.split =  String(format: "%d", tipsyBrain.getSplit())
            destinationVC.tip = String(format: "%d",tipsyBrain.getTip())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousButton = tenPcButton
        
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
}
    
    


}

