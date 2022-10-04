//
//  NewPlaceTableViewController.swift
//  My Places (with comments)
//
//  Created by Артём Тюрморезов on 03.10.2022.
//

import UIKit

class NewPlaceTableViewController: UITableViewController {
    
    
    @IBOutlet weak var imageOfPlace: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // MARK: - Если ячейка 0 индекс то выбрать фото, если нет то ничего
        if indexPath.row == 0 {
            
            let cameraPic = UIImage(imageLiteralResourceName: "camera")
        
            let photoPic = UIImage(imageLiteralResourceName: "photo")
            let action = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.setImage(source: .camera)
            }
            camera.setValue(cameraPic, forKey: "image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.setImage(source: .photoLibrary)
            }
            photo.setValue(photoPic, forKey: "image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            action.addAction(camera)
            action.addAction(photo)
            action.addAction(cancel)
            
            present(action, animated: true)
            
        }else {
            view.endEditing(true)
        }
    }
}

extension NewPlaceTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Работа с изображением

extension NewPlaceTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func setImage(source: UIImagePickerController.SourceType){
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePick = UIImagePickerController()
            imagePick.delegate = self
            imagePick.allowsEditing = true
            imagePick.sourceType = source
            
            present(imagePick, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageOfPlace.image = info[.editedImage] as? UIImage
        imageOfPlace.contentMode = .scaleAspectFill
        imageOfPlace.clipsToBounds = true
        dismiss(animated: true)
    }
}
