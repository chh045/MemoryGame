//
//  FourNumberPracticeModeViewController.swift
//  MemoryGame
//
//  Created by Huang Edison on 4/11/17.
//  Copyright © 2017 Edison. All rights reserved.
//

import UIKit

class FourNumberPracticeModeViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberSeriesLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    
    var timer = Timer()
    var counter = 0
    var randomNumberSeries = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nextButton.isHidden = true
        nextButton.isEnabled = false
        doneButton.isHidden = true
        doneButton.isEnabled = false
        numberSeriesLabel.sizeToFit()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateUI(){
        var random = arc4random_uniform(110)
        imageView1.image = UIImage(named: "\(random)")
        var randomNumberText = "\(ViewController.ConvertNum(num: random))"
        random = arc4random_uniform(110)
        imageView2.image = UIImage(named: "\(random)")
        randomNumberText += "\(ViewController.ConvertNum(num: random))"
        numberLabel.text = randomNumberText
        randomNumberSeries += randomNumberText
        numberSeriesLabel.text = randomNumberSeries
        if (numberSeriesLabel.text?.characters.count)! >= 100 {
            nextButton.isHidden = true
            nextButton.isEnabled = false
            doneButton.isHidden = false
            doneButton.isEnabled = true
        }
    }
    
    func updateTimer(){
        counter += 1
        timerLabel.text = String(format: "%02d:%02d", counter/60, counter%60)
    }
    
    @IBAction func onTapStart(_ sender: Any) {
        startButton.isHidden = true
        startButton.isEnabled = false
        nextButton.isHidden = false
        nextButton.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        updateUI()
    }
    

    @IBAction func onTapNext(_ sender: Any) {
        updateUI()
    }
    
    @IBAction func onTapBack(_ sender: Any) {
        performSegue(withIdentifier: "FourNumberPracticeModeToMeun", sender: nil)
    }
    
    @IBAction func onTapDone(_ sender: Any) {
        timer.invalidate()
        timerLabel.textColor = UIColor.green
        performSegue(withIdentifier: "FourNumberPracticeToCompose", sender: nil)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FourNumberPracticeToCompose" {
            let composeVC = segue.destination as! ComposeViewController
            composeVC.counter = counter
            composeVC.numberSeriesString = randomNumberSeries
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
