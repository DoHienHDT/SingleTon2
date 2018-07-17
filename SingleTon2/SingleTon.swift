//
//  SingleTon.swift
//  SingleTon2
//
//  Created by dohien on 6/4/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import Foundation
class SingleTon {
    static let instance: SingleTon = SingleTon()
    private var _numbers : [Int]?
    var numbers : [Int] {
        get {
            if _numbers == nil {
                upDateData()
            }
            return _numbers ?? []
        }
        set {
            _numbers = newValue
        }
    }
    func upDateData() {
        _numbers = [1,6,5,4,2,3,9,7,8]
    }
    func edit(at index: Int, and number: Int) {
        _numbers?[index] = number
    }
    func addNew(number: Int) {
        _numbers?.append(number)
    }
    
}
