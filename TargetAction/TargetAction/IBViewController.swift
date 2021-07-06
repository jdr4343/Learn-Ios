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
//

import UIKit

class IBViewController: UIViewController {
    
    @IBAction func TestoneBtn(_ sender: Any) {//sender 파라미터 추가 , 가장 기본적인 형태
        
        //이제 이버튼은 target Action 메커니즘으로 코드와 연결되었습니다. 버튼의 타깃은 IBViewController 인스턴스이고 액션은 여기에 구현되있는 TestoneBtn이라는 메소드입니다 이메소드는 버튼에서 터치업인사이드 이벤트가 발생할때마다 반복적으로 호출되고 (_ sender: Any) 파라미터에는 이벤트가 발생한 버튼이 전달됩니다.
        
    }
    
    @IBAction func TesttwoBtn() { //none을 선택 하면 파라미터가 추가X
        //지금처럼 인터페이스 빌더에서는 코드가 자동으로 생성되기 때문에 문제가 없지만 코드로 연결할떄는 조심해야됩니다 반드시 여기에 있는 세가지 형태중에 하나로 구현해야되는데 그렇지 않으면 액션이 정상적으로 연결되지 않거나 크래시가 발생하게 됩니다.
    }
    
    @IBAction func TestthreeBtn(_ sender: Any, forEvent event: UIEvent) { //sender and Event 같은이름을 가진 파라미터 두개
    }//이번에는 Action 메소드와 viewDidLoad를 비교해 보겠습니다 먼저 Action 메소드를 보면 func키워드 앞에 IBAction 특성이 추가 되 있죠 반대로 뷰디드 로드에는 이특성이 추가 되어 있지 않습니다 여기에 있는 IBAction특성은 인터페이스 빌더를 위한 힌트로 사용됩니다 이특성이 추가 되어 있으면 이렇게 거터영역에 컨넥션 웰이 표시됩니다 인터페이스 빌더에서 Action 을 연결할때는 이특성을 반드시 추가 되야됩니다 반대로 코드를 통해서 Action 을 추가 할때는 이특성을 추가 하지 않아도 됩니다.
    
    
    @IBAction func sliderChanged(_ sender: Any) {
    }/* 이번에는 신에서 슬라이더를 선택한다음에 컨트롤 드래그 해서 액션으로 연결하겠습니다.다른 부분은 동일하지만 여기에 있는 이벤트 항목을 보면 밸류 체인지드로 선택되있죠 앞으로 액션을 연결할때 여기에 어떤 이벤트가 선택되어있는지 확인 해보는게 좋습니다 그러면 왜 그럴까요 우리가 코드를 통해서 연결할떄는 이벤트를직접 지정해야되는데 잘못지정하면 원하는 결과를 얻을수 없기 떄문입니다 이름은 sliderChanged로 하고 connect 버튼을 클릭해서 연결하겠습니다.
        이제 여기에 있는 슬라이더도 target Action 메커니즘으로 코드와 연결 되었습니다 슬라이더의 타겟은 버튼과 동일한 IBViewController로 인스턴스이고 액션은 여기에있는 sliderChanged 메소드 입니다. 사용자가 슬라이더에서 드래그 할떄마다 vlauechanged 이벤트가 발생하고 연결되어있는 액션 메소드가 반복적으로 호출됩니다.*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
