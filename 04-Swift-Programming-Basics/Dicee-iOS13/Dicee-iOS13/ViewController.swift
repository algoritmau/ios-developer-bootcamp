//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019
//  Edited by Mauricio Paternina on 7/18/22
//  Copyright © 2019 London App Brewery. All rights reserved.

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var diceImageView1: UIImageView!
  @IBOutlet weak var diceImageView2: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
//    diceImageView2.image = #imageLiteral(resourceName: "DiceThree")
  }
  
  @IBAction func diceRollButton(_ sender: UIButton) {
    let dieValues = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    diceImageView1.image = dieValues.randomElement()
    diceImageView2.image = dieValues.randomElement()
  }
}
