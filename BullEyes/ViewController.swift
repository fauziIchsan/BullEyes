//
//  ViewController.swift
//  BullEyes
//
//  Created by Achmad Ichsan Fauzi on 08/11/17.
//  Copyright © 2017 Ichsan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 50
    var targetValue = 0
    var score = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = 50
        targetValue = lroundf(slider.value)
        startNewRound()
    }
    
    func updateLabel() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func ShowAlert() {
        let difference = abs(currentValue-targetValue)
        let points = 100 - difference
        
        score += points
        
        let message = "your slider number is : \(currentValue)" +
        "\n The target value is: \(targetValue)" +
        "\n Your point is: \(points )"
        
        let alert = UIAlertController(title: "Who's There!?", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "....", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
}
