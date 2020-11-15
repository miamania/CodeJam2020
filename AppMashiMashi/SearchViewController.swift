//
//  SearchViewController.swift
//  AppMashiMashi
//
//  Created by Mia Berthier on 2020-11-14.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var ChoseTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    lazy var chosen:String = ChoseTxt.text!
    var char:String = ""
    
    func assignChar() -> String {
        if chosen == "1" || chosen == "one" || chosen == "One"{
            char = "1.png"
        } else if chosen == "2" || chosen == "two" || chosen == "Two" {
            char = "2.png"
        } else if chosen == "3" || chosen == "three" || chosen == "Three" {
            char = "3.png"
        } else if chosen == "4" || chosen == "four" || chosen == "Four" {
            char = "4.png"
        } else if chosen == "5" || chosen == "five" || chosen == "Five" {
            char = "5.png"
        } else if chosen == "6" || chosen == "six" || chosen == "Six" {
            char = "6.png"
        } else if chosen == "7" || chosen == "Seven" || chosen == "seven" {
            char = "7.png"
        } else if chosen == "8" || chosen == "eight" || chosen == "Eight" {
            char = "8.png"
        } else if chosen == "9" || chosen == "nine" || chosen == "Nine" {
            char = "9.png"
        } else if chosen == "10" || chosen == "ten" || chosen == "Ten" {
            char = "10.png"
        } else if chosen == "100" || chosen == "Hundred" || chosen == "hundred" {
            char = "12.png"
        } else if chosen == "0" || chosen == "zero" || chosen == "Zero" {
            char = "11.png"
        } else if chosen == "1000" || chosen == "thousand" || chosen == "Thousand" {
            char = "13.png"
        } else if chosen == "10000" || chosen == "ten thousand" || chosen == "Ten thousand" || chosen == "10 000" {
            char = "14.png"
        } else if chosen == "100000000" || chosen == "Hundred million" || chosen == "hundred million" || chosen == "100 000 000"{
            char = "15.png"
        } else {
            char = "ErrorCharacterUnknown.png"
        }
        return char
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destVC : WordViewController = segue.destination as! WordViewController
        destVC.wordFromChose = chosen
         destVC.charFromChose = assignChar()
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
