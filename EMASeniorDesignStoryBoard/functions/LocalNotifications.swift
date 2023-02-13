//
//  LocalNotifications.swift
//  EMASeniorDesignStoryBoard
//
//  Created by gwimer on 2/13/23.
//

import Foundation

import UserNotifications
import Foundation

class NotificationManager {
    
    static let instance = NotificationManager() //Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success,
        error) in
            if let error = error {
                print("ERROR \(error)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "Your survey is available"
        content.subtitle = "Tap to view"
        content.sound = .default
        content.badge = 1
        
        //calendar
        var dateComponents = DateComponents()
        dateComponents.hour = 14
        dateComponents.minute = 58
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}



