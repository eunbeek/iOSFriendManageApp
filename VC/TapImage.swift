//
//  TapImage.swift
//  Midterm_Test
//
//  Created by user182260 on 11/6/20.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit

class TapImage: UIImageView {
  
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setTapImage()
    }
    
    required init?(coder: NSCoder)
    {
        super.init(coder: coder)
        setTapImage()
    }
    
    // EK : TapGesture set up
    func setTapImage()
    {    
        let tapDouble = UITapGestureRecognizer(target:self, action: #selector(self.tapDoubleHandler))
        tapDouble.numberOfTapsRequired = 2
        self.addGestureRecognizer(tapDouble)
    }
    
    // EK : Double Tap Handler
    @objc func tapDoubleHandler()
    {
        // EK : Double Tab, the image frame will be bigger 
        let shapeNewFrame = CGRect(x: self.frame.origin.x, y : self.frame.origin.y, width : self.frame.width * 1.15, height: self.frame.height * 1.15)
        self.frame = shapeNewFrame
    }
}
