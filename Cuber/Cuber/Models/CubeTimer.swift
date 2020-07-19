//
//  CubeTimer.swift
//  Cuber
//
//  Created by Bader Alawadh on 7/10/20.
//  Copyright © 2020 Bader Alawadh. All rights reserved.
//

import Foundation
import Combine
import Firebase
class CubeTimer : ObservableObject{
    var inspectionTimer = Timer()
    var inspection = 15
    var InspectionIsStarted = false
    
    var timer = Timer()
    @Published var time = ""
    var seconds = 0.0
    var minutes = 0
    var isStarted = false
    var scramble = String()
    
    func startSolving() {
        print(self.time)
        if self.inspection == 0 {
            self.InspectionIsStarted = true
        }
        
        if !self.isStarted {
            if !self.InspectionIsStarted {
                self.startInspection()
            }else {
                self.stopInspection()
                self.startSolvingTimer()
            }
        }else {
            self.stopSolvingTimer(algorithm: scramble)
        }
    }
    
    func startInspection() {
        self.InspectionIsStarted = true
        inspectionTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            
            self.time = String(self.inspection)
            self.inspection -= 1
            if self.inspection == 0 {
                
                self.time = "DNF"
                self.stopSolvingTimer(algorithm: self.scramble)
                self.inspectionTimer.invalidate()
                self.InspectionIsStarted = false
            }
        })
    }
    
    func stopInspection() {
        self.inspectionTimer.invalidate()
        self.InspectionIsStarted = false
    }
    
    func startSolvingTimer() {
        self.time = ""
        self.isStarted = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
            if self.minutes <= 0 {
                self.time = String(format: "%0.2f", self.seconds)
                self.seconds += 0.01
                
                if self.seconds >= 60 {
                    self.seconds = 0
                    self.minutes += 1
                }
            }else {
                if self.seconds < 10 {
                    self.time = "\(self.minutes):0\(String(format: "%0.2f", self.seconds))"
                }else {
                    self.time = "\(self.minutes):\(String(format: "%0.2f", self.seconds))"
                }
                self.seconds += 0.01
                
                if self.seconds >= 60 {
                    self.seconds = 0
                    self.minutes += 1
                }
            }
        })
    }
    
    func stopSolvingTimer(algorithm: String) {
        self.timer.invalidate()
        self.isStarted = false
        
        let uid = Auth.auth().currentUser?.uid
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY  hh:mm:ss a"
        let goodDate = dateFormatter.string(from: date)
        let id = UUID()
        let cubeTime: CubeTime = CubeTime(id: id,time: self.time, date: goodDate, algorithms: algorithm,seconds: self.seconds, minutes: self.minutes)
              Networking.createItem(cubeTime, inCollection: "users/\(uid!)/Cube/", withDocumentId: "\(id)" ) {
                  print("added to database")
              }
        self.restartSolvingTimer()
      
    }
    
    func restartSolvingTimer() {
        self.seconds = 0.0
        self.minutes = 0
    }
    
}
