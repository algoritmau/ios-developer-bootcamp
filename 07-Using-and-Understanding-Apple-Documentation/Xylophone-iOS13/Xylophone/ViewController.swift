//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Modified by Mauricio Paternina on 12/08/2022.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  var player: AVAudioPlayer?

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func keyPressed(_ sender: UIButton) {
    let note = sender.currentTitle!
    
    sender.alpha = 0.56
    
    playSound(forNote: note)
    
    // Delay button's opacity restoration by 0.2s
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
      sender.alpha = 1.0
    }
  }
  
  func playSound(forNote note: String) {
    guard let audioFileURL = Bundle.main.url(forResource: note, withExtension: "wav") else { return }
        
    do {
      let session = AVAudioSession.sharedInstance()
      
      try session.setCategory(
        AVAudioSession.Category.playback,
        mode: AVAudioSession.Mode.default
      )
      
      try session.setActive(true)
      
      // Required for the player to work on iOS 11
      player = try AVAudioPlayer(contentsOf: audioFileURL, fileTypeHint: AVFileType.wav.rawValue)
      
      // Required for the player to work on iOS 10 and earlier
      guard let player = player else { return }
      
      player.play()
    } catch let error {
      print(error.localizedDescription)
    }
  }
}
