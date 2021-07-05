

//  델리게이트 패턴에서 객체는 다른 객체를 자신의 대리자로 지정합니다. 그리고 자신이 제공하는 일부 기능을 대리자가 대신 수행하도록 위임 합니다.
 
//Ios 앱개발에서 댈리게이트 패턴을 사용하는 대표적인 예는 테이블뷰입니다 테이블뷰에 표시된 항목을 선택했을떄 실행해야하는 작업은 정말다양하겠죠. 보통 채팅앱에서는 테이블뷰에 대화방목록을 표시하고 항목을 선택하면 대화방으로 이동하도록 구현합니다 쇼핑앱에서는 상품목록을 표시하고 항목을 선택하면 상세화면으로 이동하거나 아니면 장바구니에 상품을 추가 하도록 구현합니다.
 
 //테이블뷰는 사용자가 항목을 선택했을때 어떤 작업을 해야할지 알지 못합니다 모든 작업을 모은다음에 공통적인 부분만 뽑아내서 일반화 시키는것도 불가능합니다. 그래서 이부분을 대리자에게 위임합니다.

 //델리게이트 패턴에서는 두개의 객체가 존재합니다. 기능을 구현하는 테이블뷰와 테이블뷰의 일부기능을 대신 수행하는 델리게이트 객체를 두고 설명하겠습니다.
 
 //다른객체의 기능을 위임할수있는 객체를 보면 ..delegat  접미어나 ..dataSourse 접미어를 가진 속성이 있습니다. 이속성에 위임할 객체를 저장하는 방식으로 델리게이트를 지정합니다. 테이블뷰는 사용자가 항목을 선택했을때 델리게이트로 지정된 객체에게 처리를 요청합니다 사람 처럼 말로 요청할수는 없고 메소드를 호출하는 방식으로 요청합니다.

 //바꿔말하면 델리게이트 객체는 테이블뷰가 호출하는 메소드를 구현해야됩니다. 특정시점에 호출되는 메소드는 프로토콜로 선언되어있습니다. 델리게이트 객체는 반드시 프로토콜에 선언되있는 그대로 메소드를 구현해야됩니다.

// 보통 메소드를 구현하면 필요한 시점에 우리가 직접 호출하죠 하지만 델리게이트 패턴으로 구현한 메소드는 우리가 직접 호출하지 않습니다.

// 객체에서 이벤트가 발생하면 이객체는 자신의 델리게이트로 지정된객체에서 이벤트를 처리하는 메소드가 구현되어있는지 확인합니다. 만약 메소드가 구현되어 있다면 해당 메소드를 호출합니다. 반대로 구현되어 있지않다면 그냥 이벤트를 무시하거나 경우에따라서 크래시가 발생하기도 합니다.

// 여기에서는 테이블뷰가 델리게이트에 구현되어 있는 메소드를 호출합니다. 이부분을 이해하는 것이 핵심입니다. 이론적인 부분을 이해하고 나면 실제로 델리게이트 패턴을 구현하는것은 상대적으로 간단합니다. 먼저 개발자 문서를 통해서 델리게이트가 필요한지 확인합니다. 델리게이트가 필요하다면 구현해야하는 메소드가 선언되어 있는 프로토콜을 확인 합니다. 그런다음 인터페이스 빌더에서 두객체를 연결하거나 코드를 통해서 연결합니다. 테이블뷰처럼 화면에 표현되는 컨트롤들은 보통 자신이 포함되어 있는 뷰 컨트롤러를 델리게이트로 지정합니다. 마지막으로 델리게이트로 지정된 객체에서 프로토콜 을 구현합니다.
 

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
}

