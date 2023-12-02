//
//  ViewController.swift
//  Sprint_3_clickerCounter_Upgrade
//
//  Created by Pavel Popov on 30.11.2023.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var textClicker: UILabel!
    @IBOutlet weak var plusClicker: UIButton!
    @IBOutlet weak var minusClicker: UIButton!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var historyOfClicker: UITextView!
    var counter: Int = 0
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textClicker.text = "0"
        historyOfClicker.delegate = self
        historyOfClicker.text = "История изменений: \n"
    }
    
    func appendStringToHistoryAndSorting(_ changeDescription: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "[HH:mm:ss]"
        let currentDateTime = Date()
        let dateString = dateFormatter.string(from: currentDateTime)
        historyOfClicker.text.append(dateString + changeDescription + "\n")
        
        let lines = historyOfClicker.text.components(separatedBy: "\n")
        let sortedLines = lines.sorted().reversed()
        let sortedText = sortedLines.joined(separator: "\n")
        historyOfClicker.text = sortedText
    }
    
    @IBAction func buttonPlusClick(_ sender: Any) {
        counter += 1
        textClicker.text = String(counter)
        appendStringToHistoryAndSorting("- значение увеличено на +1")
    }
    
    @IBAction func buttonMinusClick(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            textClicker.text = String(counter)
            appendStringToHistoryAndSorting("- значение уменьшено на -1")
        } else {
            appendStringToHistoryAndSorting("- попытка уменьшить значение ниже 0")
        }
    }
        @IBAction func buttonDoReset(_ sender: Any) {
            counter = 0
            textClicker.text = String(counter)
            appendStringToHistoryAndSorting("- значение сброшено")
    }
}
