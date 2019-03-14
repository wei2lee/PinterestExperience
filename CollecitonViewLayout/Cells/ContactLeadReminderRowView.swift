//
//  ContactLeadReminderRowView.swift
//  AIAAgent
//
//  Created by Jacky Liew on 05/10/2018.
//  Copyright © 2018 lee yee chuan. All rights reserved.
//

import UIKit
//import NibDesignable
import RxCocoa
import RxSwift

class ContactLeadReminderRowViewModel {
//    var model: ContactsReminderModel!
//    var response: AIAResponseContactLeadCardReminder
//
//    var reminderId: String { return self.response.reminderId }
//    var reminderValue: String {
//        /*
//        var valueToShow = ""
//        var hasFirstValue = false
//        if self.response.title.isNilOrEmptyReplacementOrEmptyString == false {
//            hasFirstValue = true
//            valueToShow += self.response.title
//        }
//        if self.response.location.isNilOrEmptyReplacementOrEmptyString == false {
//            if hasFirstValue == true {
//                valueToShow += ", "
//            }
//            hasFirstValue = true
//            valueToShow += self.response.location
//
//        }
////        if let dateTime = self.model.dateTime?.toString(.custom(AIADateFormats.yyyyMMddHHmma)) {
////            if hasFirstValue == true {
////                valueToShow += ", "
////            }
////            hasFirstValue = true
////            valueToShow += dateTime
////        }
//
//        if hasFirstValue == false {
//            valueToShow += String.emptyReplacement
//        }
// */
//        let valueToShow = self.response.title.orEmptyReplacement
//        return valueToShow
//    }
//    var reminderDateTimeValue: String {
//        return self.response.dateTime?.convertLocalTime().toString(.custom(AIADateFormats.eee_dd_MMMM___h_mm_a)) ?? String.emptyReplacement
//    }
//
//    init(response: AIAResponseContactLeadCardReminder) {
////        self.model = ContactsReminderModel(response: model)
//        self.response = response
//    }
    
//    init?(model: ContactsReminderModel?) {
//        if let model = model {
//            self.model = model
//        } else {
//            return nil
//        }
//    }
}

class ContactLeadReminderRowView: NibDesignable {
    
    @IBOutlet weak var reminderValueLabel: UILabel!
    @IBOutlet weak var reminderDateTimeLabel: UILabel!
    @IBOutlet var baseTapGesture: UITapGestureRecognizer!

//    var viewModel: ContactLeadReminderRowViewModel!
//
//    // MARK: - Implementation -
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }
//
//    fileprivate func commonInit() {
//
//    }
//
//    func config(viewModel: ContactLeadReminderRowViewModel?) {
//        guard let viewModel = viewModel else {
//            Log.info("ContactLeadReminderRowView is missing ContactLeadReminderRowViewModel")
//            return
//        }
//        self.viewModel = viewModel
//        self.reminderValueLabel.text = viewModel.reminderValue
//        self.reminderDateTimeLabel.text = viewModel.reminderDateTimeValue
//    }
    

}

//extension Reactive where Base: ContactLeadReminderRowView {
//    var didTapRowDriver: Driver<ContactLeadReminderRowViewModel> {
//        return self.base.baseTapGesture.rx.event.asDriver().asVoid().map { self.base.viewModel }
//    }
//    
//}
