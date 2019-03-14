//
//  ContactLeadCardHighlightView.swift
//  LeadManagementComponent
//
//  Created by UF-Jacky Liew on 20/08/2018.
//  Copyright © 2018 UF-Jacky Liew. All rights reserved.
//

import UIKit
//import NibDesignable
import SwiftDate
import RxSwift
import RxCocoa

class ContactLeadCardHighlightView: NibDesignable {
    @IBOutlet weak var leadCountsView: UIView!
    @IBOutlet weak var leadCount1View: LeadCountView!
    @IBOutlet weak var leadCount2View: LeadCountView!
    var leadCountViews:[LeadCountView] { return [leadCount1View, leadCount2View] }
    
    @IBOutlet weak var linerSeparatorView: UIView!
    @IBOutlet weak var appointmentView: ContactLeadAppointmentRowView!

    @IBOutlet weak var reminderSeparatorView: UIView!
    @IBOutlet weak var reminderView: ContactLeadReminderRowView!
    let appointmentTap = UITapGestureRecognizer()
    let reminderTap = UITapGestureRecognizer()
    
    // MARK: - Implementation -
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func prepareForReuse() {
        self.reminderSeparatorView.isHidden = true
        self.appointmentView.isHidden = true
        self.linerSeparatorView.isHidden = true
        self.reminderView.isHidden = true
        self.reminderSeparatorView.isHidden = true
        leadCountsView.isHidden = true
    }
    
    fileprivate func commonInit() {
        prepareForReuse()
        appointmentView.addGestureRecognizer(appointmentTap)
        appointmentView.isUserInteractionEnabled = true
        reminderView.addGestureRecognizer(reminderTap)
        reminderView.isUserInteractionEnabled = true
    }
    
    override func nibName() -> String { return "ContactLeadCardHighlightView" }
    
    func config(viewModel: Any) {
        self.appointmentView.isHidden = false
        self.linerSeparatorView.isHidden = false
        reminderSeparatorView.isHidden = false
        reminderView.isHidden = false
        reminderSeparatorView.isHidden = false
        self.appointmentView.config(viewModel: 1)
        //self.appointmentView.config(viewModel: appointmentViewModel)
        
//        leadCounts = viewModel.leadCounts
//        if let response = viewModel.appointmentModel {
//            let appointmentViewModel = ContactLeadAppointmentRowViewModel(response: response)
//            self.appointmentView.config(viewModel: appointmentViewModel)
//            self.appointmentView.isHidden = false
//            self.linerSeparatorView.isHidden = false
//        } else {
//            self.appointmentView.isHidden = true
//            self.linerSeparatorView.isHidden = true
//        }
//
//        if let response = viewModel.reminderModel {
//            let reminderViewModel = ContactLeadReminderRowViewModel(response: response)
//            self.reminderView.config(viewModel: reminderViewModel)
//            reminderView.isHidden = false
//            reminderSeparatorView.isHidden = false
//        } else {
//            reminderView.isHidden = true
//            reminderSeparatorView.isHidden = true
//        }
        //self.layoutIfNeeded()
        //self.setNeedsLayout()
    }
    
    var leadCounts:[(sourceText:String, countText:String)] = [] {
        didSet {
            for leadCountView in leadCountViews {
                leadCountView.isHidden = true
            }
            for (i, leadCount) in leadCounts.enumerated() {
                if i < leadCountViews.count {
                    leadCountViews[i].configure(sourceText:leadCount.sourceText,
                                                countText:leadCount.countText)
                    leadCountViews[i].isHidden = false
                }
            }
            leadCountsView.isHidden = leadCounts.count <= 0
        }
    }

}
//extension Reactive where Base : ContactLeadCardHighlightView {
//    var appointmentDidTap: Driver<Void> {
//        return base.appointmentTap.rx.event.asDriver().asVoid().debug("xx2")
//    }
//    var reminderDidTap: Driver<Void> {
//        return base.reminderTap.rx.event.asDriver().asVoid().debug("xx1")
//    }
//}
