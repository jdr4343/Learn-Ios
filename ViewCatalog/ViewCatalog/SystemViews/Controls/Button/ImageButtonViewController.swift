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

class ImageButtonViewController: UIViewController {
    
    @IBOutlet weak var btn: UIButton!
    //회면에 추가되어 있는 버튼은 비티엔과 아울렛으로 연결해두 었습니다 코드는 viewDidLoad에서 구현할거고 우선은 지정할 이미지가 필요하겠죠
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalImage = UIImage(named: "plus-normal")
        let highlightedImage = UIImage(named: "plus-highlight")
        let backgroundImage = UIImage(named: "plus-normal")
        
        btn.setImage(normalImage, for: .normal)
        btn.setImage(highlightedImage, for: .highlighted)
        
        btn.setBackgroundImage(backgroundImage, for: .normal)
        //이미지를 설정할떄는 SetImage 메소드를 사용하는데 타이틀과 마찬가지로 두번쨰 파라미터로 상태를 전달합니다 먼저 첫번째 파라미터에는 normalImage이미지를 전닿하고 두번째 파라미터에는 normal을 전달 할건데 그러면 기본상태에서 이이미지가 표시 되겠죠 그런다음에 같은 메소드를 사용해서 하이라이트에서 사용할이미지도 설정하겠습니다.배경이미지를 설정하는 메소드는 setBackgroundImage입니다 구현하는 방법은 조금전에 구현했던 코드와 완전히 동일합니다 첫번쨰 파라미터로 설정할 이미지를 전달하고 두번쨰 파라미터로 이미지를 설정할 상태를 전달합니
      
    }
}
