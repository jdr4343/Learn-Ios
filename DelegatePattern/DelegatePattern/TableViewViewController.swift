///  델리게이트 패턴에서 객체는 다른 객체를 자신의 대리자로 지정합니다. 그리고 자신이 제공하는 일부 기능을 대리자가 대신 수행하도록 위임 합니다.

//Ios 앱개발에서 댈리게이트 패턴을 사용하는 대표적인 예는 테이블뷰입니다 테이블뷰에 표시된 항목을 선택했을떄 실행해야하는 작업은 정말 다양합니다. 보통 채팅앱에서는 테이블뷰에 대화방목록을 표시하고 항목을 선택하면 대화방으로 이동하도록 구현합니다 쇼핑앱에서는 상품목록을 표시하고 항목을 선택하면 상세화면으로 이동하거나 아니면 장바구니에 상품을 추가 하도록 구현합니다.
 
 //테이블뷰는 사용자가 항목을 선택했을때 어떤 작업을 해야할지 알지 못합니다 모든 작업을 모은다음에 공통적인 부분만 뽑아내서 일반화 시키는것도 불가능합니다. 그래서 이부분을 대리자에게 위임합니다.

 //델리게이트 패턴에서는 두개의 객체가 존재합니다. 기능을 구현하는 테이블뷰와 테이블뷰의 일부기능을 대신 수행하는 델리게이트 객체를 두고 설명하겠습니다.
 
 //다른객체의 기능을 위임할수있는 객체를 보면 ..delegat  접미어나 ..dataSourse 접미어를 가진 속성이 있습니다. 이속성에 위임할 객체를 저장하는 방식으로 델리게이트를 지정합니다. 테이블뷰는 사용자가 항목을 선택했을때 델리게이트로 지정된 객체에게 처리를 요청합니다 사람 처럼 말로 요청할수는 없고 메소드를 호출하는 방식으로 요청합니다.

 //바꿔말하면 델리게이트 객체는 테이블뷰가 호출하는 메소드를 구현해야됩니다. 특정시점에 호출되는 메소드는 프로토콜로 선언되어있습니다. 델리게이트 객체는 반드시 프로토콜에 선언되있는 그대로 메소드를 구현해야됩니다.

// 보통 메소드를 구현하면 필요한 시점에 우리가 직접 호출하죠 하지만 델리게이트 패턴으로 구현한 메소드는 우리가 직접 호출하지 않습니다.

// 객체에서 이벤트가 발생하면 이객체는 자신의 델리게이트로 지정된객체에서 이벤트를 처리하는 메소드가 구현되어있는지 확인합니다. 만약 메소드가 구현되어 있다면 해당 메소드를 호출합니다. 반대로 구현되어 있지않다면 그냥 이벤트를 무시하거나 경우에따라서 크래시가 발생하기도 합니다.

// 여기에서는 테이블뷰가 델리게이트에 구현되어 있는 메소드를 호출합니다. 이부분을 이해하는 것이 핵심입니다. 이론적인 부분을 이해하고 나면 실제로 델리게이트 패턴을 구현하는것은 상대적으로 간단합니다. 먼저 개발자 문서를 통해서 델리게이트가 필요한지 확인합니다. 델리게이트가 필요하다면 구현해야하는 메소드가 선언되어 있는 프로토콜을 확인 합니다. 그런다음 인터페이스 빌더에서 두객체를 연결하거나 코드를 통해서 연결합니다. 테이블뷰처럼 화면에 표현되는 컨트롤들은 보통 자신이 포함되어 있는 뷰 컨트롤러를 델리게이트로 지정합니다. 마지막으로 델리게이트로 지정된 객체에서 프로토콜 을 구현합니다.
 




import UIKit

class TableViewViewController: UIViewController {
    
