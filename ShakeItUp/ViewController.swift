//
//  ViewController.swift
//  ShakeItUp
//
//  Created by Charles Martin Reed on 9/17/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //MARK:- Sound FX array
    var sounds = ["sound1", "sound2", "sound3", "sound4", "sound5", "sound6", "sound7", "sound8", "sound9", "sound10", "sound11", "sound12", "sound13"]
    var soundPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            print("Motion detected")
            playRandomSound()
        }
    }
    
    func playRandomSound() {
        //generate the random number
        let soundNumber = Int(arc4random_uniform(UInt32(sounds.count)))
        print(soundNumber)
        
        //try to find a sound at in the bundle path
        if let soundPath = Bundle.main.path(forResource: sounds[soundNumber], ofType: "wav") {
            //play the file at the path in the audio player
            do {
                try soundPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath))
            } catch {
                print("could not play sound")
                return
            }
        }
        
        soundPlayer.play()
        
        
        
    }


}

