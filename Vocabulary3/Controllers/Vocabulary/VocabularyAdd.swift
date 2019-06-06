//
//  VocabularyAdd.swift
//  Vocabulary3
//
//  Created by Сергей Косилов on 01/06/2019.
//  Copyright © 2019 Сергей Косилов. All rights reserved.
//

import UIKit

class VocabularyAdd: UITableViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageAddV: UIImageView!
    
    @IBOutlet weak var learningLabelAdd: UILabel!
    
    @IBOutlet weak var learningTextAdd: UITextField!
    
    
    @IBOutlet weak var nativeLabelAdd: UILabel!
    
    @IBOutlet weak var nativeTextAdd: UITextField!
    
    @IBOutlet weak var saveAddVoc: UIButton!
    
    @IBAction func saveBtnVocab(_ sender: UIButton) {
        if learningTextAdd.text == nil && nativeTextAdd.text != nil {
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        imageAddV.image = info[UIImagePickerController.InfoKey.init(rawValue: <#T##String#>)] as? UIImage
//        imageAddV.contentMode = .scaleAspectFill
//        imageAddV.clipsToBounds = true
//        dismiss(animated: true, completion: nil)
//    }

  

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let alertController = UIAlertController(title: NSLocalizedString("Источник фотографии", comment: "Источник фотографии"), message: nil, preferredStyle: .actionSheet)
            let cameraAction = UIAlertAction(title: NSLocalizedString("Камера", comment: "Камера"), style: .default, handler: { (action) in
                self.chooseImagePickerAction(source: .camera)
            })
            let photoLibAction = UIAlertAction(title: NSLocalizedString("Фото", comment: "Фото"), style: .default, handler: { (action) in
                self.chooseImagePickerAction(source: .photoLibrary)
            })
            let cancelAction = UIAlertAction(title: NSLocalizedString("Отмена", comment: "Отмена"), style: .cancel, handler: nil)
            alertController.addAction(cameraAction)
            alertController.addAction(photoLibAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func chooseImagePickerAction(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    
    
  
}
