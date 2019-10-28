//
//  WorkoutStopWatchTimer.swift
//  Progressive
//
//  Created by Dominik Butz on 16/10/2019.
//  Copyright © 2019 Duoyun. All rights reserved.
//

import Foundation


class WatchTimer {
    
   private var sourceTimer: DispatchSourceTimer?

    private let queue = DispatchQueue.init(label: "stopwatch.timer", qos: .background, attributes: [], autoreleaseFrequency: .never, target: .global())
    private var counter: Int = 0  // seconds

    var endDate: Date?
    var duration: TimeInterval?
    
    var eventHandler: ((Int) -> Void)?
    
   // @Published var timeDisplayString = "0:00"
    
    var paused = false
    
   var isActive: Bool {
        return  self.sourceTimer != nil
    }
    
    func start() {
        self.paused = false
    
        guard let _ = self.sourceTimer else {
            self.startTimer()
            return
        }
        
        self.resumeTimer()
    }
    
     func finish() {
        
        guard self.sourceTimer != nil else {return}
        self.endDate = Date()
        self.duration = TimeInterval(exactly: Double(self.counter))

        self.sourceTimer?.setEventHandler {}
        self.sourceTimer?.cancel()
        if self.paused == true {
            self.sourceTimer?.resume()
        }
        self.sourceTimer = nil
        self.eventHandler = nil
        self.reset()
 
     }
    
    func pause() {
          self.paused = true
          self.sourceTimer?.suspend()
        
      }
     
     private func reset() {
        
         self.counter = 0
    
     }
    
    private func startTimer() {
        self.sourceTimer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags.strict,
                                                          queue: self.queue)
        
        self.resumeTimer()
    }
    
    private func resumeTimer() {
        self.sourceTimer?.setEventHandler { [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.counter += 1
            strongSelf.eventHandler!(strongSelf.counter)
        }
     
        self.sourceTimer?.schedule(deadline: .now(),
                                   repeating: 1)
        self.sourceTimer?.resume()
    }
    
//    private func updateTimer() {
//        self.counter += 1
//
//        DispatchQueue.main.async {
//            self.timeDisplayString = WatchTimer.convertCountToTimeString(counter: self.counter)
//        }
//    }
    

}


extension WatchTimer {
    static func convertCountToTimeString(counter: Int) -> String {
       
        let seconds = counter % 60
        let minutes = (counter / 60) % 60
        let hours = (counter / (60 * 60)) % 60
        
     
        var secondsString = "\(seconds)"
        var minutesString = "\(minutes)"
        var hoursString = "\(hours)"
        
        
        if seconds < 10 {
            secondsString = "0" + secondsString
        }
        
        if minutes < 10 {
            minutesString = "0" + minutesString
        }
        
        if hours < 10 {
            hoursString = "0" + hoursString
        }
        
        var watchTimeString = "\(hoursString):\(minutesString):\(secondsString)"
        if hoursString == "00" {
            watchTimeString = String(watchTimeString.dropFirst(3))
        }
        return watchTimeString
    }
}
