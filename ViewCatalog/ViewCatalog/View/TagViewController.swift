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

class TagViewController: UIViewController {
    //체인지 컬러 메소드와 연결
    @IBAction func changeColor(_ sender: Any) {
        //Tag값을 연결 너무 많아지면 관리하기 힘듬
        if let v = view.viewWithTag(100) {
            //UI View는 view.WithTag 태그메세지를 제공 파라미터로 정수를 전달하면 뷰계층에서 동일한 태그값을 가진 뷰를 검색하고 Optional UI view로 리턴합니다.
            //각 계체마다 고유의 태그값을 지정해줘야 정확한 변환이 가능
            v.backgroundColor = .black
        }
    }
}
/*
 if let v = view.viewWithTag(100) {
이 코드에서 뷰는 뷰컨트롤러에 있는 루트뷰입니다 모든 뷰컨트롤러는 하나의 루트뷰를 가지고 있고 씬에 추가되는 모든 뷰는 루트뷰 아래쪽에 추가됩니다 루트뷰 역시 다른뷰와 마찬가지로 유아이 뷰의 인스턴스 이고 태그의 기본값은 0입니다. viewWithTag 메소드는 뷰계층에서 태그를 검색하는데 여기에서는 뷰에서 호출하고 있죠 그래서 가장먼저 루트뷰의 태그를 확인하는데 파라미터로 전달한 값과 동일하기 때문에 검색이 바로 종료됩니다 그리고 메소드가 루트뷰를 리턴하니깐 여기에는 루트뷰가 저장되고 최종적으로 루트뷰의 백그라운드 컬러가 검은색으로 설정됩니다.
 항상 가장 먼저 검색된 뷰만 검색됨(루트뷰의 태그를 개별적으로 지정해줘야 되는 이유)
 보통은 아울렛으로 접근하는 방법이 사용됨
 */
