//
//  coverVerticalViewController.swift
//  ToggleSwitchViews
//
//  Created by 신지훈 on 2021/08/11.
//

import UIKit

class ToggleSwitchViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ToggleBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
  

}
