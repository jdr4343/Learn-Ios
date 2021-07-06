//
//  CustomAccessoryTableViewCell.swift
//  TableView
//
//  Created by 신지훈 on 2021/07/01.
//  Copyright © 2021 Keun young Kim. All rights reserved.
//

import UIKit

class CustomAccessoryTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // 초기화 코드는 보통 awakeFromNib 메소드에서 구현합니다.여기에서는 간단한 이미지 뷰를 만들고 커스텀 악세사리뷰로 설정 하겠습니다
        let v = UIImageView(image: UIImage(systemName: "star"))
        //악세사리뷰 속성을 보면 OptionalUIView로 선언 되어 있습니다. 그래서 UIView나 UIView를 상속한 뷰를 활용해서 자유롭게 구성할수있습니다. 다만 모든 부분을 코드로 구현해야하기 때문에 조금 귀찮거나 코드가 익숙하지 않으면 조금어렵다는 단점이 있습니다.이렇게 이속성에 뷰를 할당하면 악세사리타입 속성은 무시합니다 반대로 이속성에  nil을 저장하면 악세사리타입속성에 따라서 스탠다드 악세사리를 표시합니다. 악세사리 모드를 일반모드와 편집모드를 따로 설정 할수있는것처럼 커스텀악세사리뷰도 따로 설정할수있습니다편
        accessoryView = v
        //editingAccessoryView 편집모드에서 표시되는 뷰는 이속성으로 설정합니다.
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
