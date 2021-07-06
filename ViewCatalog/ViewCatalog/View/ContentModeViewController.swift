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
//컨텐츠 모드 비교 버튼을 누를떄마다 컨텐츠 모드 별 비교를 한다
class ContentModeViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var modeLabel: UILabel!
    
    @IBAction func switchMode(_ sender: Any) {
        //스위치 모드를 누르면 컨텐츠 모드를 순서대로 업데이트 하게 만들기
        //현재 모드에 저장된 로벨류를 상수에 저장
        let currentMode = imageView.contentMode.rawValue
        //1을 더해서 새로운 모드 생성
        let newMode = UIView.ContentMode(rawValue: currentMode + 1) ?? .scaleAspectFill//기본값 지정
        //이어서 이미지뷰의 컨텐츠 뷰를 새로운 모드로 설정
        imageView.contentMode = newMode
        //메소드 호출
        updateModeLabel()
    }
    
    func updateModeLabel() {
        switch imageView.contentMode {
        case .scaleToFill:
            modeLabel.text = "Scale to fill"
            //프레임 전체를 채우고 종횡비를 유지하지 않음 , 그래서 이미지가 찌그러져 보임 거의 사용하지 않음
        case .scaleAspectFit:
            modeLabel.text = "Aspect fit"
            //종횡비 유지 이미지프레임 너비에 채워서 적용
        case .scaleAspectFill:
            modeLabel.text = "Aspect fill"
            //종횡비 유지 프레임전체를 빈공간 없이 채움 종횡비가 다르다면 이미지 일부가 프레임 외부에 그려짐
        case .redraw:
            modeLabel.text = "Redraw"
            //캐시를 사용하지 않고 항상 컨텐츠를 다시 그림 반드시 사용할경우가 아니라면 사용 X 느려짐
        case .center:
            modeLabel.text = "Center"
            //중앙 생성
        case .top:
            modeLabel.text = "Top"
        case .bottom:
            modeLabel.text = "Bottom"
        case .left:
            modeLabel.text = "Left"
        case .right:
            modeLabel.text = "Right"
        case .topLeft:
            modeLabel.text = "Top left"
        case .topRight:
            modeLabel.text = "Top right"
        case .bottomLeft:
            modeLabel.text = "Bottom left"
        case .bottomRight:
            modeLabel.text = "Bottom right"
        @unknown default:
            fatalError()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.borderColor = UIColor.blue.cgColor
        imageView.layer.borderWidth = 2
        
        updateModeLabel()
    }
}
