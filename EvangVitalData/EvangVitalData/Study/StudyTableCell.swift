//
//  StudyTableCell.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/02/08.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit

class StudyTableCell: UITableViewCell {
    
    static func calcCellHeight(with vital: Vital) -> CGFloat {
        let viewMargin: CGFloat = 84
        let nameLabelHeight = calcLabelHeight(with: vital.name, isTitle: true)
        let nameJPLabelHeight = calcLabelHeight(with: vital.nameJP, isTitle: true)
        let descriptionLabelHeight = calcLabelHeight(with: vital.description, isTitle: false)
        let usageLabelHeight = calcLabelHeight(with: vital.usage, isTitle: false)
        return viewMargin + nameLabelHeight + nameJPLabelHeight + descriptionLabelHeight + usageLabelHeight
    }
    
    static func calcLabelHeight(with text: String, isTitle: Bool) -> CGFloat {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = text
        
        if isTitle {
            label.font =  UIFont(name: "HiraMaruProN-W4", size: 17.0)
            let labelWidth = UIScreen.main.bounds.width - 48
            let rect: CGSize = label.sizeThatFits(CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude))
            return rect.height
        }
        else {
            label.font =  UIFont(name: "HiraMaruProN-W4", size: 14.0)
            let labelWidth = UIScreen.main.bounds.width - 100
            let rect: CGSize = label.sizeThatFits(CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude))
            return rect.height
        }
    }
   
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameJPLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var usageLabel: UILabel!
    
    @IBOutlet weak var nameLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var nameJPHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var descriptionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var usageHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        confgireUI()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func configure(by vital: Vital) {
        nameLabel.text = vital.name
        nameJPLabel.text = vital.nameJP
        descriptionLabel.text = vital.description
        usageLabel.text = vital.usage
    }
}

fileprivate extension StudyTableCell {

    func confgireUI() {
        cardView.layer.cornerRadius = 8.0
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowRadius = 5.0
    }
    
    func configureSize(with vital: Vital) {
        nameLabelHeightConstraint.constant = calcLabelHeight(with: vital.name, isTitle: true)
        nameJPHeightConstraint.constant = calcLabelHeight(with: vital.nameJP, isTitle: true)
        descriptionViewHeightConstraint.constant = calcLabelHeight(with: vital.description, isTitle: false)
        usageHeightConstraint.constant = calcLabelHeight(with: vital.usage, isTitle: false)
    }
    
    func calcLabelHeight(with text: String, isTitle: Bool) -> CGFloat {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = text
        
        if isTitle {
            label.font =  UIFont(name: "HiraMaruProN-W4", size: 17.0)
            let labelWidth = UIScreen.main.bounds.width - 48
            let rect: CGSize = label.sizeThatFits(CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude))
            return rect.height
        }
        else {
            label.font =  UIFont(name: "HiraMaruProN-W4", size: 14.0)
            let labelWidth = UIScreen.main.bounds.width - 100
            let rect: CGSize = label.sizeThatFits(CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude))
            return rect.height
        }
    }
}


