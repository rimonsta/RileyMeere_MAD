//
//  ViewController.swift
//  Kody's World
//
//  Created by Riley Meere on 9/16/21.
//

import UIKit
import AVFoundation
import MediaPlayer
import MobileCoreServices

class HeartViewController: UIViewController {
    
    @IBOutlet weak var heartView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //animateHeart()
        let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(dismissHeart), userInfo: nil, repeats: false)
 
        
        
    }
    
    @objc func dismissHeart() {
            self.performSegue(withIdentifier: "unwindHeart", sender: self)
    }
    
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {}
    
}


class MerchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

class audioPlayButton: UIButton {
    
}

class GameViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var stickButton: UIButton!
    @IBOutlet weak var cowboyKodyView: UIImageView!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var audioButton: UIButton!
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
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
    
    @IBAction func playSound(_ sender: UIButton) {
        
        if let player = player, player.isPlaying {
            player.stop()
            
            sender.setImage(UIImage(systemName: "speaker.slash.fill"), for: .normal)
        }
        else {
            
            let urlString = Bundle.main.path(forResource: "Kody-loop", ofType: "wav")
            
            do {
                
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    return
                }
                
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                
                guard let player = player else {
                    return
                }
                
                player.play()
                sender.setImage(UIImage(systemName: "speaker.wave.2.fill"), for: .normal)
            }
            
            catch {
                print("something went wrong")
            }
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        audioButton.setImage(UIImage(systemName: "speaker.slash.fill"),for: .normal)
    }
    
}

