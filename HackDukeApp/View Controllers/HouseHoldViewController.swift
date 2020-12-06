//
//  HouseHoldAdd.swift
//  HackDukeApp
//
//  Created by Andy Kotz on 12/5/20.
//


import UIKit


class HouseHoldViewController: UIViewController {
    var subTotal: Float = 100
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var unitOutput: UILabel!
    
    
    @IBOutlet weak var energyButton: UIButton!
    @IBOutlet weak var heatWater: UIButton!
    @IBOutlet weak var propaneButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    var weight: Float = 0.0 //Depending on what is pressed, use this to determine carbon
    var units: String = ""
    
    override func viewDidLoad() {
                energyButton.layer.borderWidth = 1.5
        energyButton.layer.borderColor = UIColor.white.cgColor
        energyButton.layer.cornerRadius = energyButton.bounds.width / 8
        
                heatWater.layer.borderWidth = 1.5
        heatWater.layer.borderColor = UIColor.white.cgColor
        heatWater.layer.cornerRadius = energyButton.bounds.width / 8
        
        waterButton.layer.borderWidth = 1.5
        waterButton.layer.borderColor = UIColor.white.cgColor
        waterButton.layer.cornerRadius = energyButton.bounds.width / 8
        
                propaneButton.layer.borderWidth = 1.5
        propaneButton.layer.borderColor = UIColor.white.cgColor
        propaneButton.layer.cornerRadius = energyButton.bounds.width / 8
    }
    
    @IBAction func heatPressed(_ sender: UIButton) {
        weight = 13.466
        units = "therms"
        //changeUnits(for: units)
        unitOutput.text = units
        
    }
    

    @IBAction func energyPressed(_ sender: UIButton) {
        weight = 1.85
        units = "kw/h"
        unitOutput.text = units
        
    }
    
    @IBAction func waterPressed(_ sender: UIButton) {
        weight = 0.00893
        units = "gallons"
        unitOutput.text = units
    }
    
    
    @IBAction func propanePressed(_ sender: UIButton) {
        weight = 13.0
        units = "gallons"
        unitOutput.text = units
    }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        //print("in house hold subtotal\(weight * Float(userInput.text!)!)")
        Total.subTotal = weight * Float(userInput.text!)!
        self.performSegue(withIdentifier: "backToSelectorFromHouse" , sender: self)
    }
    
//    struct GlobalVar{
//        static var sub = subTotal
//    }
    
//    func getSubTotal() -> Float{
//        return subTotal
//    }
}

