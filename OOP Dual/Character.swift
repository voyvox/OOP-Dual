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
    
    
    func takeDamage(opponentPersonAttackPower: Int) {
        self._hp -= opponentPersonAttackPower
    }
    
   

    
}