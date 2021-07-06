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
// separator을 스토리 보드에서 none을 선택하면 커스텀 할수 있음
//separator는 테이블뷰의 실선들을 말함
///https://developer.apple.com/documentation/tvml/separator/
import UIKit

class SeparatorViewController: UIViewController {
    
    let list = ["iMac Pro", "iMac 5K", "Macbook Pro", "iPad Pro", "iPhone X", "Mac mini", "Apple TV", "Apple Watch"]
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//  UITableView 클래스는 separator로 시작하는 다양한 속성을 제공 합니다
        listTableView.separatorStyle = .singleLine
//separatorStyle 속성은 시각적인 스타일을 설정 합니다. 싱글라인으로 설정 하겠습니다
        listTableView.separatorColor = .blue
//separatorColor 속성은 컬러를 설정합니다,
        listTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//separatorInset 속성은 설명에 보시는 것처럼 UIEdgeInsets 구조체로 설정 해야하고 여기에서 탑과 바텀 값은 무시됩니다 여기에서는 모든 값을 0으로 설정하겠습니다.
        listTableView.separatorInsetReference = .fromCellEdges
//마지막으로 인셋을 계산하는 방식은 이속성으로 설정합니다.
//지금까지 설명한 속성들은 모든 셀에 공통적으로 적용되는 속성입니다 개별 셀에서 separatorColor나 separatorStyle 바꾸는 건 불가능 하지만 인셋을 바꾸는 건 가능합니다.
    }
}




extension SeparatorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { ///테이블 뷰의 정해진 섹션에 행의 숫자를 리턴하도록 DataSourse에게 지시합니다.
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //테이블 뷰는 dequeueReusableCell 메소드가 호출 되었을때 재사용 큐를 확인합니다 리턴할셀이 있다면 그대로 리턴하고 셀이 없다면 프로토타입 셀을 기반으로 새로운 셀을 만들어 리턴합니다.테이블뷰가 처음 표시될때에는 재사용 큐에 셀이 없기 떄문에 화면에 표시되는 셀 숫자만큼 새로운 셀을 만들어 리턴합니다.
        
        cell.textLabel?.text = list[indexPath.row % list.count]
        //2번째 셀과 3번째 셀은 inset을 설정 해보겠습니다. UITableView 클래스가 제공하는 separatorInset 속성으로 개별 셀의 Inset을 설정합니다. 먼저 두번째 셀에서는 left 인셋을 30으로 설정하겠습니다.그리고 3번째 셀에서는 right인셋을 30으로 설정하겠습니다.
        if indexPath.row == 1 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        } else if indexPath.row == 2 {
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 30)
            
            //인셋 초기화
        } else {
            cell.separatorInset = listTableView.separatorInset
        }
        
        return cell
    }
}
//여기에서 아무런 문제가 없는거 같지만 아래쪽으로 스크롤 하면 다른 셀에도 custominset이 적용됩니다 이런문제가 발생하는 원인은 테이블뷰가 재사용 메커니즘을 사용 하기 때문입니다. 첫번째 셀과 두번째  셀이 화면에서 사라지고 재사용셀에 추가 되었다가. 이셀을 표시할떄 다시 사용 된것입니다. 셀을 사용 할떄 텍스트는 업데이트 했지만 separatorInset은 이전 상태 그대로 입니다. 다시 여기에서 코드를 보면 row 인덱스가 1이거나 2인 경우에만 separatorInset을 설정하고 있죠. 이문제를 해결하려면 else 블록을 추가 하고 여기에서 인셋을 초기화 해야합니다.개별셀마다 separatorInset 설정하는 경우에는 지금처럼 모든 로우 index에서 separatorInset을 설정하도록 구현 해야됩니다.























