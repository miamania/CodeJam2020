//
//  WordViewController.swift
//  AppMashiMashi
//
//  Created by Mia Berthier on 2020-11-14.
//

import UIKit
import Photos
import FirebaseStorage
import Firebase

class WordViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var imagePickerController = UIImagePickerController()

    var wordFromChose:String = ""
    var charFromChose:String = ""
    var result:String = "success"
    
    @IBOutlet weak var WordLabel: UILabel!
    @IBOutlet weak var CharImage: UIImageView!
    @IBOutlet weak var ChangableButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        WordLabel.text = wordFromChose
        CharImage.image = UIImage(named: charFromChose)
        
        imagePickerController.delegate = self
        
        checkPermissions()
        
        if (CharImage.image == UIImage(named: "ErrorCharacterUnknown.png")){
            result = "fail"
        }
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let futureVC : SuccessViewController = segue.destination as! SuccessViewController
        futureVC.wordFromWord = result
    }
    @IBAction func camButtonTapped(_ sender: Any) {
        self.imagePickerController.sourceType = .photoLibrary
        self.present(self.imagePickerController, animated: true, completion: nil)
    }
    
    func checkPermissions(){
        if PHPhotoLibrary.authorizationStatus() != PHAuthorizationStatus.authorized{
            PHPhotoLibrary.requestAuthorization({ (status: PHAuthorizationStatus) -> Void in
                ()
            })
        }
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized{
        } else{
            PHPhotoLibrary.requestAuthorization(requestAuthorizationHandler)
        }
    }
    func requestAuthorizationHandler(status: PHAuthorizationStatus){
        if PHPhotoLibrary.authorizationStatus() == PHAuthorizationStatus.authorized{
            print("We have access to photos")
        } else{
            print("We do not have access to photos")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL{
            print(url)
            uploadToCloud(fileURL: url)
        }
        imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    func uploadToCloud(fileURL : URL){
        let storage = Storage.storage()
        let data = Data()
        let storageref = storage.reference()
        let localFile = fileURL
        let photoref = storageref.child("uploadedFile1")
        let uploadTask = photoref.putFile(from: localFile, metadata: nil) { (metadata, err) in
            guard let metadata = metadata else{
                print(err?.localizedDescription)
                return
            }
            print("Photo Uploaded")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
