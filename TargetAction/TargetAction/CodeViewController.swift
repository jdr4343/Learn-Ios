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
// 코드로 인터페이스 빌드
import UIKit

class CodeViewController: UIViewController {
    //아울렛 연결
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    
    func action() {
        //먼저 여기에서 컨트롤과 연결할 action 메소드를 구현 하겠습니다 첫번째 메소드는 파라미터가 없는 메소드 입니다.코드로 연결하는 메소드는 보통 이렇게 @IBAction 특성을 추가 하지 않습니다
    }
    
    @objc func action(_ sender: Any) {
        //그리고 두번째 메소드는 하나의 파라미터를 가진 메소드 입니다 여기서 파라미터 이름은 원하는데로 선언 할수 있지만 보통은 이렇게 sender라고 선언 하고 파라미터의 형식도 보통은 Any로 선언하지만 실제 컨트롤러형식으로 선언하는 것도 가능합니다 하지만 아규먼트레이블은 이렇게 와일드카드 패턴(언더스코어_)으로 생략해야 합니다.
        print(#function)
        // 두번째메소드로 가서 프린트 함수로 메소드 이름을 출력하고 실제로 버튼을 누르면 메소드가 호출되는지 확인해보겠습니다
    }
    
    func action(_ sender: Any, forEvent event: UIEvent) {
        //세번째 메소드는 두개의 파라미터를 가진 메소드 입니다 첫번째 파라미터는 조금전과 동일하고 두번째 파라미터의 형식은  UIEvent형식으로 선언해야 합니다.
      
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //이제 뷰디드 로드로 가서 버튼과 액션을 연결해 보겠습니다 타겟액션을 구현할때는 UIcontlroller 클래스가 제공하는 addTarget 메소드를 사용합니다
        /*btn.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    첫번째 파라미터 메소드에는 타켓을 전달하는데 여기에서는 액션 메소드가 구현되어 있는 코드 뷰 컨트롤러인스턴스 가 타깃이고 그래서 이렇게 셀프를 전달합니다 두번째 파라미터에는 메소드를 전달해야하는데 형식을 보시면 셀렉터죠
         let sel = #selector(action(_:))
         먼저 메소드를 셀렉터로 바꿔야 합니다 코드위에서 일단 이렇게 셀이라는 상수를 선언한다음에 두번째 메소드를 셀렉토로 바꾸겠습니다#selector라고 입력한다음에 괄호를 열고 메소드 이름을 입력하면 이렇게 자동완성에 표시되죠 여기까지 구현하면 컴파일 에러가 발생하는데 어떤에러인지 보겠습니다 셀렉토로 전달한 메소드가 오브젝트씨에 공개되지 않았다고 나와있고 여기보면 @objc 메소드를 사용하라고 나와 있죠 일단 픽스를 클릭해보겠습니다 그러면 두번째 메소드 압부분에 이렇게 @objc 특성이 추가 됩니다 인터페이스 빌더 방식에는  @IBOutlet 특성을 사용하고 여기에 @objc 특성이 포함되있기때문에 필요없었지만 코드 방식에는 반드시 @objc  특성을 직접 추가 헤야됩니다 그러면  컴파일 에러가 사라졌고 이제 이상수를(sel) 두번째 파라미터로 전달하겠습니다 세번째 파라미터에는 이벤트의 종류를 전달하겠습니다 버튼에서 탭이벤트를 처리할때는 터치업 인사이드 패턴을 사용합니다 여기까지 타겟액션 이 완료되었습니다
 */
        let sel = #selector(action(_:))
        btn.addTarget(self, action: sel, for: .touchUpInside)
        
    }
}
