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

class MultiSectionTableViewViewController: UIViewController {
    
    let list = PhotosSettingSection.generateData()
    //여기에는 섹션 데이터가 저장됩니다
    @objc func toggleHideAlbum(_ sender: UISwitch) {
        print(#function)
        list[1].items[0].on.toggle()
    }
    
    
    //테이블 뷰가 주는 메소드를 호출하기 위해서 아울렛 연결
    @IBOutlet weak var listTableView: UITableView!
    
    
    
    
    @objc func toggleAutoPlayVideos(_ sender: UISwitch) {
        print(#function)
        list[2].items[0].on.toggle()
    }
    
    @objc func toggleSummarizePhotos(_ sender: UISwitch) {
        print(#function)
        list[2].items[1].on.toggle()
    }
    
    @objc func toggleShowHolidayEvents(_ sender: UISwitch) {
        print(#function)
        list[3].items[1].on.toggle()
    }
    //액션 시트 표시 코드 미리 구현
    func showActionSheet() {
        let sheet = UIAlertController(title: nil, message: "Resetting will allow previously blocked people, places, dates, or holidays to once again be included in new Memories.", preferredStyle: .actionSheet)
        
        let resetAction = UIAlertAction(title: "Reset", style: .destructive, handler: nil)
        sheet.addAction(resetAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        sheet.addAction(cancelAction)
        
        if let pc = sheet.popoverPresentationController {
            if let tbl = view.subviews.first(where: { $0 is UITableView }) as? UITableView {
                if let cell = tbl.cellForRow(at: IndexPath(row: 0, section: 3)) {
                    pc.sourceView = cell
                    pc.sourceRect = tbl.frame
                }
            }
        }
        
        present(sheet, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    //셀 화면 전환후 다시 되돌아 왔을때 강조된 버튼 색 제거
    //이 메소드는 씬이 표시 되기직전에 호출 됩니다. 다른 화면으로 갔다가 돌아올때도 호출되는데 여기에서 회색으로 강조된 셀을 다시 흰색으로 바꾸겠습니다.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //이렇게 선택되어 있는 셀이 있는지 확인하고 있다면 선택을 제거하겠습니다.
       if let selected = listTableView.indexPathForSelectedRow {
            listTableView.deselectRow(at: selected, animated: true)
           // 이렇게 하면 회색으로 강조되어 있는 셀이 제거되고 흰색배경으로 돌아갑니다.
    }
   }
}

//새로운 익스텍션을 추가하고 UITableViewDataSouese 채용
extension MultiSectionTableViewViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {    ///Asks the data source to return the number of sections in the table view. 테이블 뷰안의 섹션의 수를 반환하도록 데이터소스에게 요청합니다.
        //list 배열의 카운트 리턴
        return list.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {      ///테이블 뷰의 정해진 섹션에 행의 숫자를 리턴하도록 DataSourse에게 지시합니다.
        //섹션이 하나인 경우에는 섹션을 고려할 필요가 없지만 지금 처럼 두개 이상이라면 두번째 파라미터(section)로 공개해서 섹션마다 적절한 수를 리턴해야됩니다.
        //섹션 데이터 구조체에는 items라는 배열 속성이 있고 여기에 표시할 셀 데이터가 저장되 있습니다 그래서 여기에서는 items 배열에 저장된 데이터수를 리턴하겠습니다
        
        return list[section].items.count
        //섹션 파라미터를 통해서 배열에 접근한다음 아이템즈 배열에 카운트를 리턴.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { ///Asks the data source for a cell to insert in a particular location of the table view.
        ///Required.   테이블뷰의 특정 위치에 셀을 삽입할것을 data sourse에게 요청합니다
        //셀을 구성하는 코드 구현
        //여기에서는 4개의 프로토콜 셀중에서 적합한 셀을 가져오는 것이 중요합니다. 조금전에 스토리보드에서 셀을 구성하면서 셀타입 열거형에 선언되있는 lowValue와 동일한값을 reuseidentifier로 설정했었습니다. 그리고 셀타입은 포토 셋팅 구조체에 저장되어 있습니다. 그리고 이구조체는 PhotosSettingSection 구조체의 배열로 저장되어 있습니다. 먼저 indexPath를 통해서 셀에 표시할 데이터를 가져오겠습니다
        let target = list[indexPath.section]/*여기까지만 입력하면 타겟 상수에는 섹션 데이터가 저장됨*/.items[indexPath.row]
        
        //이렇게 하면 Section데이터에 저장된 배열에서 현재 셀에 표시할 셀의 데이터를 가져옵니다 이어서 타입 속성에 저장되 있는 lowValue형식 문자열 프로토타입 셀을 가져오겠습니다.
        let cell = tableView.dequeueReusableCell(withIdentifier: target.type.rawValue, for: indexPath)
     
        //레이블에 텍스트를 설정 / 중복문
        cell.textLabel?.text = target.title
        
        //이어서 새로운 switch 문을 추가하고 type 속성으로 공개 하겠습니다.
        switch target.type {
        case .disclosure:
            //disclosure 에서는 레이블에 텍스트를 설정하고 왼쪽에 이미지를 표시 하겠습니다.
            //cell.textLabel?.text = target.title
            cell.imageView?.image = UIImage(systemName: target.imageName ?? "")
            
        case .switch:
            //switch 타입에서도 먼저 레이블에 텍스트를 설정합니다.
            //cell.textLabel?.text = target.title
            //그다음 스위치에는 accessoryView속성에 저장되어있는데 속성의 타입을 보면 OptionalUIView로 선언되있습니다. 그래서 이렇게 타입캐스팅으로 UISwitch로 타입캐스팅 한후 접근해야됩니다.
            if let switchView = cell.accessoryView as? UISwitch {
                switchView.isOn = target.on
                
                
                
                //여기에서 스위치를 바인딩 하고 있습니다. 스위치가 포함된 셀은 테이블 뷰에서 총 4개가 표시되있기 때문에 스위치마다 올바른 메소드를 연결해야됩니다 그래서 메소드를 연결하기 전에 이미 연결되어 있는 메소드들을 해지 하겠습니다.
                switchView.removeTarget(nil, action: nil, for: .valueChanged)
                //그런 다음 toggleHideAlbum 메소드와 연결 하겠습니다.
                //switchView.addTarget(self, action: #selector(toggleHideAlbum(_:)), for: .valueChanged)
                //그런데 그냥 이렇게만 연결 해버리면 모든 스위치가 이메소드와 연결 되겠죠? 이렇게 하는것이 아니라 여기에 If문을 추가하고 Section이 1이고 row가 0 (list.items)인경우에만 연결해야 합니다
                if indexPath.section == 1 && indexPath.row == 0 {
                    switchView.addTarget(self, action: #selector(toggleHideAlbum(_:)), for: .valueChanged)
                }
                if indexPath.section == 2 && indexPath.row == 0 {
                    switchView.addTarget(self, action: #selector(toggleAutoPlayVideos(_:)), for: .valueChanged)
                }
                if indexPath.section == 2 && indexPath.row == 1 {
                    switchView.addTarget(self, action: #selector(toggleSummarizePhotos(_:)), for: .valueChanged)
                }
                if indexPath.section == 3 && indexPath.row == 1 {
                    switchView.addTarget(self, action: #selector(toggleShowHolidayEvents(_:)), for: .valueChanged)
                }
                    
                   
                    
                    
                
            }
        case .action:
            break
            //cell.textLabel?.text = target.title 중복문이 많아 이부분은 잘라내기 한후 스위치문 앞으로 빼고 중복되있는 코드는 모두 삭제 하겠습니다.그리고 case 블럭을 비워두면 컴파일 오류가 발생하기 때문에 break문을 추가하겠습니다.
        
        case .checkmark:
            //셀 오른쪽에 표시되는 체크마크는 기본으로 제공하는 악세사리입니다.on 속성에 true가 저장되어있다면 체크마크를 표시하고 false 저장되어 있다면 표시되지 않도록 구현하겠습니다.
            cell.accessoryType = target.on ? .checkmark : .none
            //cell.textLabel?.text = target.title
        }
        //마지막으로 여기에서 셀을 리턴하겠습니다.
        return cell
        
    }
    //스토리에 스타일을 그룹으로 바꾼후 header와 footer를 표시하는 메서드 추가
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { ///Asks the data source for the title of the header of the specified section of the table view.
        ///테이블 뷰의 지정된 섹션의 헤더 타이틀을 데이타 소스에 요청합니다

        //메소드의 리턴형을 보면 옵셔널 스트링입니다.여기에서 문자열을 리턴하면 섹션 윗부분에 표시합니다. 반대로 nil을 리턴하거나 메소드를 아예구현 하지 않으면 헤더가 표시 되지 않습니다.
        
        //여기에서는 섹션데이터에 저장되어 있는 헤더 문자열을 리턴하겠습니다.
        return list[section].header
    }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? { /// 반대
        //섹션데이터에 저장되어 있는 푸터 리턴.
        return list[section].footer
    }
    
}
    //새로운 익스텐션을 추가하고 UITableViewDelegate 프로토콜을 채용 (액션시트)
extension MultiSectionTableViewViewController: UITableViewDelegate {
    //테이블 뷰에서 셀을 텝하면 이메소드가 호출 됩니다 선택이벤트를 처리하는 방법은 이어지는 강의에서 자세히 공부하고 여기에서는 필요한 코드만 구현 하겠습니다 이렇게 미리 구현해둔 메소드를 호출하겠습니다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 3 && indexPath.row == 0 {
        showActionSheet()
            //이렇게 deselectRow를 사용해서 선택상태를 제거하면 회색으로 강조된 부분이 사라집니다. 아이폰 설정앱에서는 애니메이션 없이 바로 사라지는데 여기에서는 두번째 파라미터로 트루를 전달해서 기본 애니메이션을 사용 하겠습니다.
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        //셀을 터치하면 체크박스가 토글되도록 구현 하겠습니다 마지막 섹션에서만 토글 되도록 If문을 토글하겠습니다.
        if indexPath.section == 4 {
            
                if let cell = tableView.cellForRow(at: indexPath) {
                    list[indexPath.section].items[indexPath.row].on.toggle()
                    cell.accessoryType = list[indexPath.section].items[indexPath.row].on ? .checkmark : . none
                    //tableView.deselectRow(at: indexPath, animated: true)

                }
        //테이블 뷰가 선택한 셀을 리턴했다면 데이터 소스부터 새로운 값으로 바꿔야 합니다. 지금은 이속성에 저장된 값에 따라서 체크마크가 표시 되고 있는데 이값을 토글메소드로 반전 시키겠습니다 그런다음 속성값에 따라서 체크메소드를 표시하거나 아무것도 표시 하지 않도록 하겠습니다.
    }
}
}


