    let list = ["Apple", "Google", "Microsoft"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
//프로토콜 구현은 클래스 선언에 직접 추가해도 되지만 보통은 익스텐션으로 추가합니다 이렇게 하면 코드가 조금더 깔끔해집니다

//여기에 새로운 익스텐션을 추가하고 UITableViewDataSource 프로토콜을 채용하도록 선언 하겠습니다.이제 여기에서 프로토콜에 선언되어있는 메소드를 구현해야되는데 UITableViewDataSource에는 두개의 필수 메소드가 선언 되어있습니다. 에러를 클릭하고 픽스를누르면 필수메소드가 자동으로 입력됩니다
extension TableViewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
        //첫번째 메소드에서는 리스트의 카운트를 리턴하겠습니다
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row]
        return cell
        
        //여기에서 핵심은 테이블뷰가 호출한다는 것입니다 테이블뷰는 몇개의 셀을 표시해야 되는지 모를때 첫번째 메소드를 호출합니다. 여기에서 백을 리턴하면 백개의 셀을 표시되고 지금처럼 리스트 배열의 길이를 리턴하면 배열에 3가 저장 되어있으니까 3개의 셀이 표시됩니다 그리고 테이블뷰는 이어서 실제로 화면에 표시할 셀을 데이터 소스에게 요청합니다.이 경우에는 두번째메소드로 호출하는데 여기에서 셀을 구성하고 리턴하면 테이블 뷰가 이셀을 자신의 프레임에 표시합니다.
    }
    
}


//다시 아래쪽에 새로운 익스텐션을 추가하고 이번에는 UITableViewDelegate 프로토콜을 채용하도록 선언 하겠습니다.
extension TableViewViewController: UITableViewDelegate {
    //그런다음 프로토콜에 선언되어 있는 메서드를 추가하고
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //여기에서 셀에 표시되어있는 텍스트를 콘솔에 출력되도록 구현하겠습니다
        
        print(list[indexPath.row])
        //사용자가 테이블뷰에서 셀을 선택하면 테이블뷰는 직접이벤트를 처리하지 않고 이메소드를 출력합니다 다시말해서 델리게이트로 지정된 뷰 컨트롤러에게 이벤트 처리를 위임합니다.
    }

}
//지금은 단순하게 로그를 출력하고 있지만 여기에서 대화창으로 이동하는 코드를 구헌해도 되고 장바구니에 상품을 넣는 코드를 구현해도 되겠죠 구현하는 앱에 따라서 메소드의 내부 구현은 달라지지만 델리게이트 패턴을 구현하는 방법은 동일 합니다.
    
//이제 왜 델리게이트 패턴을 사용하는지 생각해 보겠습니다. 테이블뷰는 화면에 표시되는 셀을 직접 만들지 않고 이메소드를 통해서 델리게이트에게 요청합니다 테이블뷰가 셀을 직접 만들어야한다고 가정해 보겠습니다.

//카카오톡을 보면 친구목록과 대화창 목록을 테이블 뷰로 표시하고 있습니다 페이스북 메신저나 라인 메신저도 동일한 목록을 테이블뷰로 표시하고 있지만 셀디자인과 표시되는 정보는 파이가 있습니다 만약 테이블뷰가 셀을 직접 만들어야 한다면 이런 모든디자인이 클래스메 모두 구현 되어 있어야 하는데 앱에서 사용할 디자인을 예측해서 클래스에 미리구현해두는건 불가능합니다.
    
//하지만 델리게이트 패턴으로 구현하면 테이블 뷰는 셀 디자인을 신경,쓸필요가 없습니다 셀구성을 위임받은 델리게이트는 원하는 데이터와 디자인으로 셀을 구성한다음 리턴하고 테이블뷰는 단순히 리턴된 셀을 받아서 화면에 출력합니다 모든앱이 자신만의 독특한 디자인과 데이터로 목록을 표시 할수 있는 이유는 바로 델리게이트 패턴 때문입니다.

//셀을 선택했을때 어떤 앱은 다른 화면으로 이동하고 또다른 어떤앱은 선택상태를 바꿉니다. 그리고 화면이동이라 할지라도 대상화면이 항상 동일한것은 아니죠. 만약 이부분을 테이블뷰가 직접 처리한다면 테이블뷰 클래스 내부에 모든 경우의 수를 처리하는 코드가 구현되어 있어야합니다.
    
