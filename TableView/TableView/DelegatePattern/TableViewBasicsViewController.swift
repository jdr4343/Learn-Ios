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


//  보통 데이터를 공급하는 델리게이트를 DataSource라 부름
// UITableViewDataSource 프로토콜 :  https://developer.apple.com/documentation/uikit/uitableviewdatasource/

//테이블 뷰를 구현하는 순서 정리
//1. 스토리 보드에서 테이블 뷰를 화면에 추가하고 원하는 크기로 배치
//2. 두번째 단계에서는 새로운 프로토타입 셀을 추가하고 원하는 방식으로 구사
//3. 프로토콜 타입 셀에 셀아이덴티 파이어 설정
//4. 테이블 뷰에 데이터 소스 지정 그리고 필요에 따라서 델리게이트도 함께 지정
//5. 데이터소스로 지정된 클래스에서 UITableViewDataSource 프로토콜에 선언되어있는 필수 메소드 구현

import UIKit
//테이블 뷰와 연결된 뷰 컨트롤러에서 프로토콜 메소드 구현
class TableViewBasicsViewController: UIViewController {
    
    let list = ["iPhone", "iPad", "Apple Watch", "iMac Pro", "iMac 5K", "Macbook Pro", "Apple TV"]
    //리스트 속성에 문자열 속성 저장
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
//새로운 익스텐션 추가 UITableViewDataSource 프로토콜 채용 , 에러 나오는이유 필수 메소드가 구현이 안되서
extension TableViewBasicsViewController: UITableViewDataSource {
    //필수 메소드를 반드시 구현 해야됨
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ///Tells the data source to return the number of rows in a given section of a table view.
        ///테이블 뷰의 정해진 섹션에 행의 숫자를 리턴하도록 DataSourse에게 지시합니다.
        
        print("#1", #function)
        //호출되는 시점을 파악할수 있도록 로그 표시 , #1 메소드로 표시
        
        return list.count
        //첫번째 메소드에서는 섹션에 표시할 셀 개수를 리턴 여기에서 0을 리턴하면 아무것도 표시하지않고 100을 리턴하면 셀 100개를 표시함
        //리스트 배열에 저장되있는 문자열 표시 리스트 배열의 카운트 리턴
        
        //로그에서 1번 메소드는 테이블 뷰가 초기화 되거나 리로드 데이터 메시지를 호출해서 전체데이터를 갱신할떄 호출 됩니다
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        ///Asks the data source for a cell to insert in a particular location of the table view.
        ///테이블 뷰의 특정한 위치에 셀을 삽입하도록 Data sourse에게 요청합니다

        
        //UITableViewCell 테이블 뷰셀은 이클래스로 구현되어 있음 커스텀 셀을 만들때는 반드시 이클래스를 상속 해야됨.
        print("#2", #function)
        //보통 새로운 뷰를 만들떄는 생성자를 사용함. 하지만 셀을 생성할떄에는 테이블 뷰에게 요청 해야함 테이블 뷰는 메모리를 효율적으로 사용하고 성능을 높이기 위해서 재사용 메커니즘을 사용함 테이블뷰는 내부에 재사용 큐를 관리하면서 셀을 요청할떄마다 큐에 저장되어 있는 셀을 리턴함. 만약에 요청시점에 저장되어있는 셀이 없다면 프로토타입 셀을 기반으로 새로운 셀을 만들어 리턴해줌
        //두번째 메소드에서는 셀을 생성하고 셀에 표시할 데이터를 설정한 다음 리턴 해야됨
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //이메소드를 통해서 새로운 셀 요청 첫번째 파라미터에는 Identifire 리턴 만약 여기에서 전달한 식별자를 가진 프로토콜 셀이 존재하지 않는다면 크래시 발생 이어서 두번째 파라미터에는 델리게이트 메소드로 전달된 인덱스 패스를 그대로 전달 여기에서 indexpath는 셀의 위치를 저장하는 타입. 셀의 위치는 섹션인덱스와 로우인덱스의 조합으로 표현하고 각각 섹션 속성과 로우 속성에 저장되어있음.
        
        //테이블 뷰는 dequeueReusableCell 메소드가 호출 되었을때 재사용 큐를 확인합니다 리턴할셀이 있다면 그대로 리턴하고 셀이 없다면 프로토타입 셀을 기반으로 새로운 셀을 만들어 리턴합니다.테이블뷰가 처음 표시될때에는 재사용 큐에 셀이 없기 떄문에 화면에 표시되는 셀 숫자만큼 새로운 셀을 만들어 리턴합니다.
        
        //테이블뷰는 화면에서 사라진 셀을 재사용 큐에 추가할때 별다른 작업을 하지 않고 그대로 저장합니다.100개의 셀을 만든다 가정했을때 화면에 나와있는 셀이 화면에서 사라질때 재사용 셀이 되고 화면을 스크롤 할떄 재사용 됩니다. 재사용 셀에는 인덱스에서 출력했던 문자열이 남아있습니다.
        
        // cell.textLabel?.text = "\indexPath.section) - \(indexPath.row)" 레이블을 텍스트로 적절한 값으로 바꿔서 리턴 지금까지 공부한 재사용 매커니즘을 사용하면 화면에 표시할 셀과 한두개의 버퍼만 추가로 있으면 이론상으로 무한개의 셀을 성능저하없이 표시하는게 가능해집니다. 그리고 제한된수의 셀을 생성하고 재사용 하기때문에 메모리 사용량도 줄어들고 오버헤드도 거의 발생하지 않음.하지만 현실적으로 보면 천개 이상의 셀을 표시 할떄는 구현에따라 성능저하가 발생할수 있기 때문에 코드 최적화에 신경써야합니다. 특히 여기있는 2번메소드는 최대한 가볍게 구현해야됨 스크롤 성능에 영향을 주지 않으려면 최대 16밀리세컨드안에 모든 작업을 완료하고 리턴해야함 이메소드에서 파일을 로딩하거나 아니면 네트워크에서 다운로드 하는 코드를 동기 방식으로 구현했다면 스크롤 성능이 심각하게 낮아집니다. 그래서 빠르게 처리할수없는 작업들은 반드시 비동기 방식으로 처리해야됩니다.
        
        //일단 여기까지 구현하면 셀상수에 새로운 셀이 저장됨 이제 이셀에 실제 데이터를 표시할 순서인데 현재 셀상태는 베이직으로 설정되어있고 여기에는 하나의 레이블이 기본적으로 추가되어있음 이레이블에 접근하려면 이렇게.
        cell.textLabel?.text = list[indexPath.row]
        //textLabel 속성을 사용 합니다.여기에 배열에 저장되어 있는 문자열 표시
        return cell
        // 셀 리턴 테이블뷰는 여기에서 리턴하는 셀을 받아서 화면에 출력
        //2번 메소드는 새로운 셀이 화면에 표시 되는 시점에 호출
    }
    
    
}





























