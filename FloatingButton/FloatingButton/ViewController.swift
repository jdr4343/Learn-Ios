//
//  ViewController.swift
//  FloatingButton
//
//  Created by 신지훈 on 2021/08/14.
//

import UIKit

class ViewController: UIViewController {
    //버튼 /둥글게 /색깔 /이미지,크기,색깔/제목 지정시 색깔 /그림자
    private let flotingButton: UIButton = {
       let button = UIButton(frame: CGRect(x: 0, y: 0,
                                           width: 70, height: 70))
       //button.layer.masksToBounds = true
        button.layer.cornerRadius = 35
        button.backgroundColor = .systemIndigo
        
        let image = UIImage(systemName: "plus",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 35, weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.3
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(flotingButton)
        //버튼기능
        flotingButton.addTarget(self, action: #selector(didTapFlotingbutton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //위치
        flotingButton.frame = CGRect(x: view.frame.size.width - 60 - 30,
                                     y: view.frame.size.height - 130,
                                     width: 70, height: 70)
    }
    //버튼 기능 구현
    @objc private func didTapFlotingbutton() {

    }
}

