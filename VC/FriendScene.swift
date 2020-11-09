//
//  FriendScene.swift
//  Midterm_Test
//
//  Created by Rania Arbash on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

class FriendScene: UIViewController {
    // EK : To get selected value from FriendList
    var detailView : Friend?
    
    // EK : Component to set the value
    @IBOutlet weak var fName : UILabel!
    @IBOutlet weak var lName : UILabel!
    @IBOutlet weak var gender : UILabel!
    @IBOutlet weak var city : UILabel!
    @IBOutlet weak var pic : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // EK : Simply setting the value
        fName.text = detailView?.getFirstName()
        lName.text = detailView?.getLastName()
        gender.text = detailView?.getGender()
        city.text = detailView?.getCity()
        pic.image = detailView?.getImage()
         
    }
}
