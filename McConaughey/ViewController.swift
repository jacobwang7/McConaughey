//
//  ViewController.swift
//  McConaughey
//
//  Created by Jacob Wang on 3/8/21.
//

import UIKit
import AVFoundation

var audioPlayer: AVAudioPlayer!

class ViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "\(Int(stepper.value))"
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        numberLabel.text = "\(Int(stepper.value))"
    }
    
    
    @IBAction func tellMeButton(_ sender: UIButton) {
        playSound(name: "alright", numberOfloops: Int(stepper.value))
    }
    
}

func playSound(name: String, numberOfloops: Int) {
    if let sound = NSDataAsset(name: name) {
        do {
            try audioPlayer = AVAudioPlayer(data: sound.data)
            audioPlayer.numberOfLoops = numberOfloops - 1
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) Could not initialize AVAudioPlayer object.")
        }
    } else {
        print("😡 ERROR: Could not read data from file sound0")
    }
}
