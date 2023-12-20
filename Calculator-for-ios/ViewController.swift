//
//  ViewController.swift
//  Calculator-for-ios
//
//  Created by Ezgi on 20.12.2023.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings: String = ""
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        clearAll()
    }
    
    func clearAll()
    {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    @IBAction func allclear(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func deleteTAP(_ sender: Any) {
        if(!workings.isEmpty)
        {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    
    func addToWorking(value: String)
    {
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    
    @IBAction func percenty(_ sender: Any) {
        addToWorking(value: "%")
    }
    
   
  
    @IBAction func bol(_ sender: Any) {
        addToWorking(value: "/")
    }
    
    
    @IBAction func carp(_ sender: Any) {
        addToWorking(value: "*")
    }
    
    @IBAction func cikar(_ sender: Any) {
        addToWorking(value: "-")
    }
    
    @IBAction func plus(_ sender: Any) {
        addToWorking(value: "+")
    }
    
    @IBAction func equal(_ sender: Any)
    {
        if (validInput()){
            let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            calculatorResults.text = resultString
        }
        else {
            let alert = UIAlertController(title: "Invalid Input", message: "Hatalı giriş yapıldı", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool {
        
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in workings{
            if(specialCharacter(char: char)){
                
                funcCharIndexes.append(count)
            }
            count += 1
            
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes {
            if(index == 0){
                return false
            }
            if(index == workings.count - 1){
                return false
            }
            
            if(previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
            
        }
        return true
    }
    
    func specialCharacter(char: Character) -> Bool  {
        if (char == "*"){
            return true
        }
        if (char == "/"){
            return true
        }
        if (char == "+"){
            return true
        }
        if (char == "-"){
            return true
        }
        return false
    }
    
    
    func formatResult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1 ) == 0 ){
            
            return String(format: "%.0f", result)
            
        }
        else{
            return String(format: "%.2f", result)

            
        }
    }
    
    @IBAction func decimal(_ sender: Any) {
        addToWorking(value: ".")
    }
    
    @IBAction func zero(_ sender: Any) {
        addToWorking(value: "0")
    }
    
    @IBAction func one(_ sender: Any) {
        addToWorking(value: "1")
    }
    
    @IBAction func two(_ sender: Any) {
        addToWorking(value: "2")
    }
    
    @IBAction func three(_ sender: Any) {
        addToWorking(value: "3")
    }
    
    @IBAction func four(_ sender: Any) {
        addToWorking(value: "4")
    }
    
  
    @IBAction func five(_ sender: Any) {
        addToWorking(value: "5")
    }
    
    
    @IBAction func six(_ sender: Any) {
        addToWorking(value: "6")
    }
    
    
    @IBAction func seven(_ sender: Any) {
        addToWorking(value: "7")
    }
    
    
    @IBAction func eight(_ sender: Any) {
        addToWorking(value: "8")
    }
    
    
    @IBAction func nine(_ sender: Any) {
        addToWorking(value: "9")
    }
    
    
}
