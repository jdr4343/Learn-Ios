//
//  ViewController.swift
//  PhotoVideoShot
//
//  Created by 신지훈 on 2021/08/10.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    
    @IBOutlet weak var profileChange: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.profileImage.layer.cornerRadius = profileImage.frame.height/2
        self.profileChange.layer.cornerRadius = 10
        
        //버튼을 액션으로 끌어오는 방법도 있지만 많이 경험해 보았으므로 코드로 연결해보겠습니다.
        self.profileChange.addTarget(self, action: #selector(ProfileChangeTapped), for: .touchUpInside)
        
    }
        @objc private func ProfileChangeTapped() {
            print("Tapped ProfileChangeTapped")
            //카메라 라이브러리 설정
            var config = YPImagePickerConfiguration()
            config.screens = [.library, .video, .photo]
           


             //사진이 선택됬을때
            let picker = YPImagePicker(configuration: config)
            
            picker.didFinishPicking { [unowned picker] items, _ in
                if let photo = items.singlePhoto {
                    print(photo.fromCamera) // Image source (camera or library)
                    print(photo.image) // Final image selected by the user
                    print(photo.originalImage) // original image selected by the user, unfiltered
                    print(photo.modifiedImage as Any) // Transformed image, can be nil
                    print(photo.exifMeta as Any) // Print exif meta data of original image.
                    //프사 이미지 변경
                    self.profileImage.image = photo.image
                }
                //사진 선택창 닫기
                picker.dismiss(animated: true, completion: nil)
            }
            //사진 선택창 보여주기
            present(picker, animated: true, completion: nil)

        
        
    }


}

