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
///https://developer.apple.com/documentation/uikit/uisplitviewcontroller/1623166-automaticdimension/
///https://developer.apple.com/documentation/uikit/uitableviewdelegate/1614998-tableview/
// 셀높이를 설정하는 방법 테이블뷰는 셀에 표시되는 정보를 기반으로 높이를 자동으로 설정합니다.이기능을 셀프사이징 이라고 합니다  오토 레이아웃을 활용해서 셀높이를 계산해두면 나머지 부분은 테이블뷰가 알아서 합니다.

import UIKit

class SelfSizingCellViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    let list = [
        ("Always laugh when you can. It is cheap medicine.", "Lord Byron"),
        ("I probably hold the distinction of being one movie star who, by all laws of logic, should never have made it. At each stage of my career, I lacked the experience.", "Audrey Hepburn"),
        ("Sometimes when you innovate, you make mistakes. It is best to admit them quickly, and get on with improving your other innovations.", "Steve Jobs")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //listTableView.rowHeight = UITableViewAutomaticDimension
        //listTableView.estimatedRowHeight = UITableViewAutomaticDimension
        //이렇게 두속성에 UITableViewAutomaticDimension 저장하면 셀프 사이징이 활성화 됩니다.방금 구현한 코드는 스토리 보드에서 Automatic을 체크하는 것과 동일합니다.
        //빌드시 클리핑이 발생한다면 인디케이터에서 line의 숫자를 0으로 바꿔주세요.
        
        //테이블 뷰는 셀의 높이를 계산할때 오토레이아웃 제약과 뷰의 속성을 기반으로 계산 합니다 그래서 제약과 속성을 올바르게 설정하는 것이 중요합니다 지금처럼 기본스타일을 사용하는 경우에는 올바를 제약이 자동으로 추가되기 떄문에 레이블의 속성만 제대로 설정하면 문제가 없습니다 커스텀셀을 직접구현할떄에는 높이를 정확히 계산할수있도록 제약을 추가하는것이 정말 중요합니다.
        //테이블 뷰에 표시되는 높이를 예측할수 없다면 지금처럼 셀프사이징을 사용해야 하지만 반대로 모든 셀의 높이가 동일 하다면 셀프사이징을 끄고 고정된값을 사용하는것이 좋습니다 고정된 높이를 지정하면 테이블뷰가 높이를 계산하는 시간이 필요없기떄문에 그만큼 스크롤 성능이 향상됩니다.
    }
}



extension SelfSizingCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let target = list[indexPath.row]
        cell.textLabel?.text = target.0
        cell.detailTextLabel?.text = target.1
        return cell
    }
}



extension SelfSizingCellViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //테이블 뷰는 셀 높이를 지정하기전에 이메소드를 호출합니다 여기에서 고정된 값을 리턴하면 그값을 그대로 사용하고 오토매틱 디멘션을 리턴하면 제약과 뷰의 속성을 기반으로 직접 계산합니다. 그리고 이메소드를 구현하면 테이블 뷰에 설정되어 있는 로우하이트 속성은 무시합니다. 다시말해 여기에서 리턴하는 값이 우선순위가 더 높습니다.
        // 첫번째 셀은 100포인트로 고정하고 나머지 셀은 오토매틱으로 구현하겠습니다.셀의 위치는 두번쨰 파라미터로 전달되 인덱스패스를 통해서 파악합니다.
        if indexPath.row == 0 {
        return 100
    }
    return UITableViewAutomaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        //지금 처럼 델리게이트로 로우하이트를 지정하는 경우에는 이메소드를 추가하고 동일한 값을 리턴하면 스크롤 성능이 조금더 향상됩니다.
        if indexPath.row == 0 {
        return 100
    }
    return UITableViewAutomaticDimension
        
        //지금은 오토매틱디멘션을 리턴하고 있지만 여기에 대신 평균적인 셀의 높이를 리턴하면 스크롤 성능이 조금더 높아집니다.
    }
}


























