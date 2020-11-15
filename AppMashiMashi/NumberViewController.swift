//
//  NumberViewController.swift
//  AppMashiMashi
//
//  Created by Mia Berthier on 2020-11-14.
//

import UIKit
import Photos
import FirebaseStorage
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class NumberViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePickerController = UIImagePickerController()

    @IBOutlet weak var RandomWord: UILabel!
    
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerController.delegate = self
        
        checkPermissions()
        
        
        let number = Int.random(in: 0...14)
        if (number == 0){
            RandomWord.text = "1"
        } else if (number == 1) {
            RandomWord.text = "2"
        } else if (number == 2) {
            RandomWord.text = "3"
        } else if (number == 3) {
            RandomWord.text = "4"
        } else if (number == 4) {
            RandomWord.text = "5"
        } else if (number == 5) {
            RandomWord.text = "6"
        } else if (number == 6) {
            RandomWord.text = "7"
        } else if (number == 7) {
            RandomWord.text = "8"
        } else if (number == 8) {
            RandomWord.text = "9"
        } else if (number == 9) {
            RandomWord.text = "10"
        } else if (number == 10) {
            RandomWord.text = "0"
        } else if (number == 11) {
            RandomWord.text = "100"
        } else if (number == 12) {
            RandomWord.text = "1000"
        } else if (number == 13) {
            RandomWord.text = "10000"
        } else {
            RandomWord.text = "1000000000"
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cameraButtonTapped(_ sender: Any) {
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
        /*db.collection("data").document("TF").addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            let source = document.metadata.hasPendingWrites ? "Local" : "Server"
                    print("\(source) data: \(document.data() ?? [:])")
            
        }*/
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
