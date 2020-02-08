//
//  MainTabBarController.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/02/07.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    typealias Tab = (defaultImge: UIImage?, focusImage: UIImage?, title: String)

    enum TabType: String {
        case exam = "試験"
        case study = "学習"
    }

    fileprivate var beforeVC = UIViewController()
    fileprivate(set) var globalViewModel = GlobalViewModel()

    static func create() -> UITabBarController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! MainTabBarController
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.isTranslucent = false
        tabBar.tintColor = .green
        self.delegate = self
        setViewControllers(createViewControllers(), animated: true)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: - fileprivate method
    fileprivate func createViewControllers() -> [UIViewController] {

        let homeViewController = HomeViewController.create(globalViewModel: globalViewModel)
        let studyViewController = StudyViewController.create(globalViewModel: globalViewModel)

        let homeNVC = createFirstViewController(homeViewController)
        homeNVC.tabBarItem = createTabBarItem(tabData: createImagePair(tabType: .exam))
        
        let studyNVC = createFirstViewController(studyViewController)
        studyNVC.tabBarItem = createTabBarItem(tabData: createImagePair(tabType: .study))

        return [homeNVC, studyNVC]
    }

    fileprivate func createTabBarItem(tabData: Tab) -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: tabData.title, image: tabData.defaultImge?.withRenderingMode(.alwaysOriginal), selectedImage: tabData.focusImage?.withRenderingMode(.alwaysOriginal))
        tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return tabBarItem
    }

    fileprivate func createImagePair(tabType: TabType) -> Tab {

        switch tabType {
        case .exam:
            return (UIImage(named: "icon_exam_white"), UIImage(named: "icon_exam_color"), tabType.rawValue)
        case .study:
            return (UIImage(named: "icon_study_white"), UIImage(named: "icon_study_color"), tabType.rawValue)
        }
    }

    func createFirstViewController(_ viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController()
        navigationController.view.backgroundColor = .white
        let firstViewController = viewController
        navigationController.viewControllers = [firstViewController]
        navigationController.setNavigationBarHidden(true, animated: false)
        return navigationController
    }
}
extension MainTabBarController: UITabBarControllerDelegate {

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true

    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    }

}
