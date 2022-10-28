//
//  ViewController.swift
//  UngDungMayTinhBoTui
//
//  Created by Trần Văn Cam on 26/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var multipleButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    
    var saveValue: Float = 0
    var inputValue: Float = 0
    var inputText: String = ""
    var inputMath: String = ""
    var isResult: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionNumberClick(_ sender: UIButton) {
        highlightMath(nil)
        if isResult {
            actionClear(nil)
        }
        let number = sender.currentTitle ?? ""
        inputText += "\(number)"
        inputValue = Float(inputText) ?? 0
        showText(inputText)
        isResult = false
    }
    
    @IBAction func actionMathClick(_ sender: UIButton) {
        highlightMath(sender)
        if isResult {
            
        } else {
            saveValue = calculator()
        }
        
        inputMath = sender.currentTitle ?? ""
        inputText = ""
        isResult = false
    }
    @IBAction func actionResult(_ sender: UIButton) {
        highlightMath(nil)
        saveValue = calculator()
        inputText = ""
        isResult = true
    }
    
    @IBAction func actionClear(_ sender: UIButton?) {
        highlightMath(nil)
        saveValue = 0
        inputValue = 0
        inputText = ""
        inputMath = "+"
        isResult = false
        showText("0")
    }
    
    func calculator () -> Float {
        var floatResult: Float
        switch inputMath {
        case "+":
            floatResult = saveValue + inputValue
        case "-":
            floatResult = saveValue - inputValue
        case "x":
            floatResult = saveValue * inputValue
        case "/":
            if inputValue == 0 {
                actionClear(nil)
                //showText("Lỗi!")
                //return
            }
            floatResult = saveValue / inputValue
        default:
            floatResult = inputValue
        }
        showValue(floatResult)
        return floatResult
    }
    
    func highlightMath(_ sender: UIButton?) {
        plusButton.backgroundColor = .systemBrown
        subtractButton.backgroundColor = .systemBrown
        multipleButton.backgroundColor = .systemBrown
        divisionButton.backgroundColor = .systemBrown
        sender?.backgroundColor = .orange
    }
    
    func showValue(_ number: Float) {
        let splitNumber = modf(number) //splitPi.0
        if splitNumber.1 == 0 && number < Float(Int.max) {
            resultLabel.text = "\(Int(number))"
        } else {
            resultLabel.text = "\(number)"
        }
    }
    func showText(_ text: String) {
        resultLabel.text = text
    }
}
