//
//  Character.swift
//  OOP Dual
//
//  Created by Craig Newcomb on 5/6/16.
//  Copyright © 2016 CraigNewcomb. All rights reserved.
//

import Foundation

class Character {
    
    private var _name: String = "Player X"
    private var _hp: Int = 20
    private var _attackPower: Int = 1
    
    
    var name: String {
        get {
            return  _name
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }

    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var isAlive: Bool {
        get {
            
            if hp <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    
    init(characterName: String, health: Int, attackStrength: Int) {
        self._name = characterName
        self._hp = health
        self._attackPower = attackStrength
    }
    
    
    // things in the class that apply to both: attack, stunnedState, and isAlive. We want the attack button to drain HP from the opposite player, and then disable their attack button for 3 seconds.
    
    // attack: "If my button is pressed, drain health from the other player"
    // stunned: "If I was just attacked, I am stunned and can't attack for 3 seconds"
        //Proposed stun method: make a timer that sets that person's attack to 0 for 3 seconds, effectively disabling their attack
        // Use NSTimer to wait and call resetAttack() after 3 seconds
    // isAlive: "If my health is equal to or less than 0, I am dead and the game ends, declaring the other a winner
    
    func takeDamage(opponentPersonAttackPower: Int) {
        self._hp -= opponentPersonAttackPower
    }
    
    func stunnedAttackPower() {
        self._attackPower = 0
    }
    
    func resetAttackPower() {
        self._attackPower = 1
    }

    
}