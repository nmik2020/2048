//
//  InterfaceController.swift
//  BitWatch WatchKit Extension
//
//  Created by Nidal Ilyas on 1/4/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import WatchKit
import Foundation

class tile {
    let value: Int
    let hasValue: Bool
    init(newValue:Int, newBool:Bool)
    {
        self.value = newValue
        self.hasValue = newBool
    }
   

};
var tileValues = [tile](count: 9, repeatedValue: tile(newValue: 0,newBool: false))
var collectionOfButtons: Array<WKInterfaceButton> = []
class InterfaceController: WKInterfaceController {
    

    @IBOutlet weak var button1: WKInterfaceButton!
    @IBOutlet weak var button2: WKInterfaceButton!
    @IBOutlet weak var button3: WKInterfaceButton!
    @IBOutlet weak var button4: WKInterfaceButton!
    @IBOutlet weak var button5: WKInterfaceButton!
    @IBOutlet weak var button6: WKInterfaceButton!
    @IBOutlet weak var button7: WKInterfaceButton!
    @IBOutlet weak var button8: WKInterfaceButton!
    @IBOutlet weak var button9: WKInterfaceButton!

    
    @IBAction func bottomSwipe()
    {
        
        for var index = 8; index >= 0 ; --index
        {
            //Check for the adjacent tiles
            if(index > 2)
            {
                if (tileValues[index].value == tileValues[index-3].value && tileValues[index].value != 0)
                {
                
                    tileValues[index] = tile(newValue: 2*tileValues[index].value,newBool: true)
                    var newValue:String? = String(2*tileValues[index].value)
                    if(newValue == "0") {
                        collectionOfButtons[index].setTitle("")
                    }else {
                        collectionOfButtons[index].setTitle(newValue)
                    }
                }
            }else if(index < 3){
                //Check if there are any tiles in between
                if(tileValues[index+3].value == 0 && (tileValues[index].value == tileValues[index + 6].value ))
                {
                    var newValue:String? = String(2*tileValues[index].value)

                    tileValues[index + 6] = tile(newValue: 2*tileValues[index].value,newBool: true)
                    tileValues[index] = tile(newValue: 0,newBool: true)

                    if(newValue == "0") {
                        collectionOfButtons[index+6].setTitle("")
                    }else {
                        collectionOfButtons[index+6].setTitle(newValue)
                    }
                    collectionOfButtons[index].setTitle("")
                    
                }else if((tileValues[index].value + tileValues[index + 3].value  == 0) || (tileValues[index].value + tileValues[index + 6].value  == 0) || (tileValues[index + 6].value + tileValues[index + 3].value  == 0))
                {
                    var result: Int = tileValues[index].value + tileValues[index + 6].value + tileValues[index + 3].value
                    var newValue:String? = String(result)
                    
                    tileValues[index + 6] = tile(newValue: result,newBool: true)
                    tileValues[index + 3] = tile(newValue: 0,newBool: true)
                    tileValues[index] = tile(newValue: 0,newBool: true)
                    
                    if(newValue == "0") {
                        collectionOfButtons[index + 6].setTitle("")
                    }else {
                        collectionOfButtons[index + 6].setTitle(newValue)
                    }
                    collectionOfButtons[index].setTitle("")
                    collectionOfButtons[index + 3].setTitle("")
                    
                }

                
            }
        }

        
        
        
    }
    @IBAction func topSwipe(sender:WKInterfaceButton)
    {

        for var index = 0; index < 6; ++index
        {
            //Check for the adjacent tiles
            if (tileValues[index].value == tileValues[index+3].value && tileValues[index].value != 0)
            {
                
                tileValues[index] = tile(newValue: 2*tileValues[index].value,newBool: true)
                var newValue:String? = String(tileValues[index].value)
                if(newValue == "0") {
                    collectionOfButtons[index].setTitle("")
                }else {
                collectionOfButtons[index].setTitle(newValue)
                }
            }else if(index < 3){
                //Check if there are any tiles in between
                if(tileValues[index+3].value == 0 && (tileValues[index].value == tileValues[index + 6].value ))
                {
                    var newValue:String? = String(tileValues[index].value)
                    tileValues[index] = tile(newValue: 2*tileValues[index].value,newBool: true)
                    tileValues[index + 6] = tile(newValue: 0,newBool: true)

                    if(newValue == "0") {
                        collectionOfButtons[index].setTitle("")
                    }else {
                    collectionOfButtons[index].setTitle(newValue)
                    }
                    collectionOfButtons[index + 6].setTitle("")
                }else if((tileValues[index].value + tileValues[index + 3].value  == 0) || (tileValues[index].value + tileValues[index + 6].value  == 0) || (tileValues[index + 6].value + tileValues[index + 3].value  == 0))
                {
                    var result: Int = tileValues[index].value + tileValues[index + 6].value + tileValues[index + 3].value
                    var newValue:String? = String(result)
                    
                    tileValues[index] = tile(newValue:result,newBool: true)
                    tileValues[index + 3] = tile(newValue: 0,newBool: true)
                    tileValues[index + 6] = tile(newValue: 0,newBool: true)

                    if(newValue == "0") {
                        collectionOfButtons[index].setTitle("")
                    }else {
                        collectionOfButtons[index].setTitle(newValue)
                    }
                    collectionOfButtons[index + 6].setTitle("")
                    collectionOfButtons[index + 3].setTitle("")

                }
                
            }
        }
    }
    @IBAction func rightSwipe()
    {
    
    }
    
    @IBAction func leftSwipe()
    {
        
        
        
    }
 

    private func update()
    {
        
    }
    
    override func willActivate()
    {
        collectionOfButtons = [button1, button2, button3, button4, button5, button6, button7, button8, button9]
        super.willActivate()
        let number:Int = 2
        tileValues[6] = tile(newValue: number,newBool: true)
        tileValues[0] = tile(newValue: number,newBool: true)
        
        //update();
        NSLog("%@ will activate",self)
    }

    override func didDeactivate()
    {
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }

}
