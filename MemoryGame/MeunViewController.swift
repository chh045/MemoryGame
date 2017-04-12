//
//  MeunViewController.swift
//  MemoryGame
//
//  Created by Huang Edison on 4/11/17.
//  Copyright © 2017 Edison. All rights reserved.
//

import UIKit

class MeunViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTapTwoNumberPractice(_ sender: Any) {
        performSegue(withIdentifier: "MeunToTwoNumberPracticeMode", sender: nil)
    }
    
    @IBAction func onTapFourNumberPractice(_ sender: Any) {
        performSegue(withIdentifier: "MeunToFourNumberPracticeMode", sender: nil)
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
