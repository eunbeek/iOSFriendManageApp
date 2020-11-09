//
//  FriendAdd.swift
//  Midterm_Test
//
//  Created by Rania Arbash on 2020-11-06.
//  Copyright © 2020 Rania Arbash. All rights reserved.
//

import UIKit
// EK : This controller is used to add new friend

// EK : Protocol called with the function in FriendList
protocol addFriendDelegateProtocol{
    func addFinishWithFriendObject(newFD : Friend)
}

class FriendAdd: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // EK : Protocol defined in FriendAdd
    var delegate : addFriendDelegateProtocol?
    
    // EK : TextField to input data
    @IBOutlet weak var lNameField : UITextField!
    @IBOutlet weak var fNameField : UITextField!
    @IBOutlet weak var gndField : UITextField!
    @IBOutlet weak var ctyField : UITextField!
    // EK : ImageViewField
    @IBOutlet weak var pickedPhoto : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickedPhoto.image = UIImage.init(named: "pic")
    }
    
    // EK : Save New Data
    @IBAction func savedData(_ sender : Any)
    {
        let lName = lNameField.text!
        let fName = fNameField.text!
        let gnd = gndField.text!
        let cty = ctyField.text!
        
        // EK : Check empty field
        if lName != "" && fName != "" && gnd !=  "" && cty != "" && pickedPhoto.image != nil
        {
            // EK : Created temp new friend obj
            var tempFriend = Friend(lName: lName, fName: fName, gnd: gnd, cty: cty, img : pickedPhoto.image!)
            
            if let myDelegat = delegate{
                // EK : All fields are validate, Ask save or not with alert
                let alert = UIAlertController(title:"Save New Friend?", message: nil, preferredStyle: .alert)
                
                // EK : This action is saving data with protocol and back to previous scene
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in
                  myDelegat.addFinishWithFriendObject(newFD: tempFriend)
                  self.navigationController?.popViewController(animated: true)}))
                
                // EK : This action keep the present scene
                alert.addAction(UIAlertAction(title:"Cancel", style:.default, handler:{_ in }))
                
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        else{
            // EK : Alert when fields are empty
            showAlert()
        }

    }

    
    func showAlert()
    {
        // EK : This action keep field and be in the present scene
        let defaultAction = UIAlertAction(title: "Keep Field", style: .default, handler: {(action) in
        })
        // EK : This action move back to previous scene
        let cancelAction = UIAlertAction(title: "Form Cancel", style: .cancel, handler: {(action) in
            self.navigationController?.popViewController(animated: true)
        })
        
        let alert = UIAlertController(title: "Missing Field", message:"Please Fill all field properly", preferredStyle: .actionSheet)
        
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }

    // EK : Back to previous scene with Cancel button on bar
    @IBAction func canceledForm(_ sender : Any)
    {
        navigationController?.popViewController(animated: true)
    }

    // EK : Closed Keyboard when touched out of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Ek : Alert to select Camera or PhotoLibrary as sourceType
    @IBAction func getPhoto(_ sender: UIButton)
    {
        let alert = UIAlertController(title:"Choose SourceType", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {_ in self.openCamera()}))
        alert.addAction(UIAlertAction(title:"Gallery", style:.default, handler:{_ in self.openGallery()}))
        
        self.present(alert, animated: true, completion: nil)

    }
    
    // EK : When clicking camera, this function set the input image by capturing
    func openCamera()
    {
        let c = UIImagePickerController()
        c.sourceType =  UIImagePickerController.SourceType.camera
        c.delegate = self
        c.allowsEditing = false
        self.present(c, animated: true, completion: nil)
    }
    
    // EK : When Clicking Gallery, this function set the input image in library
    func openGallery()
    {
        let c = UIImagePickerController()
        c.sourceType =  UIImagePickerController.SourceType.photoLibrary
        c.delegate = self
        c.allowsEditing = false
        self.present(c, animated: true, completion: nil)
    }
    
    // EK : This Function to pick one picture and stord in variable
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage
        {
            pickedPhoto.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    // EK : This function is for Cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

}
