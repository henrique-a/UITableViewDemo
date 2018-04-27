//
//  NewContactController.swift
//  Contatos
//
//  Created by Ada 2018 on 26/04/18.
//  Copyright © 2018 Academy. All rights reserved.
//

import UIKit

class NewContactController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    
    @IBOutlet weak var getImage: UIButton!
    
    var delegate: NewContactDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.bringSubview(toFront: getImage)
        
        profile.layer.masksToBounds = false
        profile.layer.cornerRadius = profile.frame.size.width/2
        profile.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveContact(_ sender: UIBarButtonItem) {
        let photo = self.profile.image
        let name = self.name.text
        let phone = self.phone.text
        
        if let delegate = self.delegate {
            delegate.addContact(name: name!, phone: phone!, photo: photo!)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseImage(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
        
//        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
//
//        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in self.present(imagePicker, animated: true, completion: nil)}))
//
//        actionSheet.addAction(UIAlertAction(title: "Galeria", style: .default, handler: { (action:UIAlertAction) in self.present(imagePicker, animated: true, completion: nil)}))
//
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        self.present(actionSheet, animated: true, completion: nil)
//
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        profile.image = image
        picker.dismiss(animated: true, completion: nil)
        getImage.removeFromSuperview()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol NewContactDelegate {
    func addContact(name: String, phone: String, photo: UIImage)
}
