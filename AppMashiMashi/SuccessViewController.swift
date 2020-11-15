//
//  SuccessViewController.swift
//  AppMashiMashi
//
//  Created by Mia Berthier on 2020-11-14.
//

import UIKit

class SuccessViewController: UIViewController {

    var wordFromWord:String = ""
    var charFromWord:String = ""
    
    @IBOutlet weak var TextLabel: UILabel!
    @IBOutlet weak var ImageChoice: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (wordFromWord == "fail") {
            TextLabel.text = "Wrong character!"
            ImageChoice.image = UIImage(named: "TryAgain.png")
        }
        // Do any additional setup after loading the view.
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
