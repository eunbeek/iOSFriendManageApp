//
//  Friend.swift
//  Midterm_Test
//
//  Created by user182260 on 11/6/20.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//
// EK : This class is used as basic object
import Foundation
import UIKit

class Friend
{
    // EK :  private variable
    private var lastName : String = ""
    private var firstName : String = ""
    private var gender : String = ""
    private var city : String = ""
    private var picture : UIImage?
    
    // EK : initialize Friend when defining
    init(lName : String, fName : String, gnd : String, cty : String, img : UIImage)
    {
        setLastName(value: lName)
        setFirstName(value : fName)
        setGender(value: gnd)
        setCity(value: cty)
        setImage(value: img)
    }
    
    // EK : To access the private variable by these function
    func getLastName()->String
    {
        return lastName
    }
    
    func setLastName(value : String)
    {
        lastName = value
    }
    
    func getFirstName()->String
    {
        return firstName
    }
    
    func setFirstName(value : String)
    {
        firstName = value
    }
    
    func getGender()->String
    {
        return gender
    }
    
    func setGender(value : String)
    {
        gender = value
    }
    
    func getCity()->String
    {
        return city
    }
    
    func setCity(value : String)
    {
        city = value
    }
    func getImage()->UIImage
    {
        return picture!
    }
    
    func setImage(value : UIImage)
    {
        picture = value
    }
}
