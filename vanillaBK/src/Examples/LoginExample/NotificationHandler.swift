//
//  NotificationHandler.swift
//  vanillaBK
//
//  Created by imac_01 on 15/06/23.
//

import Foundation
import UserNotifications

class NotificationHandler{
    var title: String
    var subititle: String
    var body: String
    
    init(title: String, subititle: String, body: String) {
        self.title = title
        self.subititle = subititle
        self.body = body
    }
    
    func showNotification(){
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subititle
        content.body = body
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
        print("funciona")
    }
    
    func requestPermissions(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]){
            granted, error in
            if granted {
                print("Se permitio el uso de notificaciones")
            } else {
                print("No se permitio el uso de notificaciones")
            }
        }
    }
}
