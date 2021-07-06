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

import UIKit

class TextButtonViewController: UIViewController {
    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // btn.titleLabel?.text = "Hello"
       // btn.titleLabel?.textColor = .systemRed
        // 버튼안에 있는 레이블에 접근하고싶다면 이렇게 titleLabel? 속성으로 접근 합니다 이속성으로 text와 textColor,backgroundColor를 바꿔 보겠습니다 텍스트는 이렇게 text 속성으로 바꾸면 되고 textColor 는 빨간색으로 설정하고 backgroundColor는 초록색으로 하겠습니다
        //backgroundColor는 초록색으로 표시됬는데 text와 textColor는 바뀌지 않았죠 버튼은 이렇게 titleLabel 에 직접 접근해서 text와 textColor를 바꾸는 것을 허용하지 않습니다 text와 textColor를 바꾸고 싶다면 UIButton이 제공하는 메소드를 사용해야 합니다 .
        btn.setTitle("Hello", for: .normal)
        btn.setTitle("Haha", for: .highlighted)
        //버튼에서 Set이라 작성하고 자동완성 목록을 보면 속성을 바꾸는 메소드가 표시 되는데 setTitle는 타이틀을 바꾸고 setImage는 이미지를 바꾸는 거겠죠 그리고 이런 메소드는 공통적으로 마지막 파라미터로 상태를 받습니다
        //코드에서 속성을 바꿀때는 상태 별로 바꿔야 합니다 이메소드들을 사용해서 이렇게 노말상태에서는 Hello를 표시하고 하이라이트 상태에선느 Haha라고 표시하겠습니다.
        btn.setTitleColor(.systemRed, for: .normal)
        //이어서 textColor를 바꿔보겠습니다
        btn.titleLabel?.backgroundColor = .systemGreen
        
    }
}
