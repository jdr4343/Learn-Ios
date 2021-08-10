//
//  ViewController.swift
//  PhotoVideoShot
//
//  Created by 신지훈 on 2021/08/10.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBOutlet weak var profileChange: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImage.layer.cornerRadius = profileImage.frame.height/2
        self.profileChange.layer.cornerRadius = 10
        
        //버튼을 액션으로 끌어오는 방법도 있지만 많이 경험해 보았으므로 코드로 연결해보겠습니다.
        self.profileChange.addTarget(self, action: #selector(ProfileChangeTapped), for: .touchUpInside)
        
    }
        @objc private func ProfileChangeTapped() {po
            print("Tapped ProfileChangeTapped")
        
        
        // Do any additional setup after loading the view.
    }


}

