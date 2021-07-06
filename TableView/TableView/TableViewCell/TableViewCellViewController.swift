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

 //TableViewCell은 UITableViewCell 클래스의 인스턴스이고 테이블뷰에서 한줄의 개별적으로 표시되는 뷰 입니다. 4개의 기본 스타일을 제공하는데 이스타일을 그대로 사용하거나 원하는 UI를 직접 구성할수 있습니다.셀내부는 3구역으로 구분합니다. 기본상태에서는 ContentView가 셀 프레임 전체를 차지합니다 cellUI를 구성할 떄는 대부분 ContentView 내부에서 구성합니다 셀은 다양한 AccessoryView를 가지고 있습니다 AccessoryView는 언제나 셀 오른쪽에서 표시됩니다. 기본적으로 제공되는 Stendard AccessoryView를 사용하거나 직접 custom AccessoryView를 구성하는것도 가능합니다.
 
 //편집모드에서는 왼쪽에 editing Control이 표시 됩니다. 그리고 편집모드에 따라서 오른쪽에 삭제버튼이나 정렬버튼이 추가됩니다. 지금까지 설명한 3구역에서 ContentView는 UI 구성에 제한이 없습니다. 하지만 양쪽의 표시되는 컨트롤들은 미리 지정되어있는 스타일을 고정으로 사용하기 떄문에 컬러를 바꾸거나 타이틀을 바꾸는것 처럼 매우 제한적인 커스터마이징만 허용됩니다.

 //UI KIt에는 기본적인 4가지 셀스타일을 제공합니다. 기본스타일은 레이블과 이미지뷰로 구성되어 있고 스타일에 따라서 레이블의 수와 배치 방식이 조금씩 달라집니다. 셀에 표시할 이미지를 지정하지 않은 경우에는 이미지뷰가 프레임을 차지 하지 않습니다. 직접 이미지를 지정하면 레이블 왼쪽에 이미지 뷰가 추가됩니다. 기본 스타일에 속한 모든 뷰는 클래스와 선언되어있는 속성과 아울렛으로 연결되어 있습니다 커스텀셀을 구현하고 아울렛을 연결할때는 기본 스타일 아울렛 이름과 충돌하지 않는 이름을 사용해야합니다.
 

import UIKit

class TableViewCellViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    let list = ["iPhone", "iPad", "Apple Watch", "iMac Pro", "iMac 5K", "Macbook Pro", "Apple TV"]
    //문자열 저장
//이 메소드는 셀을 선택한 상태에서 새로운 화면으로 전환되기 직전에 호출됩니다.그리고 segue를 실행시킨 셀이 여기에 있는 sender 파라미터로 전달 됩니다. 선택한 셀에 해당하는 데이터를 전달하려면 배열에서 몇번째 인덱스에 저장되어있는지 알아야합니다. 먼저 sender 파라미터를 실제 형식인 UITableViewCell로 타입캐스팅 하겠습니다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            //이어서 TableView에서 indexpath for메소드 호출
            if let indexpath = listTableView.indexPath(for: cell) {
            //indexPath(for: cell) 메소드는 cell을 파라미터로 받아서 해당 셀의 indexpath를 Optional로 return 합니다.이제 indexPath를 통해서 전달할 요소의 index를 파악할수 있습니다. 마지막으로 디테일 신으로 데이터를 전달하겠습니다.
            if let vc = segue.destination as? DetailViewController {
                vc.value = list[indexpath.row]
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
}


//문자열을 테이블뷰에 표시하는 기본코드
extension TableViewCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //textLabel 속성을 통해서 Label에 접근한다음 텍스트를 설정하고 있음 이렇게 하면 베이직 스타일이 기본적으로 제공하는 Label에 여기에서 지정한 문자열이 표시 됩니다.
        cell.textLabel?.text = list[indexPath.row]
        //만약 이미지를 표시하고 싶다면 이렇게 원하는 이미지를 설정합니다.
        cell.imageView?.image = UIImage(systemName: "star")
        
        return cell
        
    }
}