//셀디자인과 마찬가지로 이것도 불가능 합니다 대신 테이블 뷰는 셀이 선택되었다는것을 델리게이트에게 알려주고 델레게이트는 테이블뷰를 대신해서 이벤트를 처리합니다 여기에서는 단순히 콘솔을 출력하는 코드를 구현 했지만 화면 이동 코드를 구현하거나 앱셩격에 따라서 다양한 코드를 자유롭게 구현 하면 되겠죠 델리게이트 패턴의 장점을 요약하면 개발의 유연성이 증가합니다 데이터를 원하는 방식으로 출력할수 있고 이벤트 처리도 아무런 제약 없이 자유롭게 구현 할수 있습니다.


 //Tells the delegate the table view is about to draw a cell for a particular row.  :  테이블뷰가 특정한 행에 칸을 그리려고 한다는 것을 Delegate에게 알립니다.
func tableView(_ tableView: UITableView,willDisplay cell: UITableViewCell,forRowAt indexPath: IndexPath) {}
//indexPath : 테이블뷰에서 행의 정확한 위치를 찾는 인덱스 경로입니다. The table view informing the delegate of this impending event.
//tableView : 이 테이블뷰는 곧다가올 이벤트를 Delegate에게 알려줍니다. An index path locating the row in tableView.

//Asks the delegate to return the level of indentation for a row in a given section.  :  지정된 섹션에 들여쓰기한 행의 수준을 되돌릴것을 Delegate에게 요청합니다.
func tableView(_ tableView: UITableView,indentationLevelForRowAt indexPath: IndexPath) -> Int {1}
//tableView : 정보를 요청하는 테이블 뷰입니다.  The table view requesting this information.
//indexpath : 테이블 뷰에서 정확한 행을 찾습니다. An index path locating the row in tableView.

//Called to let you fine tune the spring-loading behavior of the rows in a table. : 테이블 행의 문자열 로딩 동작을 미세조정할 수 있도록 호출됩니다.
func tableView(_ tableView: UITableView,shouldSpringLoadRowAt indexPath: IndexPath,with context: UISpringLoadedInteractionContext) -> Bool {true}
//tableView : 상호작용이 발생하는 테이블 뷰 위치입니다.  The table view where the interaction is occurring.
//indexpath :  인덱스 경로의 행에 문자열 로딩 동작을 고려한다.  The index path of the row whose spring-loading behavior is being considered.
//context : context(맥락) 목적어는 너가 문자열 로딩 동작을 수정할수 있게해준다.목적어를 사용하면 문자열 로딩 애니메이션이 관련된 행이 일어날 장소를 명시한다. :  A context object that you can use to modify the spring-loading behavior.Use this object to specify the location for spring-loading animations associated in the row.

//Tells the delegate a row is about to be selected.  :  행이 선택 될 예정임을 Delegate에게 알립니다.
func tableView(_ tableView: UITableView,willSelectRowAt indexPath: IndexPath) -> IndexPath? {indexPath}
//tableView : 테이블뷰는 곧닥칠 선택에 대해 Delegate에게 알립니다.  A table view informing the delegate about the impending selection.
//index path : 테이블 뷰에서 행의 정확한 위치를 찾는 인덱스 경로 입니다.  An index path locating the row in tableView.

//Tells the delegate a row is selected  :   delegate에게 선택된 행을 알립니다.
func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {}
//tableView : Delegate에게 새롭게 선택된행을 통보하는 테이블뷰.  A table view informing the delegate about the new row selectio
//indexPath : 테이블뷰 에서 새롭게 선택한 행을 찾아내는 인덱스 경로.  An index path locating the new selected row in tableView.

