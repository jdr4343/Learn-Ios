//
//  AddViewController.swift
//  AlarmReminder
//
//  Created by 신지훈 on 2021/08/13.
//

import UIKit

class AddViewController: UIViewController {

    //@IBOulet
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    //완료 속성 추가 / 사용자가 추가한 정보(제목과 날짜)를 다른 컨트롤러에 전달하는 메커니즘
    public var completion:((String, String, Date) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //네비게이션 바버튼 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장 ", style: .done, target: self, action: #selector(didTapSaveButton))

        
    }
    
    //바 버튼 기능 추가 / 텍스트가 비어있지 않은지 확인
    @objc func didTapSaveButton() {
        if let titleText = titleField.text, !titleText.isEmpty,
           let bodyText = bodyField.text, !bodyText.isEmpty {
            //닐찌 피커에서 날짜 가져오기
            let targetDate = datePicker.date
            //완료 속성 추가
            completion?(titleText, bodyText, targetDate)
        }
        
    }


}
