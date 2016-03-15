//
//  DataService.swift
//  Devslopes-Udemy
//
//  Created by Emmanuel Darmon on 15/03/2016.
//  Copyright © 2016 Emmanuel Darmon. All rights reserved.
//

import Foundation
import Firebase

class DataService {
    static let ds = DataService()

private var _REF_BASE = Firebase(url:"https://devslopes-udemy.firebaseio.com/")

var REF_BASE : Firebase {
    return _REF_BASE
    }
}