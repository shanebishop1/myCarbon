//
//  SelectorViewController.swift
//  HackDukeApp
//
//  Created by Andy Kotz on 12/5/20.
//

import UIKit

class SelectorViewController: UIViewController{
    //var total = Total()
//
//    @IBAction func householdPressed(_ sender: UIButton) {
//
//    }
    
    @IBOutlet weak var dailyTotal: UILabel!
    
    @IBOutlet weak var foodButton: UIButton!
    @IBOutlet weak var houseButton: UIButton!
    @IBOutlet weak var transpButton: UIButton!
    @IBOutlet weak var goodsButton: UIButton!
    
    var totalemissions: Float = 0
    var score: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yyyy HH:mm"
        
        let actualDate = Date()
        let actualString: String = df.string(from: actualDate)
        let actSub = actualString.prefix(10)
        let finStr = String(actSub)
        
        let defaults = UserDefaults.standard
        
        if let storedDate = defaults.object(forKey: "currentDate") as? Date{
            let dateString: String = df.string(from: storedDate)
            let dateSubstring = dateString.prefix(10)
            let finString = String(dateSubstring)
        
        if(finString != finStr){
            dailyTotal.text = String(format: "%.2f", 0)
            Total.value = 0
        }
        else{
            dailyTotal.text = "\(String(format: "%.2f", Total.value + Total.subTotal))lb"
            Total.value = Total.value + Total.subTotal
        }
            print("Stored Date: ", finString)
            defaults.set(Date(), forKey: "currentDate")
            print("Actual Date: ", finStr)
        }
        else {
            defaults.set(Date(), forKey: "currentDate")
            dailyTotal.text = String(format: "%.2f", 0)
            Total.value = 0
            }
//        totalemissions = Total.value
//        if totalemissions < 100 {
//            score = 100
//        }
//        else if totalemissions >= 100 {
//            score = score + 100 * (11/totalemissions)
//        }
//        Total.score = score
//        print(Total.score)
//        foodButton.layer.borderWidth = 1.5
//        foodButton.layer.borderColor = UIColor.white.cgColor
//        foodButton.layer.cornerRadius = foodButton.bounds.width / 8
//        
//        houseButton.layer.borderWidth = 1.5
//        houseButton.layer.borderColor = UIColor.white.cgColor
//        houseButton.layer.cornerRadius = foodButton.bounds.width / 8
//        
//        transpButton.layer.borderWidth = 1.5
//        transpButton.layer.borderColor = UIColor.white.cgColor
//        transpButton.layer.cornerRadius = foodButton.bounds.width / 8
//        
//        goodsButton.layer.borderWidth = 1.5
//        goodsButton.layer.borderColor = UIColor.white.cgColor
//        goodsButton.layer.cornerRadius = foodButton.bounds.width / 8
    }
    

    @IBAction func scoreMeaningPressed(_ sender: UIButton) {
        totalemissions = Total.value
        if totalemissions < 11 {
            score = 100
        }
        else if totalemissions >= 11 {
            score = 100 * (11/totalemissions)
        }
        Total.score = score
        
        if Total.score == 100 {
            self.performSegue(withIdentifier: "excellentScore", sender: self)
        }
        else if Total.score > 50 && Total.score < 100 {
            self.performSegue(withIdentifier: "greatScore", sender: self)
        }
        else if Total.score > 30 && Total.score <= 50 {
            self.performSegue(withIdentifier: "goodScore", sender: self)
        }
        else if Total.score > 20 && Total.score <= 30 {
            self.performSegue(withIdentifier: "fairScore", sender: self)
        }
        else if Total.score > 10 && Total.score <= 20 {
            self.performSegue(withIdentifier: "poorScore", sender: self)
        }
        else {
            self.performSegue(withIdentifier: "veryPoorScore", sender: self)
        }
    }
//    @IBAction func calcPressed(_ sender: Any) {
//        print("in calc presse \(Total.value + Total.subTotal)")
//
//
//        dailyTotal.text = String(format: "%.2f", Total.value + Total.subTotal)
//        Total.value = Total.value + Total.subTotal
//
//    }
    @IBAction func pressHousehold(_ sender: UIButton) {
        print("before segue test")
        self.performSegue(withIdentifier: "householdGo" , sender: self)
        print("after segue test")
        
    }
    
    
    @IBAction func foodPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToFoods" , sender: self)
    }
    
    @IBAction func TransportationPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "NewTransportationViewController" , sender: self)
    }
    
    @IBAction func GoodsPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToGoods" , sender: self)
    }
    
    func load(){
        print("before load test")
        dailyTotal.text = String(Total.subTotal)
        print("after load test")
    }
}
