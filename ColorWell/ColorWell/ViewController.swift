//
//  ViewController.swift
//  ColorWell
//
//  Created by 신지훈 on 2021/08/13.
//

import UIKit

class ViewController: UIViewController {
    
    let colorWell: UIColorWell = {
       let colorWell = UIColorWell()
        //사용자가 불투명도를 지정할수 있도록 알파값 허용
        colorWell.supportsAlpha = true
        //현재 선택된 컬러를 가져오거나 설정하는데 사용하는 selectedColor..디폴트 값으로 빨간색!
        colorWell.selectedColor = .systemRed
        colorWell.title = "색상 선택기"
        return colorWell
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorWell.selectedColor
        
        view.addSubview(colorWell)
        
        colorWell.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        colorWell.frame = CGRect(x: 20,
                                 y: view.safeAreaInsets.top,
                                 width: view.frame.size.width-40,
                                 height: 50)
    }
    //컬러를 바꾸면 베경색이 함께 바뀌도록 view의 background 컬러에 컬러월 색상 저장
    @objc private func colorChanged() {
        view.backgroundColor = colorWell.selectedColor
    }

}


