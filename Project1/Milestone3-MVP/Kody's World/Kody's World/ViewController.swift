//
//  ViewController.swift
//  Kody's World
//
//  Created by Riley Meere on 9/16/21.
//

import UIKit
import MediaPlayer
import MobileCoreServices
import PencilKit

class ViewController: UIViewController {

    @IBOutlet weak var heart1: UIImageView!
    @IBOutlet weak var heart2: UIImageView!
    @IBOutlet weak var heart3: UIImageView!
    @IBOutlet weak var heart4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func animateHeartsUp(_ sender: UISwipeGestureRecognizer) {
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {self.heart1.alpha = 1.0}, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {self.heart2.alpha = 1.0}, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {self.heart3.alpha = 1.0}, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {self.heart4.alpha = 1.0}, completion: nil)
    }
    

}

