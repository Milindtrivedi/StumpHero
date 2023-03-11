//
//  NotificationManager.swift
//  StumpHero
//
//  Created by Milind Trivedi on 11/03/23.
//  © Copyright 2023 Milind Trivedi All rights reserved


import UserNotifications

class NotificationManager {
    
    private let center = UNUserNotificationCenter.current()
    
    func requestPermission(completion: @escaping (Bool) -> Void) {
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func scheduleNotification(title: String, body: String, timeInterval: TimeInterval) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully")
            }
        }
    }   
}


