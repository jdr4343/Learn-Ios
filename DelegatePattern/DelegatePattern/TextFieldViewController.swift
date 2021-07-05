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

class TextFieldViewController: UIViewController {
    
    @IBOutlet weak var inputFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputFiled.delegate = self
        //보통은 스토리 보드에서 델리게이트를 연결하지만 코드에서 연결하는것도 가능합니다 그리고 델리게이트를 연결하는 코드는 보통 viewDidLoad에서 구현합니다. 이렇게 방금연결한 @IBOutlet을 통해서 컨트롤에 접근한다음에 델리게이트 속성에 셀프를 저장합니다.
        
       //지금은 뷰컨트롤러가 프로토콜을 채용하고 있지 않기때문에 에러가 발생하는데 익스텐션을 추가하고 유아이 텍스트 필드 델리게이트 프로토콜을 채용하겠습니다.그러면 에러가 사라지죠.
    }
}

extension TextFieldViewController: UITextFieldDelegate {
    // 우리가 앞에서 공부한 테이블뷰 데이터 소스에는 두개의 필수 메소드가 있었지만 UITextFieldDelegate에는 필수 메소드가 없습니다 그래서 extension에서 메소드를 구현하지 않아도 에러는 발생하지 않습니다.이제 여기에 새로운 메소드를 추가 하겠습니다.
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
        // 텍스트 필드는 텍스트를 입력하고 삭제할떄마다 이메소드를 반복적으로 호출합니다. 여기에서 트루를 리턴하면 편집한 내용을 반환하고 팔스를 리턴하면 편집한내용을 무시합니다. 이메소드를 활용하면 텍스트 필드에 입력할수있는 문자수 를 제한하거나 숫자만 입력하도록 구현할수 있습니다.실제 구현예제는 텍스트필드강의를 참고해주시길 바랍니다.
    }
}
// 테이블뷰와 텍스트필드처럼 델리게이트 패턴을 사용하는 객체는 몇가지 공통점을 가지고 있습니다.먼저 델리게이트를 설정하는 속성이 선언되어 있습니다 그리고 이런 속성들의 이름들은 데이터 소스로 끝나거나 델리게이트로 끝납니다. 그리고 속성의 형식은 프로토콜이고 프로토콜의 이름도 일정한 패턴을가지고 있습니다.

//대부분 객체의 이름뒤에 Datasourse나 Delagate 접미어가 추가되어 있습니다. 테이블뷰에 선언되어 있슨 델리게이트 속성의 형식은 UITableViewDelegate 프로토콜이고 텍스트 필드에 선언되어있는 델리게이트 형식은 UITextFieldDelegate 입니다. 프로토콜에 선언되어있는 메서드 이름은 대부분 객체의 이름으로 시작합니다. 그리고 첫번째 파라미터에는 메소드를 호출한 객체가 전달됩니다.

//델리게이트 패턴은 ios 앱개발에서 정말 다양한 곳에서 활용됩니다. 컬렉션뷰를 구현하거나 Gps에서 위치 정보를 가져올때도 여기에서 공부한것과 동일한 방법으로 델리게이트 패턴을 구현합니다.이번시간에 공부한 프로토콜에 어떤 메소드가 선언 되어있고 언제 호출되어있는지 래퍼런스를 통해 확인해보시길 바랍니다. 그리고 델리게이트를 설정하고 프로토콜 메서드를 구현하는 과정을 반복하면서 구현 패턴을 완전히 암기해두시면 좋겠습니다. 그러면 코코아 터치 프레임 워크가 제공하는 대부분의 기능을 쉽게 구현할수있고 강의에서 함께구현하는 코드도 더쉽게 이해할수있습니다.


/*
 이 프로토콜의 방법을 사용하여 다음 기능을 관리하십시오.
//사용자 지정 머리글 및 바닥 글보기를 만들고 관리합니다.
//행, 머리글 및 바닥 글의 사용자 지정 높이를 지정합니다.
//더 나은 스크롤 지원을 위해 높이 추정치를 제공합니다.
//행 내용을 들여 씁니다.
//행 선택에 응답합니다.
//표 행의 스 와이프 및 기타 작업에 응답합니다.
//테이블의 내용 편집을 지원합니다.
 
 */


