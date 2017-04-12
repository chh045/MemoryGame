//
//  ComposeViewController.swift
//  MemoryGame
//
//  Created by Huang Edison on 4/11/17.
//  Copyright © 2017 Edison. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var SignalLabel: UILabel!
    @IBOutlet weak var NumberTextView: UITextView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var numberSeriesLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    var counter: Int?
    var numberSeriesString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NumberTextView.delegate = self
        resultLabel.isHidden = true
        if let counter = counter {
            timerLabel.text = String(format: "%02d:%02d", counter/60, counter%60)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.characters.count == 0 {
            SignalLabel.isHidden = false
        }
        else {
            SignalLabel.isHidden = true
        }
    }
    
    
    @IBAction func onTapDone(_ sender: Any) {
        resultLabel.isHidden = false
        if NumberTextView.text == numberSeriesString {
            resultLabel.text = "Correct!"
            resultLabel.textColor = UIColor.green
            timerLabel.textColor = UIColor.green

        }
        else {
            resultLabel.text = "Incorrect!"
            resultLabel.textColor = UIColor.red
            timerLabel.textColor = UIColor.red

        }
        numberSeriesLabel.text = numberSeriesString
    }
    
    @IBAction func onTapMeun(_ sender: Any) {
        performSegue(withIdentifier: "ComposeToMeun", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