//이번에는 특정셀에 접근하는 방법에 대해서 알아보겠습니다. UITableView 클래스는 셀에 접근할때 사용되는 다양한 메소드를 제공합니다.

//코드를 보면 UITableViewDelegate 익스텐션이 추가되어 있고 didSelectRowAt 메소드가 추가되어 있습니다. 이메소드는 셀을 선택할때마다 반복적으로 호출됩니다. 여기에서 선택한 셀에 접근한 다음 레이블에 표시된 텍스트를 콘솔에 출력하겠습니다.
extension TableViewCellViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ///Delegate에게 행이 선택되었음을 알립니다.
        //먼저 두번쨰 파라미터로 전달된 indexPath를 통해서 지정된 위치에 있는 셀에 접근해야 합니다.
        //cellForRow 메소드는 파라미터로 전달된 indexPath에 셀이 있는지 확인하고 셀이 있다면 그셀을 리턴해줍니다 반대로 해당위치에 셀이 존재 하지 않는다면 nil을 리턴합니다.
       //그리고 메소드가 리턴하는 셀의 형식은 UITableViewcell이 있고 이클래스가 제공하는 속성을 통해서 원하는 셀 정보에 접근합니다.
        if let cell = tableView.cellForRow(at: indexPath) {
            
            //프린트 함수를 통해서 레이블에 표시된 텍스트를 콘솔에 출력하겠습니다.
            print(cell.textLabel?.text ?? "")
            
            
            //이제 셀을 선택하면 해당 레이블에 있는 텍스트가 이렇게 콘솔에 출력 됩니다.우리가 방금 구현했던 코드를 다시한번 보면 (at: indexPath)를 통해서 셀을 얻고 있죠. 이코드와 반대로 셀을 통해서 indexPath를 얻어야 하는 경우도 있습니다 가장 대표적인 예는 셀과 씬이 segue로 연결되어 있고 TableView에 바인딩 되어있는 데이터를 새로운 씬으로 전달하는 코드입니다.
            
            //앞에서 사용했던 두가지 메소드 외에도 위치나 조건을 기반으로 셀과 인덱스 패스를 리턴하는 메소드를 제공합니다.

            //listTableView.indexPathForRow(at: CGPoint)  이 메소드는 CGPoint 구조체로 특정 좌표를 지정합니다 지정한 좌표에 셀이 있다면 indexPath를 리턴하고 없다면 nil을 리턴합니다
            //listTableView.indexPathsForRows(in: CGRect)  이 메소드는 프레임을 지정합니다.프레임안에 포함된 셀이 있다면 indexPath를 배열로 리턴하고 없다면 nil을 리턴합니다.
            //listTableView.visibleCells                    이 속성은 화면에 표시되어 있는 셀을 배열로 리턴합니다.
            //listTableView.indexPathsForVisibleRows        화면에 표시된 셀에 indexPath가 필요하다면 이속성을 사용합니다.
        }
    }
        //스토리보드에서 background 옵션이 default로 설정 되어 있는데 라이트 모드에서는 흰색으로 표시되고 다크모드에서는 검정색으로 표시됩니다.여기에서 원하는 컬러를 직접 선택하거나 아니면 background 컬러속성을 통해서 코드에서 설정할수 있습니다. 모든셀에 동일한 background 컬러를 사용한다면 background 옵션을 통해서 설정하는 것이 가장 좋습니다.
        
        //코드에서 설정해야한다면 보통은 awake from 메소드에서 구현합니다 반대로 셀마다 background 컬러를 개별적으로 설정해야한다면 cellforRowat 구현하거나 아니면 WilldisplayRowat 메소드에서 구현합니다.여기에서는 두번쨰 메소드에서 두가지 백그라운드 컬러를 번갈아 가면서 지정해 보겠습니다.
        
    //그리고 여기에서 백그라운드 컬러를 설정하는 코드를 작성하겠습니다
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            if indexPath.row.isMultiple(of: 2) {
                cell.backgroundColor = UIColor .systemBackground
            }else{
                cell.backgroundColor = UIColor.secondarySystemBackground
                //흰색과 회색배경이 번갈아가면서 나옵니다.
            }
        
    }
}















