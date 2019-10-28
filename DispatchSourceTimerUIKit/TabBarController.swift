//
//  TabBarControllerViewController.swift
//  DispatchSourceTimerUIKit
//
//  Created by Dominik Butz on 28/10/2019.
//  Copyright © 2019 Duoyun. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func loadView() {
        super.loadView()
        
        let launchTimerVC  = LaunchTimerViewController()
        launchTimerVC.tabBarItem = UITabBarItem(title: "Launch Timer", image: UIImage(systemName: "1.square.fill"), tag: 0)
        
        let secondVC = SecondViewController()
        secondVC.tabBarItem = UITabBarItem(title: "Second VC", image: UIImage(systemName: "2.square.fill"), tag: 1)
    
        let list = [launchTimerVC, secondVC]
        
        self.viewControllers = list
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
