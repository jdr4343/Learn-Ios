//
//  SwitchTableViewCell.swift
//  TableView
//
//  Created by 신지훈 on 2021/06/29.
//  Copyright © 2021 Keun young Kim. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // 셀 초기화 코드 구현
        
        //새로운 스위치 코드를 만든후 악세사리 뷰에 저장하겠습니다.
        let v = UISwitch(frame: .zero)
        accessoryView = v
        //이렇게 하면 셀 오른쪽에 스위치가 표시됨
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