//Tells the delegate that a specified row is about to be deselected.  : 지정된 행을 선택취소 할것을 Delegate에게 알립니다
func tableView(_ tableView: UITableView,willDeselectRowAt indexPath: IndexPath) -> IndexPath? {return indexPath}
//tableView : 임박한 선택된 행의 취소를 Delegate에게 알리는 테이블뷰.  A table view informing the delegate about the impending deselection.
//indexPath : 테이블 뷰안의 선택 취소할 행의 위치를 찾아내는 인덱스 경로.  An index path locating the row in tableView to be deselected.

//Tells the delegate that the specified row is now deselected.  :  지정된 행이 선택취소 되었음을 Delegate에게 알립니다.
func tableView(_ tableView: UITableView,didDeselectRowAt indexPath: IndexPath) {}
//tableView : A table view informing the delegate about the row deselection.
//indexPath : An index path locating the deselected row in tableView.

//Asks the delegate whether the user can use a two-finger pan gesture to select multiple items in a table view.
//사용자가 두 손가락 이동 제스처를 사용하여 테이블보기에서 여러 항목을 선택할 수 있는지 Delegate에게 묻습니다.
func tableView(_ tableView: UITableView,shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {false}
//tableView :  메서드를 호출하는 테이블뷰. The table view calling this method.
//indexPath : 시용자가 두손가락 이동 제스터를 시작하기 위해 터치한 행의 인덱스 경로 입니다.  The index path of the row that the user touched to start the two-finger pan gesture.

//Tells the delegate when the user starts using a two-finger pan gesture to select multiple rows in a table view.
//사용자가 두 손가락 이동 제스처를 사용하여 테이블보기에서 여러 행을 선택하기 시작할 때 Delegate에게 알립니다.
func tableView(_ tableView: UITableView,didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {}
//tableView : 메서드를 호출하는 테이블 뷰.   The table view calling this method
//indexPath :사용자가 두손가락 이동 제스처를 시작하기 위해 터치한 항목의 인덱스 경로. The index path of the item that the user touched to start the two-finger pan gesture.

//Tells the delegate when the user stops using a two-finger pan gesture to select multiple rows in a table view.
//사용자가  두손가락 이동 동작을 사용하여 테이블뷰에서 여러 행의 선택을 멈추면 Delegate에게 알려줍니다.
func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView) {}
//tableView : 메서드를 호출하는 테이블 뷰. The table view calling this method.

//Asks the delegate for a view to display in the header of the specified section of the table view.
//테이블뷰에 지정된 섹션안의 머리글에 표시할것을 Delegate에게 요청합니다.
func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {return nil}
//tableView : 보기를 요청하는 테이블뷰 입니다.  The table view asking for the view.
//section : 헤더뷰에 들어가있는 섹션안의 인덱스 번호.  The index number of the section containing the header view.

//Asks the delegate for a view to display in the footer of the specified section of the table view.
//테이블뷰에 지정된 섹션안의 꼬리글에 표시할것을 Delegate에게 요청합니다.
func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {return nil}
//tableView : 보기를 요청하는 테이블 뷰.  The table view asking for the view.
//section : 푸터뷰에 들어가 있는 섹션안의 인덱스 번호. The index number of the section containing the footer view.

//Tells the delegate that the table is about to display the header view for the specified section.
//테이블이 지정된 섹션에 대한 머리글을 표시하려고 함을 Delegate에게 알립니다.
func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {}
//tableView : 델리게이트에게 이벤트를 알리는 테이블 뷰.  The table view informing the delegate of this event.
//view :머리글이 표시될 뷰 The header view that is about to be displayed.
//section : 헤더 뷰가 들어있는 섹션의 인덱스 번호.  The index number of the section containing the header view.

//Tells the delegate that the table is about to display the footer view for the specified section.
//테이블에 지정된 섹션에 대한 꼬리글을 표시하려고 함을 Delegate에게 알립니다.
func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {}
//tableView : 델리게이트에게 이벤트를 알리는 테이블 뷰. The table view informing the delegate of this event.
//view : 꼬리글이 표시될 뷰 TThe footer view that is about to be displayed.
//section : 꼬리 뷰가 들어있는 섹션의 인덱스 번호. The index number of the section containing the footer view.




























