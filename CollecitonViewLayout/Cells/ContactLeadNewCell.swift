//
//  ContactLeadNewCell.swift
//  PinterestStyle
//
//  Created by HI-Wong Che Hsing on 24/02/2019.
//  Copyright © 2019 HI-Wong Che Hsing. All rights reserved.
//

import UIKit

class ContactLeadNewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var temperatureIndicatorRow: UIView!
    @IBOutlet weak var temperatureIndicatorView: UIView!
    
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderOwnerSplitterView: UIView!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var mainStatusTagContainerView: UIView!
    @IBOutlet weak var mainStatusTagView: UIView!
    
    //MAARK: Contents Row
    @IBOutlet weak var mainContentsStackView: UIStackView!
    
    @IBOutlet weak var idRow: UIStackView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dobRow: UIStackView!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var vitalityStatusLabel: UILabel!
    @IBOutlet weak var vitalityAmountLabel: UILabel!
    @IBOutlet weak var vitalityAmountRow: UIStackView!
    @IBOutlet weak var vitalityStatusRow: UIStackView!
    
    @IBOutlet weak var topLineView: UIView!
    @IBOutlet weak var subContentsStackView: UIStackView!
    @IBOutlet weak var iconsView: ContactLeadCardIconsView!
    @IBOutlet weak var highlightView: ContactLeadCardHighlightView!
    @IBOutlet weak var reminderNotesView: UIView!
    @IBOutlet weak var reminderNotesValueLabel: UILabel!
    @IBOutlet weak var bottomLineView: UIView!
    
    //MARK: Actions Row
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var appointmentButton: UIButton!
    @IBOutlet weak var reminderButton: UIButton!
    @IBOutlet weak var transferButton: UIButton!
    var containerViewShadowPathRect: CGRect = .zero
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        containerView.shadowRadius = 0
//        containerView.cornerRadius = 0
        
//        containerView.shadowOffset = .zero
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if containerViewShadowPathRect != containerView.bounds {
            containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: containerView.layer.cornerRadius).cgPath
            containerViewShadowPathRect = containerView.bounds
        }
    }
    
//    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
//        super.apply(layoutAttributes)
//        if let attributes = layoutAttributes as? ContactLayoutAttributes {
//            let desiredHeight = self.containerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
//            log(desiredHeight)
//            //var frame = attributes.frame
//            //frame.size.height = desiredHeight
//            //attributes.frame = frame
//            //containerHeightConstraint.constant = desiredHeight
//        }
//    }
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        let attributes = layoutAttributes.copy() as! UICollectionViewLayoutAttributes
//        let desiredHeight = self.containerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
//        var frame = attributes.frame
//        frame.size.height = desiredHeight
//        attributes.frame = frame
//
//        //stackViewHeightConstraint.isActive = true
//        //stackViewHeightConstraint.constant = desiredHeight
//
//        return attributes
//    }
    
    
//    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
//        super.apply(layoutAttributes)
//        if let attributes = layoutAttributes as? ContactLayoutAttributes {
//            //stackViewHeightConstraint.isActive = true
//            //stackViewHeightConstraint.constant = attributes.cellHeight
//        }
//    }
}
