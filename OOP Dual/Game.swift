//
//  Game.swift
//  OOP Dual
//
//  Created by Craig Newcomb on 5/10/16.
//  Copyright © 2016 CraigNewcomb. All rights reserved.
//

import Foundation

class Game: NSObject {
    private var _player1: Character!
    private var _player2: Character!
    private var _vc: ViewController
    
    init(player1: Character, player2: Character, vc: ViewController) {
        self._player1 = player1
        self._player2 = player2
        self._vc = vc
    }
    
    func restartGame() {
        self._vc.startGame()
    }
    
    func updateMessageLabel(message: String) {
        self._vc.messageLabel.text = message
    }
    
    func updateHp(player: Character) {
        if !player.isAlive {
            self.updateMessageLabel("\(player.name) died and lost!")
            _vc.rematchButton.hidden = false
            if !_vc.player1.isAlive {
                _vc.player1HpLabel.text = "0 HP"
            } else {
                _vc.player2HpLabel.text = "0 HP"
            }
            
        } else {
            self._vc.player1HpLabel.text = "\(_player1.hp) HP"
            self._vc.player2HpLabel.text = "\(_player2.hp) HP"
        }
    }
    
    func disableAttack() {
        self._vc.attackButton1.enabled = false
        self._vc.attackButton2.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(0.75, target: self, selector: #selector(Game.enableAttack), userInfo: nil, repeats: false)
    }
    
    func enableAttack() {
        self._vc.attackButton1.enabled = true
        self._vc.attackButton2.enabled = true
    }
}
