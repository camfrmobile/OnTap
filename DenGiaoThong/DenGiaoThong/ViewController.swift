//
//  ViewController.swift
//  DenGiaoThong
//
//  Created by Trần Văn Cam on 27/10/2022.
//
//Tạo một ứng dụng đèn giao thông, gồm 3 màu cơ bản (đỏ, xanh, vàng), với mỗi màu đèn có số thời gian đếm tương ứng.
//Quy định:
//
//Đèn tín hiệu phải bật từng màu riêng biệt, đèn này tắt mới được bật đèn kia lên, không được bật nhiều màu cùng một lúc.
//Khi chuyển từ xanh-đỏ và đỏ-xanh bắt buộc phải bật qua màu vàng, vì màu vàng đệm giữa 2 màu xanh đỏ.
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    var timerGreen: Timer?
    var timerYellow: Timer?
    var timerRed: Timer?
    let timeGreen = 5
    let timeYellow = 3
    let timeRed = 7
    var isRun = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        setupTimer()
    }
    
    func setupUI() {
        greenButton.clipsToBounds = true
        greenButton.layer.cornerRadius = greenButton.frame.width / 2
        
        yellowButton.clipsToBounds = true
        yellowButton.layer.cornerRadius = yellowButton.frame.width / 2
        
        redButton.clipsToBounds = true
        redButton.layer.cornerRadius = redButton.frame.width / 2
        
        turnOffAll()
    }
    
    func setupTimer() {
        
        setupTimerGreen()
    }
    
    func setupTimerGreen() {
        var number = timeGreen
        timerGreen = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.turnOffAll()
            self.greenButton.backgroundColor = .green
            self.timeLabel.text = "\(number)"
            number -= 1
            if number < 0 {
                self.isRun = false
                self.timerGreen?.invalidate()
                self.setupTimerYellow()
            }
        })
    }
    
    func setupTimerYellow() {
        var number = timeYellow
        timerYellow = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.turnOffAll()
            self.yellowButton.backgroundColor = .yellow
            self.timeLabel.text = "\(number)"
            number -= 1
            if number < 0 {
                self.timerYellow?.invalidate()
                if self.isRun {
                    self.setupTimerGreen()
                } else {
                    self.setupTimerRed()
                }
            }
        })
    }
    
    func setupTimerRed() {
        var number = timeRed
        timerRed = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.turnOffAll()
            self.redButton.backgroundColor = .red
            self.timeLabel.text = "\(number)"
            number -= 1
            if number < 0 {
                self.isRun = true
                self.timerRed?.invalidate()
                self.setupTimerYellow()
            }
        })
    }
    
    func turnOffAll() {
        greenButton.backgroundColor = .gray
        yellowButton.backgroundColor = .gray
        redButton.backgroundColor = .gray
    }
}

