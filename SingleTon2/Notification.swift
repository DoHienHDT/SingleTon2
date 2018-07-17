//
//  Notification.swift
//  SingleTon2
//
//  Created by dohien on 6/5/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import Foundation
class DataModel {
    static var shareInstance = DataModel()
    private init(){}
    private (set) var data: String? {
        didSet{
            NotificationCenter.default.post(name: Notification.Name(rawValue: da))
        }
    }
}
