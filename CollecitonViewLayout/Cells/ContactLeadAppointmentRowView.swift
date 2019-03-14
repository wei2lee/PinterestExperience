//
//  ContactLeadAppointmentRowView.swift
//  AIAAgent
//
//  Created by Jacky Liew on 19/09/2018.
//  Copyright © 2018 lee yee chuan. All rights reserved.
//

//import NibDesignable
import SwiftDate
import RxSwift
import RxCocoa
import UIKit

class ContactLeadAppointmentRowViewModel {
    
    // Presentation
    var dayText: String = String.emptyReplacement
    var monthText: String = String.emptyReplacement
    var isTimeViewHidden: Bool = false
    var timeRangeText: String = ""
    var titleText: String = String.emptyReplacement
    var isLocationViewHidden: Bool = false
    var locationText: String = String.emptyReplacement
    var purposeText: String = ""
    var backgroundColor: UIColor {
        switch self.eventType {
        case .none:
            return UIColor.white
        case .some(let eventType):
            switch eventType {
            case .appointment, .reminder:
                if EnumAppointmentType(rawValue: self.type ?? "") == EnumAppointmentType.other {
                    return AIAColors.otherTypeEmptyPurposeColor
                }
                if let eventPurpose = self.purpose {
                    return eventPurpose.backgroundColor
                }
                return UIColor.white
            case .otherEvent:
                return UIColor.white
            }
        }
    }
    var textColor: UIColor {
        switch self.eventType {
        case .none:
            return UIColor.black
        case .some(let eventType):
            switch eventType {
            case .appointment, .reminder:
                if EnumAppointmentType(rawValue: self.type ?? "") == EnumAppointmentType.other {
                    return UIColor.white
                }
                if let eventPurpose = self.purpose {
                    return UIColor.white
                }
                return UIColor.black
            case .otherEvent:
                return UIColor.black
            }
        }
    }
    
