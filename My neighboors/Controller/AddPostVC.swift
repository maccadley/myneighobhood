//
//  AddPostVC.swift
//  My neighboors
//
//  Created by Admin on 18.07.2018.
//  Copyright © 2018 MaximMasov. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    //Outlets
    
    @IBOutlet weak var titleFiels: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var postImg: UIImageView!
    
    var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        postImg.layer.cornerRadius = 120
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
    }

    
    // Buttons
    @IBAction func addPicBtnPressed(_ sender: UIButton){
        sender.setTitle("", for: .normal)
        present(imagePicker, animated: true, completion: nil)
        
    }
   
    @IBAction func makePostBtnPressed(_ sender: UIButton){
        if let title = titleFiels.text, let desc = descField.text, let img = postImg.image{
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            let post = Post(imagePath: imgPath, title: title, description: desc)
            DataService.instance.addPost(post: post)
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    // Functions
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagePicker.dismiss(animated: true, completion: nil)
        postImg.image = selectedImage
    }

}
