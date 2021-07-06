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

//MultiSection PhotosSetting
import UIKit

enum CellType: String {
    //lowValue 형식 문자열로 선언
    //lowValue 셀의 reuseidentifier로 사용
    case action
    case disclosure
    case `switch`
    case checkmark
}

//cell에 표시할 데이터는 PhotosSettingItem 구조체로 저장
class PhotosSettingItem {
    init(type: CellType, title: String, on: Bool = false, imageName: String? = nil) {
        self.type = type
        self.title = title
        self.on = on
        self.imageName = imageName
    }
    
    let type: CellType //셀의 타입을 저장 타입속성에 저장되 있는 스타일 값을 통해서 표시할셀 선택합니다
    let title: String // 셀에 표시할 텍스트를 저장
    var on: Bool// 불린값 저장하고 스위치와 체크마크를 표현 할때 사용
    var imageName: String? //셀에 표시할 이미지 이름 을 저장
}

//섹션에 표시할 데이터는 PhotosSettingSection 구조체로 저장
class PhotosSettingSection {
    init(items: [PhotosSettingItem], header: String? = nil, footer: String? = nil) {
        self.items = items
        self.header = header
        self.footer = footer
        
    }
    
    let items: [PhotosSettingItem] // 섹션에 표시할 셀 데이터를 배열로 저장
    var header: String?
    var footer: String?
    // 섹션에 표시할 헤더(머릿글) 문자열과 푸터(바닥글) 문자열 저장
    
    //generateData 메소드는 샘플 데이터를 리턴합니다. 메소드가 리턴하는 값을 테이블 뷰에 표시하겠습니다.
    static func generateData() -> [PhotosSettingSection] {
        return [
            PhotosSettingSection(items: [
                PhotosSettingItem(type: .disclosure, title: "Siri & Search", imageName: "magnifyingglass.circle.fill")
            ],
            header: "Allow Photos to Access"),
            
            PhotosSettingSection(items: [
                PhotosSettingItem(type: .switch, title: "Hidden Album", on: true)
            ],
            footer: "When enabled, the Hidden album will appear in the Albums tab, under Utilities."),
            
            PhotosSettingSection(items: [
                PhotosSettingItem(type: .switch, title: "Auto-Play Videos", on: false),
                PhotosSettingItem(type: .switch, title: "Summarize Photos", on: true)
            ],
            header: "Photos Tab",
            footer: "The Photos tab shows every photo in your library in all views. You can choose compact, summarized views for Collections and Years."),
            
            PhotosSettingSection(items: [
                PhotosSettingItem(type: .action, title: "Reset Suggested Memories"),
                PhotosSettingItem(type: .switch, title: "Show Holiday Events", on: true)
            ],
            header: "Memories",
            footer: "You can choose to see holiday events for your home country."),
            
            PhotosSettingSection(items: [
                PhotosSettingItem(type: .checkmark, title: "Automatic", on: true),
                PhotosSettingItem(type: .checkmark, title: "Keep Originals", on: false)
            ],
            header: "Transfer to mac or PC",
            footer: "Automatically transfer photos and videos in a compitable format, or always transfer the original file without checking for compatibility.")
        ]
    }
}