    // State
    private var purpose: EnumCalendarEventPurpose?
    var eventType: EnumEventType?
    var type: String? // EnumAppointmentType/EnumReminderType
    var attendeeLevel: EnumAttendeeLevel?
    var appointmentId: String? // For Appointment
    var reminderId: String? // For Reminder
    var startDateTime: DateInRegion?
    var endDateTime: DateInRegion?
    var text: String? // For Sorting purpose

//    init(response: RealmCalendarEvent) {
//        if let startDateTime = response.startDateTime {
//            let dateRegion = DateInRegion(startDateTime, region: EnumRegion.malaysia.region)
//            self.startDateTime = dateRegion
//            self.dayText = dateRegion.toString(.custom(AIADateFormats.dd))
//            self.monthText = dateRegion.toString(.custom(AIADateFormats.MM))
//        }
//
//        if let dateTime = startDateTime {
//            self.dayText = dateTime.toString(.custom(AIADateFormats.dd))
//            self.monthText = dateTime.toString(.custom(AIADateFormats.MM))
//        }
//        self.isTimeViewHidden = response.isAllDay
//        let endDateTime = response.endDateTime?.toMalaysiaDateInRegion()
//        self.endDateTime = endDateTime
//        let startTime = startDateTime.flatMap{ $0.convertLocalTime().toString(.custom(AIADateFormats.hhmm_a)).lowercased() }
//        let endTime =  endDateTime.flatMap{ $0.convertLocalTime().toString(.custom(AIADateFormats.hhmm_a)).lowercased() }
//        if startTime != nil || endTime != nil {
//            self.timeRangeText = (startTime ?? "") + " - " + (endTime ?? "")
//        }
//
//        self.titleText = response.title
//        self.text = response.title
//        let eventType = EnumEventType(rawValue: response.eventType) ?? EnumEventType.appointment
//        switch eventType {
//            case .appointment:
//                self.isLocationViewHidden = false
//            case .reminder:
//                self.isLocationViewHidden = true
//            case .otherEvent:
//                self.isLocationViewHidden = true
//        }
//
//        self.locationText = response.location
//        self.purpose = response.getEventPurpose()
//
//        self.eventType = EnumEventType(rawValue: response.eventType)
//        self.type = response.type
//        self.attendeeLevel = EnumAttendeeLevel(rawValue: response.attendeeLevel)
//        self.appointmentId = response.appointmentId
//        self.reminderId = response.reminderId
//
//        self.purposeText = self.getEventPurpose()?.displayText ?? ""
//
//    }
    
//    init(response: AIAResponseContactLeadAppointment) {
//        if let dateTime = response.startDateTime?.convertLocalTime() {
//            self.dayText = dateTime.toString(.custom(AIADateFormats.dd))
//            self.monthText = dateTime.toString(.custom(AIADateFormats.MM))
//        }
//
//        if let isAllDay = response.isAllDay {
//            self.isTimeViewHidden = isAllDay
//        }
//
//        let startTime = response.startDateTime.flatMap{ $0.convertLocalTime().toString(.custom(AIADateFormats.hhmm_a)).lowercased() }
//        let endTime =  response.endDateTime.flatMap{ $0.convertLocalTime().toString(.custom(AIADateFormats.hhmm_a)).lowercased() }
//
//        if startTime != nil || endTime != nil {
//            self.timeRangeText = (startTime ?? "") + " - " + (endTime ?? "")
//        }
//
//        if let title = response.title {
//            self.titleText = title
//            self.text = title
//        }
//        self.isLocationViewHidden = false
//        response.location.flatMap { self.locationText = $0 }
//        response.getPurpose().flatMap { self.purpose = EnumCalendarEventPurpose(rawValue: $0) }
//        self.attendeeLevel = EnumAttendeeLevel(rawValue: response.attendeeLevel)
//        self.appointmentId = response.appointmentId
//
//        self.eventType = EnumEventType.appointment
//        self.type = response.type
//        response.startDateTime.flatMap { self.startDateTime = $0 }
//        response.endDateTime.flatMap { self.endDateTime = $0 }
//
//        self.purposeText = self.getEventPurpose()?.displayText ?? ""
//    }
    
//    init(response: AIAResponseContactLeadCardReminder) {
//        if let dateTime = response.dateTime?.convertLocalTime() {
//            self.dayText = dateTime.toString(.custom(AIADateFormats.dd))
//            self.monthText = dateTime.toString(.custom(AIADateFormats.MM))
//        }
//
//        let startTime = response.dateTime.flatMap{ $0.convertLocalTime().toString(.custom(AIADateFormats.hhmm_a)).lowercased() }
//        if startTime != nil {
//            self.timeRangeText = (startTime ?? "")
//        }
//
//        self.titleText = response.title
//        self.text = response.title
//        self.isLocationViewHidden = true
//        self.purpose = EnumCalendarEventPurpose.reminder // EnumCalendarEventPurpose only for appointment, use EnumEventType if possible
//        self.attendeeLevel = nil
//        self.reminderId = response.reminderId
//
//        self.eventType = EnumEventType.reminder
//        self.type = nil
//        response.dateTime.flatMap { self.startDateTime = $0 }
//        self.endDateTime = nil
//
//        self.purposeText = self.getEventPurpose()?.displayText ?? ""
//    }
    
