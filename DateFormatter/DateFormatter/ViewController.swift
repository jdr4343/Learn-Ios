//
//  ViewController.swift
//  DateFormatter
//
//  Created by 신지훈 on 2021/08/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    let formatter: DateFormatter = {
        let formatter = DateFormatter()
        //스타일 변경
        
        //장치의 시간을 현재 시간대로 지정
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //현재 날짜를 문자열로 선언
        let date = Date()
        
        
        label.text = formatter.string(from: date)
    }


}

