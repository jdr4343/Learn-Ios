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
//View Controller -> + -> picker -> picker 왼쪽 마우스 클릭 -> (deligate,datasourse) pile son 연결 -> 모든 부분을 코드구현
  

import UIKit

class TextPickerViewController: UIViewController {
    let devTools = ["Xcode", "Postman", "SourceTree", "Zeplin", "Android Studio", "SublimeText"]
    let fruits = ["Apple", "Orange", "Banana", "Kiwi", "Watermelon", "Peach", "Strawberry"]
    //조금전에 우리가 UI를 구성했던 신은 이클래스와 연결되어 있고 여기에서 protocol 매서드를 구현 하겠습니다
    
//2번 방식 : 나머지 경우에는 이 방식으로 구현 합니다
    @IBAction func report(_ sender: Any) {
        //리포트 메서드로 가서 이번에는 우리가 이메소드를 사용할건데 이메소드를 컴포넌트에 인덱스를 전달하면 해당 컴포넌트에서 선택되어있는 항목의 인덱스를 리턴해줍니다 만약 선택되어있는 항목이 없다면 마이너스 1을 리턴합니다 일단 이값을 상수에 전달핧한다음에 선택된 항목이 없다면 낫파운드를 출력하겠습니다.그리고 선택된 항목이 있다면 그항목을 콘솔에 출력 하겠습니다.
        /*let row = picker.selectedRow(inComponent: 0)
        
        guard row >= 0 else {
            print("not found")
            return
            //여기에서 리포트 버튼을 누르면 선택되어있는 항목이 콘솔에 출력됩니다.
        }
        print(devTools[row])
    */
        let firstSelectedRow = picker.selectedRow(inComponent: 0)
        let secondSelectedRow = picker.selectedRow(inComponent: 1)
        if firstSelectedRow >= 0 {
            print(devTools[firstSelectedRow])
        }
        if secondSelectedRow >= 0 {
            print(fruits[secondSelectedRow])
//일단 리포트는 버튼과 연결된 액션 메소드이죠 그리고 컴포넌트와 로우가 파라미터로 전달되지 않기때문에 조금 다른 방식으로 구현합니디. 먼저 각각의 컴포넌트에서 선택되어있는 인덱스를 가져오겠습니다.이렇게 첫번째 항목이 마이너스 1이 아니라면 선택한 항목이 있는거니깐 devTools배열에서 해당인덱스에 있는 데이터를 표시 하면 되겠죠 그리고 두번째 인덱스도 같은 방법으로 처리 하겠습니다.
        }
    }
    @IBOutlet weak var picker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
extension TextPickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
        //먼저 새로운 extension을 추가하고 UIPickerViewDataSource 프로토콜 데이터를 구현 하겠습니다 .그리고 필수메소드는 이렇게 pix를 클릭해 입력 하겠습니다 class를 보면 두개의 배열이 선언 되어 있는데 devTools 배열에 있는 문자열을 pickerView에 표시해 보겠습니다 먼저 첫번째 메서드에서는 Components의 수를 리턴하는데 여기에서 리턴하는 수만큼 개별적으로 돌릴수있는 휠이 표시됩니다 여기에서는 1을 리턴 하겠습니다
        //컴포넌트를 두개 표시해야 되니깐 2를  return 하겠습니다.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       // return devTools.count 두개의 컴포넌트로 바꾸기위해 주석처리
        //두번째 메서드에서는 devTools의 count를 리턴하겠습니다
        switch component {
        case 0:
            return devTools.count
        case 1:
            return fruits.count
        default:
            return 0
            //아까는 component가 하나였기 떄문에 여기에서는 그냥 배열에 카운트를 리턴했습니다 만약 모든 컴포넌트에 동일한 데이터를 표시할꺼라면 그냥 이대로 둬도 되는데 보통 다른 데이터를 표시하죠 표시할 데이터도 컴포넌트 별로 따로 제공해야되고 선택된한 값을 확인할때도 컴포넌트에 인덱스를 고려해야됩니디 component의 인덱스는 이렇게 component파라미터로 전달됩니다 첫번쩨 component에서는 devTools의 카운터를 리턴하고 fruits배열의 카운트를 리턴 하겠습니다.
        }
    }
    
    
}
extension TextPickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       // return devTools[row]
        //그리고 아래쪽에 또 다른 extension을 추가하고 UIPickerViewDelegate를 구현하겠습니다 먼저 ickerView의 String을 출력하는 메서드를 호출하겠습니다 그런다음 두번째 파라미터로 전달되는 인덱스로 배열에 있는 문자열을 가져와 리턴하겠습니다
        
        //이렇게 devTools배열에 저장되어 있는 문자열에 Picker에 표시되고 이렇게 스피닝 휠을 돌려서 선택할수 있습니다 가운데에 표시되는 셀렉션 인디케이터는  선택한 항목을 강조 합니다 아주 오래전에는 인디케이터를 숨기는 방법을 제공했지만 현재는 제공하지 않습니다 이부분을 커스텀 하는것도 불가능합니다
        switch component {
        case 0:
            return devTools[row]
        case 1:
            return fruits[row]
        default:
            return nil
            //이전과 마찬가지로 컴포넌트 파라미터로 전달된 인덱스를 기준으로 분개하겠습니다.
        }
    }
    //1번 방식 : 우리가 앱을 만들때 선택 직후에 어떤기능을 바로 실행해야한다면 주로 이 메소드를 사용하는 방식으로 구현하고
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //print(devTools[row])
        //여기에서 사용자가 선택한 항목을 확인하는 방법은 두가지 입니다 다시 코드로 돌아와서 먼저 델리게이트 메서드를 통해서 선택한 항목을 확인 해보겠습니다 이메소드를 구현하면 피커뷰에서 항목을 선택할때마다 반복적으로 호출됩니다
        switch component {
        case 0:
            print(devTools[row])
        case 1:
            print(fruits[row])
        default:
            break
        }
    }
}
//일단 선택한 항목을 콘솔에 출력하겠습니다 휠을 돌려서 다른 항목을 선택하면 우리가 구현한대로 선택한 항목이 콘솔에 표시됩니다 이렇게 델리게이트 메서드를 통해서 확인하는 방법은 사용자가 항목을 직접선택해야 메서드로 호출됩니다 그래서 특정 시점에 선택되어있는 항목을 확인하는것은 어렵습니다