    // TODO: Refactor AIAResponseAppointmentObject & AIAResponseContactLeadAppointment to Inheritance Class
//    init(response: AIAResponseAppointmentObject) {
//        if let dateTime = response.startDateTime?.convertLocalTime() {
//            self.dayText = dateTime.toString(.custom(AIADateFormats.dd))
//            self.monthText = dateTime.toString(.custom(AIADateFormats.MM))
//        }
//
//        self.isTimeViewHidden = response.isAllDay
//
//        let startTime = response.startDateTime.flatMap{ $0.convertLocalTime().toString(.custom(AIADateFormats.hhmm_a)).lowercased() }
//        let endTime =  response.endDateTime.flatMap{ $0.convertLocalTime().toString(.custom(AIADateFormats.hhmm_a)).lowercased() }
//
//        if startTime != nil || endTime != nil {
//            self.timeRangeText = (startTime ?? "") + " - " + (endTime ?? "")
//        }
//
//        self.titleText = response.title
//        self.text = response.title
//        self.isLocationViewHidden = false
//        self.locationText = response.location
//        response.getPurpose().flatMap { self.purpose = EnumCalendarEventPurpose(rawValue: $0) }
//        self.attendeeLevel = EnumAttendeeLevel(rawValue: response.attendeeLevel)
//        self.appointmentId = response.appointmentId
//
//        self.eventType = EnumEventType.appointment
//        self.type = response.type
//        response.startDateTime.flatMap { self.startDateTime = $0 }
//        response.endDateTime.flatMap { self.endDateTime = $0 }
//
//        self.purposeText = self.getEventPurpose()?.displayText ?? ""
//    }
    
//    // TODO: Refactor AIAResponseReminderObject & AIAResponseContactLeadCardReminder to Inheritance Class
//    init(response: AIAResponseReminderObject) {
//        if let dateTime = response.dateTime?.convertLocalTime() {
//            self.dayText = dateTime.toString(.custom(AIADateFormats.dd))
//            self.monthText = dateTime.toString(.custom(AIADateFormats.MM))
//        }
//
//        let startTime = response.dateTime.flatMap{ $0.convertLocalTime().toString(.custom(AIADateFormats.hhmm_a)).lowercased() }
//        if startTime != nil {
//            self.timeRangeText = (startTime ?? "")
//        }
//
//        self.titleText = response.title
//        self.text = response.title
//        self.isLocationViewHidden = true
//        self.purpose = EnumCalendarEventPurpose.reminder // EnumCalendarEventPurpose only for appointment, use EnumEventType if possible
//        self.attendeeLevel = nil
//        self.reminderId = response.reminderId
//
//        self.eventType = EnumEventType.reminder
//        self.type = response.type
//        response.dateTime.flatMap { self.startDateTime = $0 }
//        self.endDateTime = nil
//
//        self.purposeText = self.getEventPurpose()?.displayText ?? ""
//    }
    
    func getEventPurpose() -> EnumCalendarEventPurpose? {
        // [BZ#7847] Show Coaching for non-owner + customer appointment
        if EnumEventType.appointment == self.eventType,
            EnumAppointmentType.customer == EnumAppointmentType(rawValue: self.type ?? ""),
            EnumAttendeeLevel.owner != self.attendeeLevel {
            return EnumCalendarEventPurpose.coach
        }
        
        // Default purpose to "OTHER" instead of let it ""
//        if EnumAppointmentType.other == EnumAppointmentType(rawValue: self.type ?? "") {
//            return EnumCalendarEventPurpose.other
//        }
        
        return self.purpose
    }
}

class ContactLeadAppointmentRowView: NibDesignable, Disposable {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var purposeTagView: ContactLeadPurposeTagView!
    @IBOutlet var baseTapGesture: UITapGestureRecognizer!
   
    var viewModel: ContactLeadAppointmentRowViewModel!
    
//    var disposeBag = DisposeBag()
//    func dispose() { disposeBag = DisposeBag() }
    
    // MARK: - Implementation -
    override func nibName() -> String { return "ContactLeadAppointmentRowView" }
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
    
    func config(viewModel: Any?) {
        guard let viewModel = viewModel else { return }
//        self.viewModel = viewModel
        self.dayLabel.text = "dayText"
        self.monthLabel.text = "monthText"
        self.timeView.isHidden = false
        self.timeLabel.text = "timeRangeText"
        self.titleLabel.text = "titleText"
        self.locationView.isHidden = false
        self.locationLabel.text = "locationText"
        self.setupPurposeTagView()
    }
    
    fileprivate func setupPurposeTagView() {
        self.purposeTagView.config(purpose: "purpose")
        //self.purposeTagView.config(purpose: viewModel.purposeText, isNewStyle: false)
    }
    
}

//extension Reactive where Base: ContactLeadAppointmentRowView {
//    var didTapRowDriver: Driver<ContactLeadAppointmentRowViewModel> {
//        return self.base.baseTapGesture.rx.event.asDriver().asVoid().map { self.base.viewModel }
//    }
//}

final class EventAppointmentRowView: ContactLeadAppointmentRowView {
//    override func config(viewModel: Any?) {
//        self.dayLabel.text = "dayText"
//        self.monthLabel.text = "monthText"
//        self.timeView.isHidden = false
//        self.timeLabel.text = "timeRangeText"
//        self.titleLabel.text = "titleText"
//        self.locationView.isHidden = false
//        self.locationLabel.text = "locationText"
//        self.setupPurposeTagView()
//    }
    
//    override func setupPurposeTagView() {
//        self.purposeTagView.config(purpose: viewModel.purposeText, isNewStyle: true)
//    }
}
