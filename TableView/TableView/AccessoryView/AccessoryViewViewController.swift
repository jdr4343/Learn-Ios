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
///악세사리뷰 디벨로퍼 https://developer.apple.com/documentation/uikit/uitableviewcell/1623219-accessoryview/
import UIKit

class AccessoryViewViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    @objc func toggleEditMode() {
        listTableView.setEditing(!listTableView.isEditing, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toggle", style: .plain, target: self, action: #selector(toggleEditMode))
    }
}



extension AccessoryViewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    //마지막부분에 커스텀 셀을 표시하도록 구현하겠습니다.
        if indexPath.row == 4 {
            return tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
            //셀 오른쪽에 커스텀뷰를 추가할떄 주로 활용합니다. 커스텀 셀보다 쉽게 구현할수있지만 위치와 크기를 원하는데로 설정할수 없다는 단점도 있습니다.
        }
        
        
    //스탠다드 악세사리뷰를 순서대로 설정하겠습니다.
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Disclosure Indecator"
            cell.accessoryType = .disclosureIndicator
        case 1:
            cell.textLabel?.text = "Detail Button"
            cell.accessoryType = .detailButton
        case 2:
            cell.textLabel?.text = "Detail Disclosure Button"
            cell.accessoryType = .detailDisclosureButton
        case 3:
            cell.textLabel?.text = "checkmark"
            cell.accessoryType = .checkmark
        default:
            cell.textLabel?.text = "None"
            cell.accessoryType = .none
        //악세사리뷰는 항상 셀 오른쪽에 표시됩니다 첫번째 disclosureIndicator 회색 화살표 모양으로 표시됩니다. 셀을 선택했을때 푸시 스타일로 화면이 전환 된다면 대부분 disclosureIndicator 를 이용합니다.
        //detailButton 상세정보를 모달 형태로 표시 할때 사용됩니다. 여기에 있는 버튼은 독립적으로 이벤트를 처리 할수있습니다. 이벤트는 델리게이트 메소드로 처리합니다.일반버튼처럼 액션을 연결하는 것은 불가능합니다
        //detailDisclosureButton  앞에서 설명한 두스타일이 결합된 스타일입니다.
        //checkmark 선택 상태를 표시 할떄 주로 사용합니다.
        //4가지 악세사리뷰는 스탠다드 악세사리뷰로 분류하는데 커스터마이징 범위가 매우 제한적입니다 컬러를 설정하는것을 빼면 다른것은 불가능합니다. 그리고 컬러를 변경할때도 악세사리뷰에 직접 접근하는건 불가능하고 셀의 틴트 컬러를 설정해야됩니다.
            
        }
    
        
        return cell
    }
}
//디테일 버튼을 터치했을때 이벤트를 처리하겠습니다. 설명했던것처럼 디테일 버튼에 직접액션을 연결하는것은 불가능하고 UITableViewDelegate에 선언 되어있는 메소드에서 구현해야합니다.
extension AccessoryViewViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //이 메소드는 셀을 선택했을때 호출됩니다. 푸시방식으로 화면을 전환 하겠습니다. 조금전에 추가한 Segue중에서 PushSegue를 실행하겠습니다.
        performSegue(withIdentifier: "PushSegue", sender: nil)
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        //이 메소드는 셀에 있는 디테일 버튼을 터치했을떄 호출됩니다. 셀을 터치하면 새로운 화면을 푸시 방식으로 표시하고 디테일 버튼을 터치하면 모달 방식으로 표시해보겠습니다.
        performSegue(withIdentifier: "ModalSegue", sender: nil)
    }
}
//디테일 버튼을 사용하는 셀에서는 디테일 버튼의 동작과 셀 선택 동작을 일치시켜주는것이 좋습니다 . 지금처럼 디테일 버튼을 터치했을떄 새로운 창이 모달로 표시된다면 여기에서 셀을 선택했을떄도 같은 방식으로 구현하는 것이 좋습니다.여기에서 구현했던 메소드를 보면 두번째 파라미터를 통해서 이벤트가 발생한 셀의 인덱스패스를 전달하고 있습니다.이 값을 활용해서 앞에서 언급했던 두가지 내용을 구현 할수 있습니다.



















