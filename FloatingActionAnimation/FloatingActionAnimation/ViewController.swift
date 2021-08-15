//
//  ViewController.swift
//  FloatingActionAnimation
//
//  Created by 신지훈 on 2021/08/15.
//

import UIKit
import Floaty


class ViewController: UIViewController,FloatyDelegate{

    let floaty = Floaty()
    let item = FloatyItem()
    
     
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(floaty)
        addFloaty()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floaty.frame = CGRect(x: view.frame.size.width - 60 - 20,
                              y: view.frame.size.height - 120,
                              width: 70, height: 70)
        
    }
    
    fileprivate func addFloaty() {
        floaty.buttonColor = UIColor.systemIndigo
        floaty.addItem("만들었습니다.", icon: UIImage(systemName: "pencil"), handler: { [self] item in
            if let uvc = self.storyboard?.instantiateViewController(identifier: "SempleViewVC") {
                uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
                        self.present(uvc, animated: true)
            }
        })
        floaty.addItem("플로팅 버튼을", icon: UIImage(systemName: "person"), handler: { item in
            
        })
        floaty.addItem("오늘은", icon: UIImage(named: "icon"))
        floaty.addItem("신지훈입니다", icon: UIImage(named: "icon"))
    }
    
    
    
}
