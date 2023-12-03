//
//  ViewController.swift
//  Sprint_3_clickerCounter_Upgrade
//
//  Created by Pavel Popov on 30.11.2023.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    private var counter: Int = 0
    @IBOutlet private weak var textLabel: UILabel!
    @IBOutlet private weak var increaseButton: UIButton!
    @IBOutlet private weak var decreaseButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyOfClicker: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "0"
        historyOfClicker.delegate = self
        historyOfClicker.text = "История изменений: \n"
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return false
    }
    
    private func appendStringToHistoryAndSorting(_ changeDescription: String) {
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
    
    @IBAction private func increaseButton(_ sender: Any) {
        counter += 1
        textLabel.text = String(counter)
        appendStringToHistoryAndSorting("- значение увеличено на +1")
    }
    
    @IBAction private func decreaseButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            textLabel.text = String(counter)
            appendStringToHistoryAndSorting("- значение уменьшено на -1")
        } else {
            appendStringToHistoryAndSorting("- попытка уменьшить значение ниже 0")
        }
    }
    @IBAction private func resetButton(_ sender: Any) {
        counter = 0
        textLabel.text = String(counter)
        appendStringToHistoryAndSorting("- значение сброшено")
    }
}
