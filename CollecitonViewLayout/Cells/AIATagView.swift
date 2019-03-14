//
//  AIATagView.swift
//  AIAAgent
//
//  Created by Jacky Liew on 19/09/2018.
//  Copyright © 2018 lee yee chuan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AIATagView: NibDesignable {

    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var tagTitleLabel: UILabel!
    @IBOutlet weak var button:UIButton!
    @IBOutlet var topConstraint:NSLayoutConstraint!
    @IBOutlet var leftConstraint:NSLayoutConstraint!
    @IBOutlet var rightConstraint:NSLayoutConstraint!
    @IBOutlet var bottomConstraint:NSLayoutConstraint!
    override func nibName() -> String { return "AIATagView" }
    
    var padding:UIEdgeInsets = .zero {
        didSet {
            topConstraint.constant = padding.top
            leftConstraint.constant = padding.left
            rightConstraint.constant = padding.right
            bottomConstraint.constant = padding.bottom
            self.layoutIfNeeded()
        }
    }
    
    // MARK: - Implementation -
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        
    }
}
extension Reactive where Base : AIATagView {
    var tap: Driver<Void> {
        return base.button.rx.tap.asDriver()
    }
}

final class IncompleteSurveyView: AIATagView {
    func config() {
        tagView.backgroundColor = AIAColors.darkOrange
        tagTitleLabel.textColor = .white
        tagTitleLabel.text = "Incomplete"
        tagView.layer.cornerRadius = 10.0
    }
}

final class ContactLeadCardTemperatureView: AIATagView {
    
    func config(temperature:EnumLeadManagementContactTemperature?){
//        self.padding = AIAMetrics.contactLeadListingTemperaturePadding
//
//        if let temperature = temperature {
//            tagTitleLabel.font = AIAMetrics.contactLeadListingTemperatureFont
//            tagView.backgroundColor = temperature.backgroundColor
//            tagTitleLabel.textColor = .white
//            tagTitleLabel.text = temperature.tagString
//            self.isHidden = false
//        } else {
//            self.isHidden = true
//        }
    }
    
    func config(serviceType:EnumCallRecordPurpose?){
//        self.padding = AIAMetrics.contactLeadListingTemperaturePadding
//
//        if let serviceType = serviceType {
//            tagTitleLabel.font = AIAMetrics.contactLeadListingTemperatureFont
//            tagView.backgroundColor = serviceType.backgroundColor
//            tagTitleLabel.textColor = .white
//            tagTitleLabel.text = serviceType.optionText.uppercased()
//            self.isHidden = false
//        } else {
//            self.isHidden = true
//        }
    }
}
//
//final class ContactLeadNavBarTemperatureTagView: AIATagView {
//    func config(temperature:String?){
//        if !temperature.isNilOrEmptyReplacementOrEmptyString {
//            self.tagTitleLabel.font = AIAMetrics.navBarTemperatureFont
//            self.tagTitleLabel.textColor = AIAColors.navBarBackground
//            self.tagView.backgroundColor = UIColor.white
//            self.tagTitleLabel.text = temperature
//            self.isHidden = false
//        } else {
//            self.isHidden = true
//        }
//    }
//
//}
//
//final class ContactLeadSalesOpportunityCardTagView: AIATagView {
//    func config(type:String?, backgroundColor:UIColor?){
//        self.padding = AIAMetrics.contactLeadPurposePadding
//
//        if !type.isNilOrEmptyReplacementOrEmptyString {
//            self.tagTitleLabel.font = AIAMetrics.contactLeadPurposeFont
//            self.tagTitleLabel.textColor = UIColor.white
//            self.tagView.backgroundColor = backgroundColor
//            self.tagTitleLabel.text = type
//            self.isHidden = false
//        } else {
//            self.isHidden = true
//        }
//    }
//}
//
final class ContactLeadPurposeTagView: AIATagView {
    func config(purpose: String?, isNewStyle: Bool = false){
//        self.padding = AIAMetrics.contactLeadPurposePadding
//
//        if !purpose.isNilOrEmptyReplacementOrEmptyString {
//            self.tagTitleLabel.font = AIAMetrics.contactLeadPurposeFont
//            self.tagTitleLabel.textColor = UIColor.white
//            self.tagView.backgroundColor = (isNewStyle == true) ? UIColor.clear : AIAColors.primaryRed
//            self.tagTitleLabel.text = purpose
//            self.isHidden = false
//        } else {
//            self.isHidden = true
//        }
    }
}
//
//final class ContactLeadTransferredTagView: AIATagView {
//    func config(mainStatus:String?){
//        self.padding = AIAMetrics.contactLeadListingTemperaturePadding
//        if !mainStatus.isNilOrEmptyReplacementOrEmptyString {
//            self.tagTitleLabel.font = AIAMetrics.contactLeadListingTemperatureFont
//            self.tagTitleLabel.textColor = UIColor.white
//            self.tagTitleLabel.text = mainStatus
//            self.tagView.backgroundColor = AIAColors.darkGray
//            self.isHidden = false
//        } else {
//            self.isHidden = true
//        }
//    }
//}
