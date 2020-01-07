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
    
    func getPersonalBill() -> Float {
        return personalBill ?? 0.00
    }
    
    mutating func calculateIndividualBill(_ totalAmount: Float, _ nPersons: Int, _ tipValue: Int){
        personalBill = (totalAmount*(1+(Float(tipValue)/100.00)))/Float(nPersons)
    }
    
}
