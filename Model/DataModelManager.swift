//
//  DataModelManager.swift
//  Midterm_Test
//
//  Created by Rania Arbash on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import Foundation
import UIKit
class DataModelManager
{
    // EK : Array of Friend
    var friendList = [Friend]()
    
    // EK : insert new friend object to list
    func insertFriend(newFD : Friend)
    {
        friendList.append(newFD)
        
        // EK : Sorted the list of friend.
        let sortedList = friendList.sorted(by:{$0.getLastName() < $1.getLastName()})
        friendList = sortedList
    }
    
}
