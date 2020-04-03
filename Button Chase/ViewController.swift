//
//  ViewController.swift
//  Button Chase
//
//  Created by John Gallaugher on 4/3/20.
//  Copyright © 2020 John Gallaugher. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var tapMeButton: UIButton!
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound(name: String) {
        if let sound = NSDataAsset(name: name) {
            do {
                audioPlayer = try AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("😡 ERROR: Could not play sound named: \(name)")
            }
        } else {
            print("😡 ERROR: Couldn't load data from \(name)")
        }
    }

    @IBAction func buttonTouched(_ sender: UIButton) {
        let safeAreaFrame = self.view.safeAreaLayoutGuide.layoutFrame
        let randomX = CGFloat.random(in: 0...(self.view.frame.width-tapMeButton.frame.width))
        let randomY = CGFloat.random(in: safeAreaFrame.origin.y...(self.view.frame.height-tapMeButton.frame.height))
        UIView.animate(withDuration: 0.3, animations: {self.tapMeButton.frame.origin = CGPoint(x: randomX, y: randomY)})
        playSound(name: "chuckle")
    }
}

