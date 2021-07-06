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

class ButtonStateViewController: UIViewController {
    
    @IBOutlet weak var stateLabel: UILabel!
    //상단에 있는 레이블은 스테이트 아울렛과 연결해두었고여기에는 버튼의 현재 상태를 표시했습니다.
    @IBOutlet weak var btn: UIButton!
    //가운데에 있는 버튼은 btn과 @IBOutlet으로 연결해두었습니다
    @IBAction func report(_ sender: UIButton) {
        //아래쪽에 있는 리포트 메소드와 액션으로 연결해두었습니다.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.stateLabel.text = sender.state.debugString
            //버튼에서 오른쪽마우스를 클릭해보면 이렇게 컨넥션 패널이 표시되는데 report 메소드는 버튼에서 발생한 모든 터치이벤트를 처리하고 있고 이벤트가 발생할때마다 Label을 업데이트 하고 있습니다
            //버튼의 state 속성은 유아이 컨트롤 클래스로부터 상속한 읽기전용 속성입니다 그래서 현재 상태를 가져올순 있지만 바꾸는건 불가능 합니다 그리고 앞에서 언급했던것 처럼 동시에 두개이상의 상태가 저장되어있는경우도 있습니다 이어지는 debugString은 state에 저장된값을 문자열로 바꾸는 속성입니다
        }
    }
    
    @IBAction func stateChanged(_ sender: UISegmentedControl) {
        //그리고 신에서 아래쪽에 있는 세그먼티드 컨트롤은 stateChanged메소드와 @IBAction으로 연결해두었습니다
        //여기에서 상태를 변경하는 코드를 만들어 보겠습니다 먼저 스위치 문으로 선택한 인덱스에 따라서 코드를 작성하겠습니다 .

        switch sender.selectedSegmentIndex {
        case 0:
            btn.isEnabled = true
            //default를 선택하면 isEnabled특성에 true를 전달 하겠습니다
            btn.isSelected = false
            btn.isHighlighted = false
            //우리가 상태를 바꿀때 사용하는 속성은 isEnabled, isHighlighted, isSelected 입니다 기본 상태로 초기화 하려면 세가지속성을 모두 초기화 해야합니다 첫번째 case 블록으로 가서 나머지 두속성에 false를 저장하겠습니다
        case 1:
            btn.isHighlighted.toggle()
            //두번쨰 Highlighied를 선택하면 isHighlighted 속성을 toggle하고
        case 2:
            btn.isSelected.toggle()
            //Selected를 선택하면 마찬가지로 같은 속성을 toggle 하겠습니다,
        case 3:
            btn.isEnabled = false
            //마지막 Disavled를 선택하면 isEnabled 특성에 false를 저장하겠습니다.
        default:
            break
        }
        report(btn)
        // //그리고 마지막으로 새로운 상태가 레이블에 출력되도록 report 메서드를 호출 하겠습니다.
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateLabel.text = btn.state.debugString
    }
}




extension UIControl.State {
    //코드 아래쪽으로 내려가보면 이렇게 익스텐션으로 구현해 두었습니다 .
    var debugString: String {
        var list = [String]()
        if contains(.normal) {
            list.append("Normal")
        }
        if contains(.highlighted) {
            list.append("Highlighted")
        }
        if contains(.disabled) {
            list.append("Disabled")
        }
        if contains(.selected) {
            list.append("Selected")
        }
        
        return list.joined(separator: ", ")
    }
}
