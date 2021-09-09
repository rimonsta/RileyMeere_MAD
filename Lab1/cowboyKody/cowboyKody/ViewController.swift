//
//  ViewController.swift
//  cowboyKody
//
//  Created by Riley Meere on 9/9/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var giftImage: UIImageView!
    @IBAction func chooseGift(_ sender: UIButton) {
        if sender.tag == 1  {
            giftImage.image = UIImage (named: "rocky")
        }
        if sender.tag == 2  {
            giftImage.image = UIImage (named: "sticky")
        }
        if sender.tag == 3 {
            giftImage.image = UIImage (named: "cowboykody")
        }
    }
    @IBOutlet weak var kodyMessage: UILabel!
    @IBAction func newMessage(_ sender: UIButton) {
        if sender.tag == 1 || sender.tag == 2 {
           kodyMessage.text = "YEE-HAW!!!!"
        }
        if sender.tag == 3 {
            kodyMessage.text = "HOWDY, PARTNER!"
        }
    }
    @IBOutlet weak var returnButton: UIButton!
    @IBAction func returnMessage(_ sender: UIButton) {
        if sender.tag == 1 || sender.tag == 2 {
            returnButton.setTitle("Bring me another gift!", for: .normal)
        }
        if sender.tag == 3 {
            returnButton.setTitle("What did ya bring for me?", for: .normal)
        }
    }

}

