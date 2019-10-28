//
//  RootViewController.swift
//  DispatchSourceTimerUIKit
//
//  Created by Dominik Butz on 28/10/2019.
//  Copyright © 2019 Duoyun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemBackground
        
        let frame = CGRect(x: 0, y: 0, width: 200, height: 30)
            
        let label = UILabel(frame: frame)
        label.text = "Second View Controller"
        label.sizeToFit()
        self.view.addSubview(label)
        label.center = self.view.center
        label.textColor = UIColor.label

        // Do any additional setup after loading the view.
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
