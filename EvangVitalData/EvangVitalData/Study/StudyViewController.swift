//
//  StudyViewController.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/02/07.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit

class StudyViewController: UIViewController {
    
    fileprivate(set) var globalViewModel = GlobalViewModel()
    
    static func create(globalViewModel: GlobalViewModel) -> UIViewController {
        let storyboard = UIStoryboard(name: "Study", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! StudyViewController
        viewController.globalViewModel = globalViewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
