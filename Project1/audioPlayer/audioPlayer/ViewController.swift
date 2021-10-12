//
//  ViewController.swift
//  audioPlayer
//
//  Created by Riley Meere on 9/28/21.
//  Code sourced from iOS Academy (link: https://www.youtube.com/watch?v=2kflmGGMBOA)
//

import AVFoundation
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var playButton: UIButton!
    var player: AVAudioPlayer?
    
    @IBAction func pressButton(_ sender: UIButton) {
        if let player = player, player.isPlaying {
            // stop playback
            player.stop()
        }
        else {
            // set up player and play
            
            // assign url string to audio file
            let urlString = Bundle.main.path(forResource: "Kody-loop", ofType: "wav")
            
            do {
                
                // global properties for AV audio session
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                // unwrap url string
                guard let urlString = urlString else {
                    return
                }
                
                // create and instantiate AV audio player
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                // unwrap player to ensure it was created properly
                guard let player = player else {
                    return
                }
                
                // call player function
                player.play()
            }
            catch {
                print("something went wrong")
            }
        }
    }
    
}

