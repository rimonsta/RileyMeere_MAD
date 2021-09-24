//
//  ViewController.swift
//  Story Time
//
//  Created by Riley Meere on 9/24/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var storyNav: UISegmentedControl!
    @IBOutlet weak var evilLabel: UILabel!
    @IBOutlet weak var evilSwitch: UISwitch!
    @IBOutlet weak var fontLabel: UILabel!
    @IBOutlet weak var fontValueLabel: UILabel!
    
    let happyStory = ["hello, dino ;)", "which way will you go?", "hello, sunshine :)"]
    let evilStory = ["YOU LOOK LIKE LUNCH ;)", "CHOOSE YOUR FATE", "BEWARE THE GLARE :)"]
    
    @IBAction func changeStory(_ sender: UISegmentedControl) {
        let storyIndex = sender.selectedSegmentIndex
        var storyText: String
        if evilSwitch.isOn {
            storyText = evilStory[storyIndex]
        }
        else {
            storyText = happyStory[storyIndex]
        }
        storyLabel.text = storyText
        if storyIndex == 0 {
            storyImage.image = UIImage(named: "creepyDino")
        }
        if storyIndex == 1 {
            storyImage.image = UIImage(named: "creepyField")
        }
        if storyIndex == 2 {
            storyImage.image = UIImage(named: "creepySun")
        }
    }
    
    @IBAction func evilMode(_ sender: UISwitch) {
        let storyIndex = storyNav.selectedSegmentIndex
        if sender.isOn {
            view.backgroundColor = .black
            titleLabel.text = titleLabel.text?.uppercased()
            titleLabel.textColor = .white
            storyLabel.textColor = .white
            storyLabel.text = evilStory[storyIndex]
            evilLabel.textColor = .white
            fontLabel.textColor = .white
            fontValueLabel.textColor = .white
        }
        else {
            view.backgroundColor = .white
            titleLabel.text = titleLabel.text?.lowercased()
            titleLabel.textColor = .black
            storyLabel.textColor = .black
            storyLabel.text = happyStory[storyIndex]
            evilLabel.textColor = .black
            fontLabel.textColor = .black
            fontValueLabel.textColor = .black
        }
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize = sender.value
        fontValueLabel.text = String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        storyLabel.font = UIFont.systemFont(ofSize: fontSizeCGFloat)
    }
    

}

