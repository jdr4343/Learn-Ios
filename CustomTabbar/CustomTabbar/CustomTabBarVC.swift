//
//  CustomTabBarVIew.swift
//  CustomTabbar
//
//  Created by 신지훈 on 2021/08/14.
//
import UIKit
import Foundation

class CustomTabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.selectedIndex = 1
        print("error")
        setupMiddleButton()
    }
    
    func setupMiddleButton() {
        //버튼
        print("erroe")
        let middelButton = UIButton(frame: CGRect(x: (self.view.bounds.width/2)-25,
                                                  y: -20,
                                                  width: 60,
                                                  height: 60))
        //버튼 이미지삽입 / 테두리 그림자 설정
        middelButton.setBackgroundImage(UIImage(named: "home"), for: .normal)
        middelButton.layer.shadowColor = UIColor.black.cgColor
        middelButton.layer.shadowOpacity = 0.1
        middelButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        //탭바 추가 / 액션 추가
        self.tabBar.addSubview(middelButton)
        middelButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        
        self.view.layoutIfNeeded()
    }
    //액션 기능 생성
    @objc func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 1
    }
}



