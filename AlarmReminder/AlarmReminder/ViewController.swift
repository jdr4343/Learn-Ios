//
//  ViewController.swift
//  AlarmReminder
//
//  Created by 신지훈 on 2021/08/13.
//
//알람을 추가하기 위해 UserNotifications 추가
import UserNotifications
import UIKit

class ViewController: UIViewController {
    
    //테이블뷰 생성
    @IBOutlet var table: UITableView!
    
    //빈 배열 생성
    var models = [MyReminder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    }
    
    
    
    //버튼 액션
    @IBAction func didTapAdd() {
        //뷰전환
        guard let vc = storyboard?.instantiateViewController(identifier: "add") as? AddViewController else {
            return
        }
        vc.title = "새로운 알람"
        vc.navigationItem.largeTitleDisplayMode = .never
        //완료 핸들러
        vc.completion = { title, body, date in
            //추가 컨트롤러
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
                let new = MyReminder(title: title, date: date, identifier: "id_\(title)")
                self.models.append(new)
                self.table.reloadData()
                
                //알림 콘텐츠 개체를 생성하여 UNMutableNotificationContent를 저장후 속성 부여
                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default
                content.body = body
                
                //알림에 대한 트리거 추가 / 날짜와 시간으로 추가 / 10초 뒤 알람
                let targetDate = date
                //날짜의 구성요소를 추가하고 반복 false 전달
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([ .year, .month, .day, .hour, .minute, .second], from: targetDate),repeats: false)
                //알림 요청을하고 이를 식별자로 초기화 할것입니다.
                let request = UNNotificationRequest(identifier: "id", content: content, trigger: trigger)
                //알림을 예약
                UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                    if error != nil  {
                        print("Error Error Hell Yeah")
                        return
                    }
                })
                
            }
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    @IBAction func didTapTest() {
        //알람 기능 구현 / 권한 요청 succes를 통해 Bool값 전달
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
            if success {
                print("schedule Test Start")
                self.scheduleTest()
            } else if error != nil{
                print("Test error occurred")
            }
        })
    }
    
    
    
    //테스트 알림 기능 생성 /UserNotifications에 알림을 추가하도록 요청
    func scheduleTest() {
        
        //알림 콘텐츠 개체를 생성하여 UNMutableNotificationContent를 저장후 속성 부여
        let content = UNMutableNotificationContent()
        content.title = "신지훈이 애타게 소리친다.."
        content.sound = .default
        content.body = "HOTBAR 맛있겠다..."
        
        //알림에 대한 트리거 추가 / 날짜와 시간으로 추가 / 10초 뒤 알람
        let targetDate = Date().addingTimeInterval(10)
        //날짜의 구성요소를 추가하고 반복 false 전달
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([ .year, .month, .day, .hour, .minute, .second], from: targetDate),repeats: false)
        //알림 요청을하고 이를 식별자로 초기화 할것입니다.
        let request = UNNotificationRequest(identifier: "id", content: content, trigger: trigger)
        //알림을 예약
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil  {
                print("Error Error Hell Yeah")
                return
            }
        })
    }
    
    


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        //테이블뷰에 예약된 알람의 날짜 설정
        let date = models[indexPath.row].date
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM, dd, YYYY at hh:mm a"
        cell.detailTextLabel?.text = formatter.string(from: date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
