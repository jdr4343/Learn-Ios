//
//  Mastering iOS
//  Copyright (c) KxCoding <help@kxcoding.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//피커뷰는 슬롯머신 형태의 유아이를 가지고 있고 휠을 돌려서 값을 선택합니다 CoCoaTouch프래임 워크는 두가지 피커를 제공하는데 날짜나 시간을 선택할때 사용할때 사용하는 데이트피커,범용적으로 사용하는 피커뷰 입니다 피커뷰는 다양한 데이터를 자유롭게 표현할수있다는 장점이 있습니다 두피커는 동일한 방식으로 동작하지만 구현에는 큰차이가 있습니다 데이터 피커는 원하는 모드를 선택하기만 하면 유아이와 데이터는 자동으로 구성됩니다 피커에서 항목을 선택하면 밸류체인지드 이벤트가 적용되고 선택된값을 가져올때는 데이터속성을 이용합니다 반면 피커뷰는 표시한 데이터를 직접 지정해야되고 경우에 따라서 표시할 뷰를 직접구성해야 합니다 그리고 선택 이벤트는 델리게이트 패턴으로 처리합니다.

import UIKit

class ImagePickerViewController: UIViewController {
    
    lazy var images: [UIImage] = {
        return (0...6).compactMap { UIImage(named: "slot-machine-\($0)") }
    }()
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func shuffle(_ sender: Any?) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}




