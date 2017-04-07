//
//  ViewController.swift
//  MemoryGame
//
//  Created by Huang Edison on 4/5/17.
//  Copyright © 2017 Edison. All rights reserved.
//
fileprivate let na : UInt32 = 999
import UIKit

class ViewController: UIViewController {

    @IBOutlet var gameView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var Choice1Button: UIButton!
    @IBOutlet weak var Choice2Button: UIButton!
    @IBOutlet weak var Choice3Button: UIButton!
    @IBOutlet weak var Choice4Button: UIButton!
    
    var RandomNum: Int!
    var randomList : [UInt32] = []
    var choiceList : [UInt32] = [na,na,na,na]
    var level = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ResultLabel.isHidden = true
        updateImage()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateImage(){
        generateRandomNumber()
        Choice1Button.setImage(UIImage(named: "\(choiceList[0])"), for: .normal)
        Choice1Button.imageView!.contentMode = .scaleAspectFit
        Choice2Button.setImage(UIImage(named: "\(choiceList[1])"), for: .normal)
        Choice2Button.imageView!.contentMode = .scaleAspectFit
        Choice3Button.setImage(UIImage(named: "\(choiceList[2])"), for: .normal)
        Choice3Button.imageView!.contentMode = .scaleAspectFit
        Choice4Button.setImage(UIImage(named: "\(choiceList[3])"), for: .normal)
        Choice4Button.imageView!.contentMode = .scaleAspectFit
        numberLabel.text = ConvertNum(num: choiceList[RandomNum])
    }
    
    func generateRandomNumber() {
        isLevelUp()
        choiceList = [na, na, na, na]
        var random = arc4random_uniform(110)
        while randomList.contains(random) {
            random = arc4random_uniform(110)
        }
        RandomNum = Int(arc4random_uniform(UInt32(4)))
        choiceList[RandomNum] = random
        while choiceList.contains(na) {
            random = arc4random_uniform(110)
            //print(random)
            if choiceList.contains(random) {
                continue
            }
            for i in 0..<4 {
                if choiceList[i] == na {
                    choiceList[i] = random
                    break
                }
            }
        }
        numberLabel.text = ConvertNum(num: choiceList[RandomNum])
        randomList.append(choiceList[RandomNum])
        //print(choiceList)
    }
    
    func isLevelUp(){
        if randomList.count == 110 {
            print(randomList)
            level += 1
            levelLabel.text = "level: \(level)"
            randomList = []
            gameView.isUserInteractionEnabled = false
            ResultLabel.textColor = UIColor.blue
            ResultLabel.text = "Congrats! Level up!"
            ResultLabel.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
                self.ResultLabel.isHidden = true
                self.gameView.isUserInteractionEnabled = true
            }
            
        }
    }
    
    func ConvertNum(num: UInt32) -> String{
        switch num {
        case 100:
            return "00"
        case 101:
            return "01"
        case 102:
            return "02"
        case 103:
            return "03"
        case 104:
            return "04"
        case 105:
            return "05"
        case 106:
            return "06"
        case 107:
            return "07"
        case 108:
            return "08"
        case 109:
            return "09"
        default:
            return "\(num)"
        }
    }
    
    func resultDisplay(index: Int) {
        ResultLabel.isHidden = false
        gameView.isUserInteractionEnabled = false
        if RandomNum == index {
            ResultLabel.textColor = UIColor.green
            ResultLabel.text = "Correct!"
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                self.ResultLabel.isHidden = true
                self.updateImage()
                self.gameView.isUserInteractionEnabled = true
            }
        }
        else {
            ResultLabel.textColor = UIColor.red
            ResultLabel.text = "Try again!"
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.8) {
                self.gameView.isUserInteractionEnabled = true
            }
        }
    }
    
    @IBAction func Choice1OnTap(_ sender: Any) {
        resultDisplay(index: 0)
    }
    
    @IBAction func Choice2OnTap(_ sender: Any) {
        resultDisplay(index: 1)
    }

    @IBAction func Choice3OnTap(_ sender: Any) {
        resultDisplay(index: 2)
    }

    @IBAction func Choice4OnTap(_ sender: Any) {
        resultDisplay(index: 3)
    }


}

