////
////  EditPhotoViewController.swift
////  FooodTr
////
////  Created by Anastasiya Osinskaya on 6/29/20.
////  Copyright © 2020 Anastasiya Osinskaya. All rights reserved.
////
//
import Foundation
import UIKit
import PhotoEditorSDK


class EditPhotoViewController: UIViewController, PhotoEditViewControllerDelegate {
   
    
    let cameraViewController = CameraViewController()

    override func viewDidLoad() {
          super.viewDidLoad()
         //cameraViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(cameraViewController, animated: true)
        //present(cameraViewController, animated: false, completion: nil)
       
         //cameraCotrol()
          self.title = "Edit"
          
      }
    
    func cameraCotrol(){
        
        cameraViewController.dataCompletionBlock = { [unowned cameraViewController] data in
          guard let data = data else {
            return
          }
           
          let photo = Photo(data: data)
          let photoEditViewController = PhotoEditViewController(photoAsset: photo)
          photoEditViewController.delegate = self
          cameraViewController.present(photoEditViewController, animated: false, completion: nil)
        }

        cameraViewController.completionBlock = { [unowned cameraViewController] image, _ in
          guard let image = image else {
            return
          }

          let photo = Photo(image: image)
          let photoEditViewController = PhotoEditViewController(photoAsset: photo)
          photoEditViewController.delegate = self

          cameraViewController.present(photoEditViewController, animated: false, completion: nil)
//        }
//
//        present(cameraViewController, animated: true, completion: nil)
//        let sampleImage = UIImage(named: "meal1")!
//        let photo = Photo(image: sampleImage)
//
//        let photoEditViewController = PhotoEditViewController(photoAsset: photo)
//        photoEditViewController.delegate = self
//
//        present(photoEditViewController, animated: true, completion: nil)
//
        }}
        
 
    
    @IBAction func saveEdit(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }


  func photoEditViewController(_ photoEditViewController: PhotoEditViewController, didSave image: UIImage, and data: Data) {
    if let navigationController = photoEditViewController.navigationController {
      navigationController.popToRootViewController(animated: true)
    } else {
        photoEditViewController.dismiss(animated: true, completion: nil)
     // dismiss(animated: true, completion: nil)
    }
    }
  func photoEditViewControllerDidFailToGeneratePhoto(_ photoEditViewController: PhotoEditViewController) {
    if let navigationController = photoEditViewController.navigationController {
      navigationController.popViewController(animated: true)
    } else {
      dismiss(animated: true, completion: nil)
    }
  }

  func photoEditViewControllerDidCancel(_ photoEditViewController: PhotoEditViewController) {
    if let navigationController = photoEditViewController.navigationController {
      navigationController.popViewController(animated: true)
    } else {
      dismiss(animated: true, completion: nil)
    }
  }

}

