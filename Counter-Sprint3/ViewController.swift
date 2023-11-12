//
//  ViewController.swift
//  Counter-Sprint3
//
//  Created by Vladimir Vinageras on 11.11.2023.
//

import UIKit

class ViewController: UIViewController {
    var textLabel = "Значение счётчика:"
    var counterValue = 0
    var history = [CounterRecord]()

    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = UIImage.SymbolConfiguration(pointSize: 30)
        self.resetButton.setImage(UIImage(systemName: "arrow.counterclockwise", withConfiguration: configuration), for: .normal)

    }
    
    
    @IBAction func increaseCounterOnTap(_ sender: Any) {
        increaseCounter()
    }
    
    @IBAction func decreaseCounterOnTap(_ sender: Any) {
        decreaseCounter()
    }
    
    @IBAction func resetCounterOnTap(_ sender: Any) {
        resetCounter()
    }
    
    func increaseCounter(){
        self.counterValue += 1
        self.counterLabel.text = (textLabel + " " + counterValue.description)
        addNewCounterRecord(newCounterEvent: .increaseValue )
    }
    
    func decreaseCounter(){
        if counterValue <= 0{
            addNewCounterRecord(newCounterEvent: .belowZero)
        }else{
            counterValue -= 1
            addNewCounterRecord(newCounterEvent: .decreaseValue)
        }
        counterLabel.text = (textLabel + " " + counterValue.description)
    }
    
    func resetCounter(){
        self.counterValue = 0
        self.counterLabel.text = (textLabel + " " + counterValue.description)
        addNewCounterRecord(newCounterEvent: .resetCounter)
    }
    
    func addNewCounterRecord(newCounterEvent: CounterEvent){
        let counterRecord = CounterRecord(dateRecord: Date(), counterEvent: newCounterEvent)
        history.append(counterRecord)
        
        var historyListFormatted = ""
        for record in history.reversed() {
            historyListFormatted += record.eventRecord + "\n"
        
        }
        self.counterTextView.text = historyListFormatted
        self.counterTextView.textColor = .darkText
    }
}

