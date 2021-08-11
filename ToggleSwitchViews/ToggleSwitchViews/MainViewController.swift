//
//  ViewController.swift
//  ToggleSwitchViews
//
//  Created by 신지훈 on 2021/08/11.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var coverVerticalBtn: UIButton!
    
    @IBOutlet weak var crossDissolveBtn: UIButton!
    
    @IBOutlet weak var flipHorizontalBtn: UIButton!
    

    
    
    
    
   
    
    @IBAction func TogglecoverVertical(_ sender: Any) {
        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "ToggleVC") {
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(uvc, animated: true)
        }
        print("Vertical")
        
    }
    
    @IBAction func TogglecrossDissolve(_ sender: Any) {
        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "ToggleVC") {
        uvc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(uvc, animated: true)
        print("Dissolve")
        }
    }
    
    @IBAction func ToggleflipHorizontal(_ sender: Any) {
        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "ToggleVC") {
        uvc.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(uvc, animated: true)
        print("Horizontal")
        }
    }
    
   


override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    

}
   
}
