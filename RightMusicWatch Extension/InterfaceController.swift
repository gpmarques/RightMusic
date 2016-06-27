//
//  InterfaceController.swift
//  RightMusicWatch Extension
//
//  Created by Gabriel Bendia on 6/27/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var picker: WKInterfacePicker!
    @IBOutlet var button: WKInterfaceButton!
    
    var metronomeIsOn = false
    
    var timer: NSTimer!
    
    var tempo: NSTimeInterval = 40
    
    var tempoArray = Array(40...200)
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let pickerItems: [WKPickerItem] = tempoArray.map {
            
            let pickerItem = WKPickerItem()
            pickerItem.title = String($0)
            
            return pickerItem
            
        }
        
        picker.setItems(pickerItems)
    
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func startStop() {
        
        if metronomeIsOn == false {
            
            button.setTitle("Stop")
            
            picker.setEnabled(false)
            metronomeIsOn = true
            
            let metronomeTimeInterval:NSTimeInterval = 60.0 / tempo

            timer = NSTimer.scheduledTimerWithTimeInterval(metronomeTimeInterval, target: self, selector: #selector(playMetronomeSound), userInfo: nil, repeats: true)
            timer.fire()
            
        } else {
            
            button.setTitle("Start")
            timer.invalidate()
            picker.setEnabled(true)
            metronomeIsOn = false
            
        }
        
    }
    
    func playMetronomeSound() {
        let currentTime = CFAbsoluteTimeGetCurrent()
        print("Play metronome sound @ \(currentTime)")
        
        WKInterfaceDevice.currentDevice().playHaptic(.Click)
        
    }
    @IBAction func pickerChanged(value: Int) {
        
        tempo = NSTimeInterval(tempoArray[value])
        
    }

}
