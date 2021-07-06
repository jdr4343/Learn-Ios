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


class CustomCellViewController: UIViewController {
    
    let list = WorldTime.generateData()
    //list 속성에 구현에 필요한 데이터 저장
 //보통 뷰와 연결하는 아울렛은 뷰컨트롤러에 속성으로 추가됩니다.
    
    @IBOutlet weak var listTableView: UITableView!
    
    //@IBOutlet weak var timeLabel: UILabel!
    //아울렛은 반복되는 컨텐츠와 연결할수 없음.이 레이블은 프로토타입 셀에 포함 되어있음 이셀은 테이블뷰에서 반복적으로 호출되는 템플릿으로 사용됩니다.그래서 지금처럼 뷰 컨트롤러와 연결하면 타입레이블 아울렛으로 접근했을떄 몇번쨰 셀에 포함되어 있는 레이블에 접근해야되는지 알수가 없습니다 셀에 추가되어있는 뷰와 아울렛을 연결할떄는 커스텀 셀 클래스를 만든후 이클래스와 연결해야 합니다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}



//테이블 뷰 구현에 필요한 코드
extension CustomCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TimeTableViewCell //다운캐스팅 코드를 추가하겠습니다.이렇게 하면 셀상수를 통해서 아울렛속성에 접근할수 있습니다.
        
 //커스텀 셀에서는 textLabel 과 detailTextLabel 사용할수 없습니다. 이부분은 주석처리 하겠습니다.
        let target = list[indexPath.row]
        //아울렛으로 레이블에 접근해서 텍스트를 설정해야 됩니다. 아울렛과 연결된 속성은 TimeTableViewCell 클래스에 선언되어 있습니다. 그리고 이클래스는 프로토타입 셀 클래스로 설정되어 있습니다.
        
        //dequeueReusableCell 코드는 재사용큐에 들어있는 셀을 리턴해주는데 실제로는 TimeTableViewCell 인스턴스 이지만 이메소드가 리턴할떄는 UITableViewCell 클래스로 업캐스팅해서 리턴 해줍니다.그런데 UITableViewCell 클래스에는 dateLabel이나 timeLabel 속성은 선언되어 있지 않습니다. 그래서 필요한 아울렛에 접근하기 위해서 실제 클래스로 다운 캐스팅 해야합니다.
        cell.dateLabel.text = "\(target.date), \(target.hoursFromGMT)시간"
        cell.locationLabel.text = target.location
        cell.ampmLabel.text = target.ampm
        cell.timeLabel.text = target.time
        // 아울렛으로 레이블에 접근해서 연관 값을 표시하겠습니다.
        
        
        
        
        
        
       // cell.textLabel?.text = target.location
      // cell.detailTextLabel?.text = "\(target.date) \(target.time)"
        
        /*
 태그를 통해서 레이블에 접근한 다음에 텍스트를 설정 하겠습니다.
        if let dateLabel = cell.viewWithTag(100) as? UILabel {
            //viewWithTag 메소드는 태그를 통해서 뷰를 검색한다음에 검색된 뷰를 유아이 뷰 형식으로 리턴합니다. 그래서 지금 처럼 실제 형식인 UILable로 타입캐스팅이 필요합니다.
            dateLabel.text = "\(target.date), \(target.hoursFromGMT)시간"//날짜와 시차를 함께 표시 하겠습니다.
        }
        if let locationLabel = cell.viewWithTag(200) as? UILabel {
            locationLabel.text = target.location
        }
        if let ampmLabel = cell.viewWithTag(300) as? UILabel {
            ampmLabel.text = target.ampm
            
        }
        if let timeLabel = cell.viewWithTag(400) as? UILabel {
            timeLabel.text = target.time
            
        }
        뷰 태깅은 커스텀셀에서 뷰에 접근하기 위한 좋은 수단입니다. 하지만 태그를 직접 설정해야되고 타입캐스팅이 필요하다는 단점이 있습니다.그리고 셀을 포함된 뷰의 숫자가 늘어날수록 코드가 그만큼 복잡해집니다 그래서 대부분의 경우에는 아울렛을 연결하는 방식으로 구현합니다.셀에 포함되어 있는 뷰의 아울렛을 연결할때에는 연결대상이 중요 합니다.
 */
        return cell
    }
}
