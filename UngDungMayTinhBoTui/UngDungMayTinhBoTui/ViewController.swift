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
    var isTheEnd = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func actionNumberClick(_ sender: UIButton) {
        highlightMath(nil)
        let number = sender.titleLabel?.text ?? ""
        inputText += "\(number)"
        inputValue = Float(inputText) ?? 0
        showText(inputText)
        isTheEnd = false
    }
    
    @IBAction func actionMathClick(_ sender: UIButton) {
        if !isTheEnd {
            Calculator()
            isTheEnd = true
        }
        highlightMath(sender)
        inputMath = sender.titleLabel?.text ?? ""
        saveValue = inputValue
        inputText = ""
    }
    @IBAction func actionResult(_ sender: UIButton) {
        highlightMath(nil)
        Calculator()
        isTheEnd = true
    }
    
    @IBAction func actionClear(_ sender: UIButton?) {
        highlightMath(nil)
        saveValue = 0
        inputValue = 0
        inputText = ""
        inputMath = ""
        showText("")
    }
    
    func Calculator () {
        var floatResult: Float = 0
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
                showText("Lỗi!")
                return
            }
            floatResult = saveValue / inputValue
        default:
            floatResult = inputValue
            break
        }
        inputText = ""
        inputValue = floatResult
        showValue(floatResult)
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
