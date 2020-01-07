//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by user161182 on 1/7/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    
    var personalBill: Float?
    var splitFactor: Int?
    var tip: Int?
    var totalAmount : Float?
    
    func getPersonalBill() -> Float {
        return personalBill ?? 100.00
    }
    
    mutating func calculateIndividualBill(){
        let percentualTip = 1.00+(Float(tip ?? 10)/100.00)
        personalBill = (totalAmount ?? 100.00 * percentualTip)/Float(splitFactor ?? 2)
    }
    
    mutating func setSplitFactor(_ factor: Int){
        splitFactor = factor
    }
    
    mutating func setTip(_ tipValue : Int){
        tip = tipValue
    }
    
    mutating func setTotalAmount(_ total : Float){
        totalAmount = total
    }
    
    func getTip() -> Int {
        return tip ?? 10
    }
    
    func getSplit() -> Int {
        return splitFactor ?? 2
    }
}
