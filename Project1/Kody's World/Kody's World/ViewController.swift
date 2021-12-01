//
//  ViewController.swift
//  Kody's World
//
//  Created by Riley Meere on 9/16/21.
//

import UIKit
import AVFoundation
import MediaPlayer


// HOME VIEW
// contains swipe gesture recognizer
// resources: iOS Academy tutorial (tab bar with multiple views)
// link: https://www.youtube.com/watch?v=cAUgXCCnFNs
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // unwind segue from orginal view, identifier: "unwindHeart"
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {} // no data passed from heart view
    
} // END HOME VIEW


// HEART VIEW
// briefly overlays home view upon user swipe interaction
// resources: mobile app dev class (unwind segues); semicolon.com forum (timed segues)
// link: https://www.semicolonworld.com/question/76542/how-do-i-perform-an-auto-segue-in-xcode-6-using-swift
class HeartViewController: UIViewController {
    
    // heart overlay created on Keynote
    @IBOutlet weak var heartView: UIImageView!
    
    // set up timer to begin once view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1 second timer calls dismissHeart() upon completion
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(dismissHeart), userInfo: nil, repeats: false)
    }
    
    // unwind segue for heart view
    @objc func dismissHeart() {
        self.performSegue(withIdentifier: "unwindHeart", sender: self)
    }
    
} // END HEART VIEW


// MERCH VIEW
// this view doesn't do much yet
class MerchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
} // END MERCH VIEW


// GAME VIEW
// "rock or stick" minigame, plays Kody's song
// resources: iOS Academy (audio player); Stack Overflow forum (change button image)
// links: https://www.youtube.com/watch?v=2kflmGGMBOA ; https://stackoverflow.com/questions/59520262/change-button-when-audio-is-finished-xcode
class GameViewController: UIViewController, AVAudioPlayerDelegate {
    
    // image outlet declaration
    @IBOutlet weak var cowboyKodyView: UIImageView!
    // button outlet declarations
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var stickButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var audioButton: UIButton!
    // audio player optional declaration
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // action for any button which changes cowboyKodyView, image swap based on tag value
    @IBAction func chooseItem(_ sender: UIButton) {
        if sender.tag == 1 {
            cowboyKodyView.image = UIImage (named: "KodyRock")
        }
        if sender.tag == 2 {
            cowboyKodyView.image = UIImage (named: "KodyStick")
        }
        if sender.tag == 3 {
            cowboyKodyView.image = UIImage (named: "CowboyKody")
        }
    }
    
    // action for audio button
    @IBAction func playSound(_ sender: UIButton) {
        
        // unwrap player, check if audio is playing
        if let player = player, player.isPlaying {
            player.stop() // stop playback
            sender.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal) // change button image
        }
        else {
            // create url path to audio file
            let urlString = Bundle.main.path(forResource: "Kody-loop", ofType: "wav")
            // set up player and play
            do {
                // audio setup functions
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                // check that url path is not nil
                guard let urlString = urlString else {
                    return
                }
                // object from url path assigned to player
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                // check that player is not nil
                guard let player = player else {
                    return
                }
                // start playback
                player.play()
                // change button image
                sender.setImage(UIImage(systemName: "speaker.wave.2.fill"), for: .normal)
            }
            // catch for errors from object creation/unwrapping
            catch {
                print("something went wrong")
                
            }
        }
    }
    
    // change button image once playback ends
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        audioButton.setImage(UIImage(systemName: "speaker.slash.fill"),for: .normal)
    }
    
} // END GAME VIEW

