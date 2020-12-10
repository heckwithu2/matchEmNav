//
//  ConfigVC.swift
//  RandomRectanglesNav
//
//  Created by Dale Haverstock on 11/19/20.
//  Copyright © 2020 Emanon. All rights reserved.
//

import UIKit

class ConfigVC: UIViewController {
    var gameSceneVC: GameSceneVC?
    
    @IBOutlet weak var rectAlpha: UISwitch!
    
    @IBOutlet weak var darkMode: UISwitch!
    @IBOutlet weak var drkModeText: UITextField!
    
    @IBOutlet weak var fixColor: UISwitch!
    
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var speedValue: UILabel!
    
    var sliderValueLabelMessage: String {
        return String(format: "%.1f", speedSlider.value / speedSlider.maximumValue * 100.0)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up a reference to the game scene
        gameSceneVC = self.navigationController?.viewControllers[0] as? GameSceneVC
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //init wwith proper states
        speedSetUp()
        redSetup()
        alphaSetup()
        darkSetup()
    }
    
    func redSetup() {
        var currentRed = gameSceneVC?.colorFix
        fixColor.setOn(currentRed!, animated: currentRed!)
    }
    
    func alphaSetup() {
        var currentAlpha = gameSceneVC?.randomAlpha
        rectAlpha.setOn(currentAlpha!, animated: currentAlpha!)
    }
    
    func darkSetup() {
        //get current state
        var currentDark = gameSceneVC?.mainDarkMode
        darkMode.setOn(currentDark!, animated: currentDark!)
        
        if (currentDark == true) {
            drkModeText.text = "Light Mode"
            gameSceneVC?.view.backgroundColor = UIColor.systemGray4
            self.view.backgroundColor = UIColor.systemGray4
            gameSceneVC?.mainDarkMode = true
            
        } else {
           
            drkModeText.text = "Dark Mode"
            gameSceneVC?.view.backgroundColor = UIColor.darkGray
            self.view.backgroundColor = UIColor.darkGray
            gameSceneVC?.mainDarkMode = false
        }
    }
    
    func speedSetUp() {
        // Speed slider range
        speedSlider.minimumValue = 0.4
        speedSlider.maximumValue = 3.0

        // Get the current speed
        let currentDelay = Float((gameSceneVC?.newRectInterval)!)
                                
        // Init the slider position from the game scene
        speedSlider.value = currentDelay
                                                        
        // Init the slider's value label, depends on slider.value
        speedValue.text = sliderValueLabelMessage
    }
    
    @IBAction func speedSlider(_ sender: UISlider) {
        // UPDATE THE SPEED IN THE GameSceneVC object
        gameSceneVC?.newRectInterval = TimeInterval(speedSlider.value)
                                
        // Update the slider's value label
        speedValue.text = sliderValueLabelMessage
    }
    
    
    @IBAction func fixColorRed(_ sender: UISwitch) {

        if ((sender as UISwitch).isOn == true) {
            gameSceneVC?.colorFix = false
        } else {
            gameSceneVC?.colorFix = true
        }

    }

    @IBAction func rectAlpha(_ sender: UISwitch) {
        if ((sender as UISwitch).isOn == true) {
            gameSceneVC?.randomAlpha = true
        } else {
            gameSceneVC?.randomAlpha = false
        }
    }
    
    
    
    
    @IBAction func darkMode(_ sender: UISwitch) {
        
        if ((sender as UISwitch).isOn == true) {
            drkModeText.text = "Light Mode"
            gameSceneVC?.view.backgroundColor = UIColor.systemGray4
            self.view.backgroundColor = UIColor.systemGray4
            gameSceneVC?.mainDarkMode = true
        }
        if ((sender as UISwitch).isOn == false) {
            drkModeText.text = "Dark Mode"
            gameSceneVC?.view.backgroundColor = UIColor.darkGray
            self.view.backgroundColor = UIColor.darkGray
            gameSceneVC?.mainDarkMode = false
        }
    }
    
}

