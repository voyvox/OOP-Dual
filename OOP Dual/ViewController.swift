//
//  ViewController.swift
//  OOP Dual
//
//  Created by Craig Newcomb on 5/6/16.
//  Copyright © 2016 CraigNewcomb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var attackButton1: UIButton!
    
    @IBOutlet weak var attackButton2: UIButton!
    
    @IBOutlet weak var rematchButton: UIButton!
    
    var player1 = Character(characterName: "Player 1", health: 20, attackStrength: 1)
    var player2 = Character(characterName: "Player 2", health: 20, attackStrength: 1)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func attackButtonPressed(sender: UIButton!) {
        if sender.tag == 1 {
            player2.takeDamage(player1.attackPower)
            if player1.attackPower != 0 {
                player2.stunnedAttackPower()
            }
            
            messageLabel.text = "\(player1.name) attacked for \(player1.attackPower) HP!"
            //in 3 seconds... reset attack
            
            
        } else {
            
            player1.takeDamage(player2.attackPower)
            if player2.attackPower != 0 {
                player1.stunnedAttackPower()
            }
            
            messageLabel.text = "\(player2.name) attacked for \(player2.attackPower) HP!"
            // in 3 seconds... reset attack
        }
        
        
        if !player1.isAlive || !player2.isAlive {
            if player1.hp <= 0 {
                messageLabel.text = "\(player1.name) died! \(player2.name) wins!"
                
            rematchButton.hidden = false
                
            }
            
            else {
                
            messageLabel.text = "\(player2.name) died! \(player1.name) wins!"
            
            rematchButton.hidden = false
            
            }
        }
        
        
    }
    
    @IBAction func rematch(sender: AnyObject) {
        messageLabel.text = "Begin Fight!"
        // do rest of resetting. can't easily do playerX.hp = 20 etc because you made them get only variables.
    }
    

}

