//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by user161182 on 1/7/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tip : String?
    var split : String?
    var individualValue : String?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        print()
        resultLabel.text = individualValue ?? "10"
        infoLabel.text = "Split between \(split ?? "2") people, with \(tip ?? "10%") tip."
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}
