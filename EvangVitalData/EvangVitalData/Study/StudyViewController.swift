//
//  StudyViewController.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/02/07.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit

class StudyViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sheetView: UIView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    
    fileprivate(set) var globalViewModel = GlobalViewModel()
    
    static func create(globalViewModel: GlobalViewModel) -> UIViewController {
        let storyboard = UIStoryboard(name: "Study", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! StudyViewController
        viewController.globalViewModel = globalViewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapShuffleButton(_ sender: Any) {
        print("globalViewModel.vitals の配列を並び替える")
        globalViewModel.shuffleData()
        toggleSheetView()
        tableView.reloadData()
    }
    
    @IBAction func tapSheetButton(_ sender: Any) {
        globalViewModel.getSheetData(success: {
            DispatchQueue.main.async {
                self.toggleSheetView()
                self.tableView.reloadData()
            }
        },
        failure: { (error) in
            DispatchQueue.main.async {
                AlertController.shared
                    .show(title: "取得失敗", message: error, fromViewController: self, completion: nil)
            }
        })
    }
}

extension StudyViewController {
    
    func configureUI() {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let viewHeight = statusBarHeight + 60
        headerViewHeightConstraint.constant =  viewHeight
        
        sheetView.layer.borderColor = UIColor.green.cgColor
        sheetView.layer.borderWidth = 2
        sheetView.layer.cornerRadius = 30.0
        sheetView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        sheetView.layer.shadowOpacity = 0.2
        sheetView.layer.shadowColor = UIColor.black.cgColor
        sheetView.layer.shadowRadius = 5.0
        toggleSheetView()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: "StudyTableCell", bundle: nil), forCellReuseIdentifier: "StudyTableCell")
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 218
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.reloadData()
    }
    
    func toggleSheetView() {
        if globalViewModel.vitals.count == 0 {
            titleLabel.isHidden = false
            sheetView.isHidden = false
        }
        else {
            titleLabel.isHidden = true
            sheetView.isHidden = true
        }
    }
}

extension StudyViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalViewModel.vitals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "StudyTableCell", for: indexPath) as! StudyTableCell
        cell.configure(by: globalViewModel.vitals[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

extension StudyViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapしたよ")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return StudyTableCell.calcCellHeight(with: globalViewModel.vitals[indexPath.row])
    }
}

