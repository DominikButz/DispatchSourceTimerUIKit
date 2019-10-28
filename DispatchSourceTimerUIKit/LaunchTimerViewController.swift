//
//  ViewController.swift
//  DispatchSourceTimerUIKit
//
//  Created by Dominik Butz on 28/10/2019.
//  Copyright © 2019 Duoyun. All rights reserved.
//

import UIKit

class LaunchTimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemBackground
        
        let frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        
        let button = UIButton(frame: frame)
        button.addTarget(self, action: #selector(launchTimerVC), for: .touchUpInside)
        button.setTitle("Launch Timer!", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        self.view.addSubview(button)
        button.center = self.view.center
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func  launchTimerVC() {
        let timerVC = TimerViewController()
        self.present(timerVC, animated: true, completion: nil)
        
    }


}

