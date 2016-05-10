//
//  ViewController.swift
//  OOP Dual
//
//  Created by Craig Newcomb on 5/6/16.
//  Copyright © 2016 CraigNewcomb. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var attackButton1: UIButton!
    
    @IBOutlet weak var attackButton2: UIButton!
    
    @IBOutlet weak var rematchButton: UIButton!
    
    @IBOutlet weak var player1HpLabel: UILabel!
    
    @IBOutlet weak var player2HpLabel: UILabel!
    
    
    var player1: Character!
    var player2: Character!
    var game: Game!
    var hp: Int! = 20
    var attackPower: Int! = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startGame()
    }

    func startGame() {
        player1HpLabel.text = "\(hp) HP"
        player2HpLabel.text = "\(hp) HP"
        
        rematchButton.hidden = true
        
        player1 = Character(characterName: "Player 1", health: hp, attackStrength: attackPower)
        player2 = Character(characterName: "Player 2", health: hp, attackStrength: attackPower)
        
        game = Game(player1: player1, player2: player2, vc: self)
        
        messageLabel.text = "Begin Fight! Good Luck!"

    }
    
    
    @IBAction func attackPressed(sender: UIButton!) {
        if sender.tag == 1 {
            // player1 attacked, give damage to player 2
            
            player2.takeDamage(player1.attackPower)
            game.disableAttack()
            game.updateHp(player2)
            
            
        } else if sender.tag == 2 {
            //player2 attacked, give damage to player 1
            
            player1.takeDamage(player2.attackPower)
            game.disableAttack()
            game.updateHp(player1)
        }
            
    }

    @IBAction func rematchPressed(sender: UIButton!) {
        game.restartGame()
    }


}

