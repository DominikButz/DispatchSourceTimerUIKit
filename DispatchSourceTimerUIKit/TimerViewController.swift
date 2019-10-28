//
//  TimerViewController.swift
//  DispatchSourceTimerUIKit
//
//  Created by Dominik Butz on 28/10/2019.
//  Copyright © 2019 Duoyun. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    
    let watchTimer = WatchTimer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.view.backgroundColor = UIColor.systemBackground
        
        let frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        let timerLabelButton = UIButton(frame: frame)
        timerLabelButton.setTitle("00:00", for: .normal)
        timerLabelButton.addTarget(self, action: #selector(didTapTimerButton(_:)), for: .touchUpInside)
       timerLabelButton.setTitleColor(.systemBlue, for: .normal)
        self.view.addSubview(timerLabelButton)
        timerLabelButton.center = self.view.center
        timerLabelButton.sizeToFit()
   
        
        self.watchTimer.eventHandler = {counter in
            DispatchQueue.main.async {
                let displayString = WatchTimer.convertCountToTimeString(counter: counter)
                timerLabelButton.setTitle(displayString, for: .normal)
            }
        }
        
        
        let abortButtonFrame = CGRect(x: 0, y: 0, width: 50, height: 30)
        let abortButton = UIButton(frame: abortButtonFrame)
        abortButton.setTitle("Abort Timer", for: .normal)
        abortButton.addTarget(self, action: #selector(didTapAbortButton(_:)), for: .touchUpInside)
        abortButton.setTitleColor(.systemRed, for: .normal)
        abortButton.sizeToFit()
        self.view.addSubview(abortButton)
        abortButton.translatesAutoresizingMaskIntoConstraints = false
        abortButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        abortButton.topAnchor.constraint(equalTo: timerLabelButton.bottomAnchor, constant: 20).isActive = true
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.watchTimer.start()
    }
    
    @objc func didTapTimerButton(_ sender: UIButton) {
        
        guard self.watchTimer.isActive else {return}
        
        if self.watchTimer.paused  {
            self.watchTimer.start()
        } else {
            self.watchTimer.pause()
        }
        
    }
    
    
    @objc func didTapAbortButton(_ sender: UIButton) {
         
        self.watchTimer.finish()
        self.dismiss(animated: true, completion: nil)

         
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
