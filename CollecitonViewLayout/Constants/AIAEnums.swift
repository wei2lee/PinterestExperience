//
//  AIAEnum.swift
//  AIA
//
//  Created by lee yee chuan on 5/6/17.
//  Copyright © 2017 tiny. All rights reserved.
//

import Foundation
import SwiftDate

//MARK: Application
enum EnumRepositoryReadOption {
    case localOrRemote
    case local
    case remote
}

enum EnumBuildConfiguration:String {
    case development //with mock MockAPIManager, no connection to backend server, AIABuildDevelopment
    case developmentStaging //with APIManager connect to UAT backend server, same as staging
    case developmentStagingStaging //with APIManager connect to UAT backend server, same as stagingStaging
    case developmentProduction //with APIManager connect to production backend server, same as production
    case staging //with APIManager connect to production backend server, AIABuildProduction
    case stagingStaging //with APIManager connect to UAT backend server, AIABuildStaging
    case stagingStagingPentest //with APIManager connect to UAT backend server, AIABuildStaging
    case production //with APIManager connect to production backend server, AIABuildProduction
    var isDevelopment:Bool {
        return self == .development || self == .developmentStaging || self == .developmentStagingStaging || self == .developmentProduction
    }
    var isStaging:Bool {
        return self == .staging || self == .stagingStaging || self == .stagingStagingPentest
    }
    var isProduction:Bool {
        return self == .production
    }
    var isIntegratedAPI:Bool {
        return self == .staging || self == .developmentStaging || self == .developmentStagingStaging || self == .stagingStaging || self == .production || self == .developmentProduction || self == .stagingStagingPentest
    }
}


public enum EnumRegion {
    case malaysia
    case gmt
    
    private static let malaysiaTimeZone = TimeZone(abbreviation: "GMT+8:00")!
    private static let gmtTimeZone = TimeZone(abbreviation: "GMT+0:00")!
    
    var timeZone:TimeZone {
        switch self {
        case .malaysia:
            return EnumRegion.malaysiaTimeZone
        case .gmt:
            return EnumRegion.gmtTimeZone
        }
    }
    //Region(tz: EnumRegion.malaysia.region, cal: Calendar(identifier: Calendar.Identifier.gregorian), loc: Locale(identifier: "en_US_POSIX"))
    private static let malaysiaRegion = Region(calendar: Calendars.gregorian.toCalendar(), zone: EnumRegion.malaysiaTimeZone, locale: Locale(identifier: "en_US_POSIX"))
    private static let gmtRegion = Region(calendar: Calendars.gregorian.toCalendar(), zone: EnumRegion.gmtTimeZone, locale: Locale(identifier: "en_US_POSIX"))
    
    var region:Region {
        switch self {
        case .malaysia:
            return EnumRegion.malaysiaRegion
        case .gmt:
            return EnumRegion.gmtRegion
        }
    }
}

enum EnumDeviceType : String {
    case ios = "ios"
}

enum EnumDeviceScreen {
    case iphone5s
    case iphone6
    case iphone6plus
    
    var width:CGFloat {
        switch self {
        case .iphone5s: return 320.0
        case .iphone6: return 375.0
        case .iphone6plus: return 414.0
        }
    }
}

//MARK: SideMenu
enum EnumNavigationLeftBarItems {
    case none
    case menuAndBack
    case menu
    case back
    case close
}
enum EnumNavigationRightBarItems {
    case none
    case notification
    case contactLeadTemperature(text: String)
    case close
    case info(text: String?)
    case more(items: [String])
}


//MARK: Tutorial

//MARK: LocalAuthenticate
enum EnumBiometricOption : String {
    case pin = "pin"
    case fingerprint = "fingerprint"
    case none = ""
}
enum EnumLocalAuthStatus : String {
    case pending = ""
    case started = "started"
    case ended = "ended"
}

//MARK: Settings
//enum EnumSettingGroupType : String, CaseInsensitiveWithoutSpaceStringEnum {
//    case individually = "individual"
//    case grouped = "group"
//
//    var title: String {
//        switch self {
//        case .individually:
//            return R.string.main.setting_selection_individually_group()
//        case .grouped:
//            return R.string.main.setting_selection_grouped_group()
//        }
//    }
//}

enum EnumSettingTimeOptionType : String, CaseInsensitiveWithoutSpaceStringEnum {
    case realmTime = "realtime"
    case fixedTime = "fixedtime"
    case fixedDuration = "fixedduration"
}

//enum EnumSettingSelectionHourType: String, CaseInsensitiveWithoutSpaceStringEnum {
//    case everyHour = "1"
//    case everyTwoHours = "2"
//    case everyThreeHours = "3"
//    case everyFourHours = "4"
//
//    var title: String {
//        switch self {
//        case .everyHour:
//            return R.string.main.setting_selection_every_hour()
//        case .everyTwoHours:
//            return R.string.main.setting_selection_every_two_hours()
//        case .everyThreeHours:
//            return R.string.main.setting_selection_every_three_hours()
//        case .everyFourHours:
//            return R.string.main.setting_selection_every_four_hours()
//        }
//    }
//
//    var notificationHour: String {
//        return String(self.rawValue)
//    }
//}

enum DialogAction: Equatable {
    case confirm(value:String?)
    case cancel
    case positive
    case negative
    
    func getActionTitle() -> String {
        switch self {
        case .confirm: return "YES"
        case .cancel: return "NO"
        case .positive: return "YES"
        case .negative: return "NO"
        }
    }
}

//MARK: Dashboard
//enum EnumDashboardCardType: String, CaseInsensitiveWithoutSpaceStringEnum {
//    case notification = "NOTF"
//    case premiumPayment = "PREP"
//    case newBusiness = "NEWB"
//    case claim = "CLAI"
//    case serviceRequest = "SERR"
//    case policyEnquiry = "POLE"
//    case persistency = "PERGRP"
//
//    init?(rawValue:String) {
//        let nRawValue = EnumDashboardCardType.normalize(rawValue)
//        if nRawValue.contains("NOTF") { self = .notification }
//        else if nRawValue.contains("PREP") || nRawValue.contains("PREMPAY") { self = .premiumPayment }
//        else if nRawValue.contains("NEWB") || nRawValue.contains("NBPROP") { self = .newBusiness }
//        else if nRawValue.contains("CLAI") || nRawValue.contains("CLAIMS") { self = .claim }
//        else if nRawValue.contains("POLICYENQ") || nRawValue.contains("POLE") || nRawValue.contains("POL") { self = .policyEnquiry }
//        else if nRawValue.contains("SERVICEREQ") { self = .serviceRequest }
//        else if nRawValue.contains("PERGRP") || nRawValue.contains("PERSISTENCY") { self = .persistency }
//        else { return nil }
//    }
//
//    func image() -> UIImage {
//        switch self {
//        case .notification: return R.image.homeIconNotification()!
//        case .premiumPayment: return R.image.homeIconPayment()!
//        case .newBusiness: return R.image.homeIconNewBiz()!
//        case .claim: return R.image.homeIconClaims()!
//        case .serviceRequest: return R.image.homeIconServReq()!
//        case .policyEnquiry: return R.image.homeIconPolicy()!
//        case .persistency: return R.image.homeIconPersistency()!
//        }
//    }
//
//}

//MARK: Notification

enum EnumNotificationModule:String, CaseInsensitiveWithoutSpaceStringEnum {
    case adHoc = "ADHOC"
    case all = "ALL"
    case calendar = "CAL"
    case claims = "CLM"
    case contact = "CON"
    case nb = "NB"
    case performance = "PFM"
    case persistency = "PST"
    case polenq = "PE"
    case premPay = "PP"
    case serviceReq = "SR"
    case survey = "SURVEY"
}

//"CAL01 - Appointment Expired
//CAL02 - New Invitation (Appointment) Agent invite agent
//CAL03 - New Invitation (Appointment) Agent Invite customer and added an agent to join in
//CAL04 - Appointment Deleted
//CAL05 - Appointment Updates"
enum EnumNotificationEventType: String, CaseInsensitiveWithoutSpaceStringEnum {
    //Calendar
    case expired = "CAL01"
    case inviteAgent = "CAL02"
    case inviteCustomer = "CAL03"
    case deletedAppointment = "CAL04"
    case updateAppointment = "CAL05"
    
    case unknown = ""
    init(type: String) {
        if let ret = EnumNotificationEventType.mapRawValue(type) {
            self = ret
        } else {
            self = .unknown
        }
    }
}

//PFM010 - Receive invitation for join Peer Group
//PFM011 - Joined  to Peer Group
//PFM012 - Reject join Peer Group
//PFM013 - Peer Group deleted
//PFM014 - Remove from Peer Group
enum EnumNotificationPeerGroupEventType: String, CaseInsensitiveWithoutSpaceStringEnum {
    case invitation = "PFM010"
    case accepted = "PFM011"
    case rejected = "PFM012"
    case deletedGroup = "PFM013"
    case removedFromGroup = "PFM014"
    case unknown = ""
    
    init?(rawValue: String) {
        if let ret = EnumNotificationPeerGroupEventType.mapRawValue(rawValue) {
            self = ret
        } else {
            self = .unknown
        }
    }
}

enum EnumNotificationPerformanceEventType: String, CaseInsensitiveWithoutSpaceStringEnum {
    case zeroCaseIn15Days = "PFM001"
    case directTeamZeroSubmissionIn15Days = "PFM002"
    case districtTeamZeroSubmissionIn15Days = "PFM003"
    case zeroCaseIn30Days = "PFM004"
    case directTeamZeroSubmissionIn30Days = "PFM005"
    case districtTeamZeroSubmissionIn30Days = "PFM006"
    case zeroCaseIn60Days = "PFM007"
    case directTeamZeroSubmissionIn60Days = "PFM008"
    case districtTeamZeroSubmissionIn60Days = "PFM009"
    
    case checkedBSC = "PFM015"
    case directTeamBSCLessThan100 = "PFM016"
    case districtTeamBSCLessThan100 = "PFM017"
    case currentQuarterTPCLessThanMaintenance = "PFM018"
    case directTeamBelowMOC = "PFM019"
    case districtTeamBelowMOC = "PFM020"
    case achievedMDRT = "PFM021"
    case directTeamPotentialMDRT = "PFM022"
    case districtTeamPotentialMDRT = "PFM023"
    case persistencyReportRefresh = "PFM024"
    case teamPersistencyReportRefresh = "PFM025"
    case unknown = ""

    init?(rawValue: String) {
        if let ret = EnumNotificationPerformanceEventType.mapRawValue(rawValue) {
            self = ret
        } else {
            self = .unknown
        }
    }
}

enum EnumNotificationCountType:String,CaseInsensitiveWithoutSpaceStringEnum {
    case all = "ALL"
    case adHoc = "ADHOC"
    case claims = "CLM"
    case polenq = "PE"
    case performance = "PERFORMANCE"
    case serviceReq = "SR"
    case nb = "NB"
    case premPay = "PP"
    case contact = "CON"
    case persistency = "PST"
    init?(rawValue:String) {
        let nRawValue = EnumNotificationCountType.normalize(rawValue)
        if nRawValue.contains("ALL") { self = .all }
        else if nRawValue.contains("ADHOC") { self = .adHoc }
        else if nRawValue.contains("PP"){ self = .premPay }
        else if nRawValue.contains("CON"){ self = .contact }
        else if nRawValue.contains("NB") { self = .nb }
        else if nRawValue.contains("CLM")  { self = .claims }
        else if nRawValue.contains("PERFORMANCE")  { self = .performance }
        else if nRawValue.contains("PE") { self = .polenq }
        else if nRawValue.contains("SR") { self = .serviceReq }
        else if nRawValue.contains("PST") || nRawValue.contains("PERGRP") { self = .persistency }
        else { return nil }
    }
}

//enum EnumNotificationType:String,CaseInsensitiveWithoutSpaceStringEnum {
//    case alert = "Alert"
//    case notification = "Notification"
//    case pendingReminder = "Pending/Reminder"
//
//    func iconImage() -> UIImage? {
//        switch self {
//        case .notification: return R.image.positive()
//        case .pendingReminder: return R.image.pending()
//        case .alert: return R.image.negative()
//        }
//    }
//}

enum EnumNotificationRequestType: String {
    case all = "ALL"
    case one = "1"
    case two = "2"
    case three = "3"
}

enum EnumNotificationGroupByType:String, CaseInsensitiveWithoutSpaceStringEnum{
    case none = ""
    case title = "Title"
    case policyId = "Policy ID"
    case survey = "Survey"
}

enum SectionGroupBy: Hashable {
    case none(value: String)
    case title(value: String)
    case policyId(value: String)
    case survey
    
    public var hashValue: Int {
        switch self {
        case .none(let value): return "none".hashValue ^ value.hashValue
        case .title(let value): return "title".hashValue ^ value.hashValue
        case .policyId(let value): return "policyId".hashValue ^ value.hashValue
        case .survey: return "survey".hashValue
        }   
    }
}

//enum EnumGroupByParameterType{
//    case notification
//
//    var groupByJsonURL:URL {
//        switch self {
//        case .notification:
//            return R.file.groupby_notificationJson.url()!
//        }
//    }
//}

//MARK: RemoteNotification
//enum EnumRemoteNotificationRoute {
//    case none
//    case notificationList
//    case notification(model:NotificationCardModel)
//}

//MARK: NewBusiness
enum EnumNewBusinessStatus:String,CaseInsensitiveStringEnum {
    case shortPayment = "SHORT PAYMENT"
    case paymentDonePendingSetInForce = "PAYMENT DONE - PENDING SET-IN-FORCE"
    case deffered = "DEFERRED"
    case counterOffer = "COUNTER OFFER"
    case settledInforce = "SETTLED/IN FORCE"
    case postponed  = "POSTPONED"
    case declined = "DECLINED"
    case withdraw = "WITHDRAW"
    case notTakenUp = "NOT TAKEN UP"
    case incomplete = "INCOMPLETE"
    case pendingUnderwritingInProgress = "PENDING/UNDERWRITING IN PROGRESS"
    case caseOnHoldPendingPayment = "CASE ON HOLD; PENDING PAYMENT"
    case cCRejectedPendingPayment = "CC REJECTED,PENDING PAYMENT"
    case pendingCreditCardDeduction = "PENDING CREDIT CARD DEDUCTION"
    case received = "RECEIVED"
    case outstanding = "OUTSTANDING"
    
    init?(rawValue:String) {
        let cases = EnumNewBusinessStatus.allCases
        let arr = EnumNewBusinessStatus.caseNormalizedRawValues
        let nRawValue = EnumNewBusinessStatus.normalize(rawValue)
        if ["INFORCE", "INFORCED", "IN FORCE", "SETTLED"].contains(nRawValue) {
            self = .settledInforce
            return
        }
        if let index = arr.index(where: {$0 == nRawValue}) {
            self = cases[index]
        } else {
            Log.warning("Cannot initliaze EnumNewBusinessStatus for \(rawValue)")
            return nil
        }
    }
    
    func color() -> UIColor {
        switch self {
        case .postponed, .declined, .withdraw, .notTakenUp, .incomplete, .cCRejectedPendingPayment, .pendingCreditCardDeduction, .outstanding:
            return AIAColors.policyStatusLapsedColor
        case .paymentDonePendingSetInForce, .settledInforce:
            return AIAColors.policyStatusInForceColor
        case .shortPayment, .deffered, .counterOffer, .pendingUnderwritingInProgress, .caseOnHoldPendingPayment, .received:
            return AIAColors.policyStatusPendingColor
        }
    }
}

//MARK: ServiceRequest
enum EnumServiceRequestStatus:String,CaseInsensitiveStringEnum {
    case cancelled = "CANCELLED"
    case close = "CLOSE"
    case closed = "CLOSED"
    case completed = "COMPLETED"
    case inProgress = "IN PROGRESS"
    case incomplete = "INCOMPLETE"
    case newRequest = "NEW REQUEST"
    case void = "Void"
    
    func color() -> UIColor {
        switch self {
        case .cancelled, .void: return AIAColors.policyStatusLapsedColor
        case .close, .closed, .completed: return AIAColors.policyStatusInForceColor
        case .incomplete, .inProgress, .newRequest: return AIAColors.policyStatusPendingColor
        }
    }
}

//MARK: PremiumPayment
enum EnumPremiumPaymentStatus:String,CaseInsensitiveStringEnum {
    case paymentApplied = "PAYMENT APPLIED TO PREMIUM"
    case premiumHoliday = "PREMIUM HOLIDAY"
    
    func color() -> UIColor {
        switch self {
        case .premiumHoliday:
            return AIAColors.policyStatusLapsedColor
        case .paymentApplied:
            return AIAColors.policyStatusInForceColor
        }
    }
}

//MARK: Claim
typealias EnumLogStatus = EnumClaimsStatus
enum EnumClaimsStatus:String,CaseInsensitiveStringEnum {
    case pendingReview = "PENDING REVIEW"
    case received = "RECEIVED"
    case registration = "REGISTRATION"
    case declined = "DECLINED"
    case cancelled = "CANCELLED"
    case deferred = "DEFERRED"
    case outstandingDeffered = "OUTSTANDING / DEFERRED"
    case settled = "SETTLED"
    case approved = "APPROVED"
    case closed = "CLOSED"
    case withdrawn = "WITHDRAWN"
    case pending = "PENDING"
    case rejected = "REJECTED"
    case void = "VOID"

    func color() -> UIColor {
        switch self {
        case .declined, .cancelled, .deferred, .outstandingDeffered, .withdrawn, .void, .rejected: return AIAColors.policyStatusLapsedColor
        case .settled, .approved, .closed: return AIAColors.policyStatusInForceColor
        case .pendingReview, .received, .registration, .pending: return AIAColors.policyStatusPendingColor
        }
    }
}

//MARK: Policy
enum EnumPolicyStatus:String,CaseInsensitiveStringEnum {
    case certfcteprinted = "CERTFCTE PRINTED"
    case contractPrinted = "CONTRACT PRINTED"
    case inForce = "IN FORCE"
    case inForceContribpaying = "IN FORCE + CONTRIB PAYING"
    case inForceDPOActive = "IN FORCE + DPO ACTIVE"
    case inForceExtendedTermInsurance = "IN FORCE + EXTENDED TERM INSURANCE"
    case inForcePremiumPaying = "IN FORCE + PREMIUM PAYING"
    case inForceSVE = "IN FORCE + SVE"
    case awaitingRenewal = "AWAITING RENEWAL"
    case certfctematured = "CERTFCTE MATURED"
    case cleanupPolicy = "CLEAN-UP POLICY"
    case componentchangeAddprpsl = "COMPONENT CHANGE - ADD PRPSL"
    case componentchangesmodifyprp = "COMPONENT CHANGES - MODIFY PRP"
    case contractDeclined = "CONTRACT DECLINED"
    case contractMatured = "CONTRACT MATURED"
    case contractPostponed = "CONTRACT POSTPONED"
    case coverNote = "COVER NOTE"
    case coverNoteEndorsement = "COVER NOTE ENDORSEMENT"
    case ctbdupCertfcte = "CTBD UP CERTFCTE"
    case declined = "DECLINED"
    case dPO = "DPO"
    case dummy = "DUMMY"
    case expiry = "EXPIRY"
    case extendedTerm = "EXTENDED TERM"
    case firstReminder = "FIRST REMINDER"
    case historyCovernote = "HISTORY COVERNOTE"
    case manuallyReviewed = "MANUALLY REVIEWED"
    case mASSuspended = "MAS SUSPENDED"
    case paidUpContract = "PAID UP CONTRACT"
    case pendingCoverNote = "PENDING COVER NOTE"
    case pendingDrRequirement = "PENDING DR REQUIREMENT"
    case pendingReview = "PENDING REVIEW"
    case pHReinstatementPending = "PH REINSTATEMENT PENDING"
    case policyArchived = "POLICY ARCHIVED"
    case postponed = "POSTPONED"
    case quotation = "QUOTATION"
    case quotationConverted = "QUOTATION CONVERTED"
    case quotationDeclined = "QUOTATION DECLINED"
    case reviewRequired = "REVIEW REQUIRED"
    case secondReminder = "SECOND REMINDER"
    case takeupPolicy = "TAKE-UP POLICY"
    case temporarySuspend = "TEMPORARY SUSPEND"
    case vestingRegistered = "VESTING REGISTERED"
    case windforwardPending = "WINDFORWARD PENDING"
    case accidentalAdvancePayment = "ACCIDENTAL ADVANCE PAYMENT"
    case accidentalTPD = "ACCIDENTAL TPD"
    case cancelled = "CANCELLED"
    case cancelledfromInception = "CANCELLED FROM INCEPTION"
    case certfctelapsed = "CERTFCTE LAPSED"
    case certfctesurrendered = "CERTFCTE SURRENDERED"
    case certfcteterminated = "CERTFCTE TERMINATED"
    case contractLapsed = "CONTRACT LAPSED +"
    case contractSurrendered = "CONTRACT SURRENDERED"
    case contractTerminated = "CONTRACT TERMINATED"
    case contractWithdrawn = "CONTRACT WITHDRAWN"
    case deathClaimRecommendation = "DEATH CLAIM RECOMMENDATION"
    case expired = "EXPIRED"
    case freeLookcancellation = "FREE LOOK CANCELLATION"
    case incomplete = "INCOMPLETE"
    case lapsed = "LAPSED"
    case manualTerminated = "MANUAL TERMINATED"
    case naturalAPWP = "NATURAL APWP"
    case naturalTPD = "NATURAL TPD"
    case notTakenUp = "NOT TAKEN UP"
    case pendingRenewal = "PENDING RENEWAL"
    case registeredDeathClaim = "REGISTERED DEATH CLAIM"
    case terminatedduetoclaim = "TERMINATED DUE TO CLAIM"
    case withdrawn = "WITHDRAWN"
    case pendingEndorsement = "PENDING ENDORSEMENT"
    case certfcteProposal  = "CERTFCTE PROPOSAL"
    case pendingNewBusiness = "PENDING NEW BUSINESS"
    case underwritingApproval = "UNDERWRITING APPROVAL"
    
    func color() -> UIColor {
        switch self {
        case .certfcteprinted, .contractPrinted, .inForce, .inForceContribpaying, .inForceDPOActive, .inForceExtendedTermInsurance, .inForcePremiumPaying, .inForceSVE:
            return AIAColors.policyStatusInForceColor
        case .awaitingRenewal, .certfctematured, .cleanupPolicy, .componentchangeAddprpsl, .componentchangesmodifyprp, .contractDeclined, .contractMatured, .contractPostponed, .coverNote, .coverNoteEndorsement, .ctbdupCertfcte, .declined, .dPO, .dummy, .expiry, .extendedTerm, .firstReminder, .historyCovernote, .manuallyReviewed, .mASSuspended, .paidUpContract, .pendingCoverNote, .pendingDrRequirement, .pendingReview, .pHReinstatementPending, .policyArchived, .postponed, .quotation, .quotationConverted, .quotationDeclined, .reviewRequired, .secondReminder, .takeupPolicy, .temporarySuspend, .vestingRegistered, .windforwardPending, .certfcteProposal, .pendingNewBusiness, .underwritingApproval:
            return AIAColors.policyStatusPendingColor
        case .accidentalAdvancePayment, .accidentalTPD, .cancelled, .cancelledfromInception, .certfctelapsed, .certfctesurrendered, .certfcteterminated, .contractLapsed, .contractSurrendered, .contractTerminated, .contractWithdrawn, .deathClaimRecommendation, .expired, .freeLookcancellation, .incomplete, .lapsed, .manualTerminated, .naturalAPWP, .naturalTPD, .notTakenUp, .pendingRenewal, .registeredDeathClaim, .terminatedduetoclaim, .withdrawn, .pendingEndorsement:
            return AIAColors.policyStatusLapsedColor
        }
    }
}

enum EnumLineOfBusiness: String {
    case la = "LA"
    case laft = "LAFT"
    case pa = "PA"
}

enum EnumVitalityType: String {
    case on = "Y"
    case off = "N"
    case unknown = ""
    
    var iconImage: UIImage? {
        switch self {
        case .on: return nil
        case .off: return nil
        case .unknown: return nil
        }
    }
    
    var isHiddingVitalityRow: Bool {
        switch self {
        case .unknown: return true
        default: return false
        }
    }
}

enum EnumPolicyProdCategory: String, CaseInsensitiveStringEnum {
    case annuityRider = "A"
    case tpd = "D"
    case endownment = "E"
    case health = "H"
    case waiverIllness = "I"
    case criticalIllness = "C"
    case life = "L"
    case ordinaryLife = "O"
    case pensionFund = "P"
    case term = "T"
    case universalLife = "U"
    case unitLinkedFund = "V"
    
//    var policyIconImage: UIImage {
//        switch self {
//        case .annuityRider: return R.image.policy_ordinarylife_term_universallite()!
//        case .tpd: return R.image.policy_total_personal_disability()!
//        case .endownment: return R.image.policy_endowment()!
//        case .health: return R.image.policy_health()!
//        case .waiverIllness: return R.image.policy_ordinarylife_term_universallite()!
//        case .criticalIllness: return R.image.policy_ordinarylife_term_universallite()!
//        case .life: return R.image.policy_ordinarylife_term_universallite()!
//        case .ordinaryLife: return R.image.policy_ordinarylife_term_universallite()!
//        case .pensionFund: return R.image.policy_ordinarylife_term_universallite()!
//        case .term: return R.image.policy_ordinarylife_term_universallite()!
//        case .universalLife: return R.image.policy_ordinarylife_term_universallite()!
//        case .unitLinkedFund: return R.image.policy_unit_linked_fund()!
//        }
//    }
}

enum EnumAgencySortByOptions: String {
    case achievementTargetHighest = "achievementVTargetHighest"
    case achievementTargetLowest = "achievementVTargetLowest"
    case ANPLowest = "anpLowest"
    case ANPHighest = "anpHighest"
    case alphabetical = "alphabetASC"
    case alphabeticalDESC = "alphabetDESC"
}
typealias EnumAgentSortByOptions = EnumAgencySortByOptions

enum EnumAgentType: String,CaseInsensitiveStringEnum {
    case wa = "WA"
    case sa = "SA"
    func getTitle() -> String {
        switch self {
        case .wa: return "Writing Agent"
        case .sa: return "Servicing Agent"
        }
    }
}

//MARK: Search
enum EnumSearchParameterModuleType: String {
    case search = "search"
    case newBusiness = "NB"
    case policy = "PE"
    case contact = "contact"
    case premiumPayment = "PP"
    case claim = "CLM"
    case serviceRequest = "SR"
    case persistency = "PST"
    case notification = "notification"
    case agency = "agency"
    case agent = "agent"
    case customer = "customer"
    case referrer = "referrer"
    case contactLeadSalesOppTransfer = "contactleadsalesopptransfer"
    case contactLeadSalesOppReceive = "contactleadsalesoppreceive"
    case contactLead = "contactLead"
    case calendar = "calendar"
    case addParticipants = "addParticipants"
    
    func getTitle() -> String {
        switch self {
        case .contact: return "Contact"
        case .newBusiness: return "New Business"
        case .policy: return "Policy"
        case .premiumPayment: return "Premium Payment"
        case .claim: return "Claim"
        case .serviceRequest: return "Service Request"
        case .persistency: return "Persistency"
        case .agency: return "Agency"
        case .agent: return "Agent"
        case .customer: return "Select Customer"
        case .referrer: return "Select Referrer"
        case .contactLeadSalesOppTransfer: return "Transfer Sales Opportunity"
        case .contactLeadSalesOppReceive: return "Agent List"
        case .contactLead: return "Contact"
        case .calendar: return "Calendar"
        case .addParticipants: return "Add Participants"
        default : return "current"
        }
    }
}

enum EnumSearchType {
    case contact
    case policy
    case notification
    case newBusiness
}


//MARK: Module - Pager
enum EnumPagerModuleType {
    case agencyList
    case notification
    case moduleDetail
    case performanceDashboard
    case contacts
    case contactAgent
    case whiteTabWithSeparator
}

//MARK: Module - Group
enum GroupModel {
    //case groupingModel(GroupingModel)
    case groupingModel
    //case userFilter(RealmFilter?)
    case userFilter
}

//MARK: Module - List
enum EnumModuleListType {
    case normalList
    case contactResultList
    case policyResultList
    case newBusinessResultList
}

//MARK: Module - Detail
enum EnumMenuItemType:String {
    case recentNotifications = "recentNotifications"
    case otherPolicies = "otherPolicies"
}

//MARK: Login
enum EnumAIAURL {
    case forgotPassword
    case register
    case tnc
    case faq
    
    func getTitle() -> String {
        switch self {
        case .forgotPassword: return "FORGOT PASSWORD"
        case .register: return "REGISTER"
        case .tnc: return "TERMS AND CONDITIONS"
        case .faq: return "FAQ"
        }
    }
}

enum EnumStaffRank: String,CaseInsenstiveAlphaNumericsStringEnum {
    case BDE = "BDE" // /XX
    case CAO = "CAO" // ///
    case CEO = "CEO" // //X
    case DOA = "DOA" // ///
    case EDOA = "EDOA" // ///
    case HEAD = "HEAD" // ///
    case NCAO = "NCAO" // //X
    case RTS = "RTS" // /XX
    case SBDE = "SBDE" // XXX
    case SDOA = "SDOA" // XXX
}

//MARK: AgentProfile
enum EnumAgentRank: String,CaseInsenstiveAlphaNumericsStringEnum {
    case TiedAgencyAgent = "Tied Agency - Agent" // /XX
    case TiedAgencyDM = "Tied Agency - DM" // ///
    case TiedAgencyUM = "Tied Agency - UM" // //X
    case TiedAgencyAIA = "Tied Agency – AIA" // ///
    case TiedAgencyALC = "Tied Agency – ALC" // ///
    case IFAFACompany = "IFA-FA Company" // ///
    case IFAFALeader = "IFA-FA leader" // //X
    case IFAFAR = "IFA-FAR" // /XX
    case BancaHQ = "Banca-HQ" // XXX
    case BancaAgent = "Banca-Agent" // XXX
    
    var agencyAgentRank: EnumAgencyAgentRank {
        return EnumAgencyAgentRank(rawValue: self.rawValue) ?? .unknown
    }
}

enum EnumAgencyAgentRank: String, ComparableEnum, CaseInsenstiveAlphaNumericsStringEnum {
    case AGT = "AGT"
    case UM = "UM"
    case DM = "DM"
    case unknown = ""
    
    init?(rawValue: String) {
        if let ret  = EnumAgencyAgentRank.mapRawValue(rawValue) {
            self = ret
        } else {
            if let agentRank = EnumAgentRank.mapRawValue(rawValue) {
                switch agentRank {
                case .TiedAgencyAgent, .IFAFAR:
                    self = .AGT
                case .TiedAgencyDM, .TiedAgencyAIA, .TiedAgencyALC, .IFAFACompany:
                    self = .DM
                case .TiedAgencyUM, .IFAFALeader:
                    self = .UM
                case .BancaHQ, .BancaAgent:
                    self = .unknown
                }
            } else {
                self = .unknown
            }
        }
    }
//
//    func getAgentImage() -> UIImage {
//        switch self {
//        case .AGT: return R.image.agt()!
//        case .DM: return R.image.dm()!
//        case .UM: return R.image.um()!
//        case .unknown: return R.image.agt()!
//        }
//    }
    
    var getPdCategory: EnumPdCategory{
        switch self {
        case .AGT: return .personal
        case .DM: return .district
        case .UM: return .direct
        case .unknown: return .personal
        }
    }
    
    var aPIId:String {
        switch self {
        case .AGT: return "agent"
        case .DM: return "district"
        case .UM: return "direct"
        case .unknown: return "agent"
        }
    }
}


//MARK: Performance

typealias EnumPerformanceModule = EnumPdListing
typealias EnumPerformanceModuleCategory = EnumPdCategory
typealias EnumPerformanceModuleCategoryType = EnumDashboardPerformanceModuleType

enum EnumPdListing: String,CaseInsensitiveStringEnum {
    case anp = "ANP"
    case balanceScoreCard = "BSC"
    case income = "INCOME"
    case mdrt = "MDRT"
    case convention = "CONC"
    case totalProductionCount = "TPC"
    case persistency = "PST"
    case caseCount = "CC"
    case vitality = "VITALITY"
    case appointments = "APPOINTMENTS"
    case calls = "CALLS"
    case notMeetingMOC = "NOTMEETINGMOC"
    case salesOpportunity = "SALESOPPORTUNITY"
    case ranking = "RANKING"
    case unknown = ""
    
//    init?(card: PerformanceCardsViewModel.Card) {
//        switch card {
//        case .anp: self = .anp
//        case .balanceScoreCard: self = .balanceScoreCard
//        case .monthlyIncome: self = .income
//        case .mdrt: self = .mdrt
//        case .conventions: self = .convention
//        case .totalProductionCredit: self = .totalProductionCount
//        case .persistency: self = .persistency
//        case .caseCount: self = .caseCount
//        case .vitality: self = .vitality
//        case .appointments: self = .appointments
//        case .calls: self = .calls
//        default: return nil
//        }
//    }
    
    var performanceCardTitle:String {
        switch self {
        case .anp: return "ANP (YTD)"
        case .balanceScoreCard: return "Balanced Score Card"
        case .income: return "Monthly Income "
        case .mdrt: return "MDRT (FYP)"
        case .convention: return "Conventions"
        case .totalProductionCount: return "Total Production Credit"
        case .persistency: return "Persistency"
        case .caseCount: return "Case Count"
        case .vitality: return "Vitality"
        case .appointments: return "Appointments"
        case .calls: return "Calls"
        case .notMeetingMOC: return "Not Meeting MOC (TPC)"
        case .salesOpportunity: return "Sales Opportunity"
        case .ranking: return "Ranking"
        case .unknown: return ""
        }
    }
}

enum EnumPdCategory: String,CaseInsensitiveStringEnum {
    case personal = "personal"
    case district = "district"
    case direct = "direct"
    
//    static func getPDCategoryByIndex(index: Int)->EnumPdCategory {
//        let mirrorAccessService = DIContainer.resolve(AIAMirrorAccessService.self)!
//        let rank:String? = mirrorAccessService.getCurrentLoggedInUser()?.agentRank ?? ""
//        let agentRank:EnumAgencyAgentRank = rank.flatMap { EnumAgencyAgentRank(rawValue:$0) } ?? EnumAgencyAgentRank.AGT
//        
//        if(index == 0) {
//            return EnumPdCategory.personal
//        }
//        else if(index == 1) {
//            if(agentRank == .DM) {
//                return EnumPdCategory.direct
//            }
//            else {
//                 return EnumPdCategory.district
//            }
//        }
//        else {
//            switch agentRank {
//            case .DM : return EnumPdCategory.district
//            case .UM: return EnumPdCategory.direct
//            case .AGT: return EnumPdCategory.personal
//            case .unknown: return EnumPdCategory.personal
//            }
//        }
//    }
}

enum EnumPeriodType: Int {
    case ytd = 0
    case hy = 1
    case qtd = 2
    case mtd = 3
    
    var periodString: String {
        switch self {
        case .ytd: return "YTD"
        case .hy: return "HY"
        case .qtd: return "QTD"
        case .mtd: return "MTD"
        }
    }
    
    var optionText: String {
        return self.periodString
    }
}
//MARK: Performance MDRT
enum EnumMDRTFigureType: String, CaseInsensitiveStringEnum {
    case fyp = "FYP"
    case fyc = "FYC"
    case income = "INCOME"
}

typealias EnumMDRTRankType = EnumMDRTTabTitle
enum EnumMDRTTabTitle: String {
    case mdrt = "MDRT"
    case cot = "COT"
    case tot = "TOT"
    
    static func getEnumMDRTTabTitleList()->[EnumMDRTTabTitle] {
        return [.mdrt, .cot, .tot]
    }
}
//MARK: Performance Band
enum EnumPerformanceBandType: String, CaseInsensitiveStringEnum {
    case AN_P = "AN-P"
    case AN_BSC = "AN-BSC"
    case AG = "AG"
    case CCC = "CCC"
    case SCC = "SCC"
    case NMM = "NMM"
    case AI  = "AI"
    case LCOUNT = "LCOUNT"
    case SC = "SC"
    case SSC = "SSC"
    case AN_APPT = "AN-APPT"
    case AN_MDRT = "AN-MDRT"
    case AN_CALLS = "AN-CALLS"
    case LCONV = "LCONV"
}

enum EnumPerformanceBandPeriod: String, CaseInsensitiveStringEnum {
    case D0 = "D0"
    case D1 = "D1"
    case D2 = "D2"
    case YTD = "YTD"
    case HY = "HY"
    case QTD = "QTD"
    case MTD  = "MTD"
    case Sixmonth = "6 Months"
    case Threemonth = "3 Months"
    case Lastweek = "Last Week"
    case Thisweek = "This Week"
    case Thismonth = "This Month"
}

enum EnumPersistencyType: Int {
    case d0 = 0
    case d1 = 1
    case d2 = 2
    
    var periodString: String {
        switch self {
        case .d0: return "D0"
        case .d1: return "D1"
        case .d2: return "D2"
        }
    }
    
    var optionText: String {
        return self.periodString
    }
}

enum EnumSalesOpportunityType: Int {
    case thisweek = 0
    case lastweek = 1
    case thismonth = 2
    case threemonth = 3
    case sixmonth = 4
    
    var periodString: String {
        switch self {
        case .thisweek: return "This Week"
        case .lastweek: return "Last Week"
        case .thismonth: return "This Mo"
        case .threemonth: return "3 Mo"
        case .sixmonth: return "6 Mo"
        }
    }
    
    var optionText: String {
        return self.periodString
    }
}

extension EnumPeriodType {
    var anpViewTitleGoalString: String {
        switch self {
        case .ytd: return "YTD GOAL"
        case .hy: return "HY GOAL"
        case .qtd: return "QTD GOAL"
        case .mtd: return "MTD GOAL"
        }
    }
}

//MARK: Performance - Income
enum EnumIncomeCategoryCode : String, CaseInsensitiveStringEnum, ComparableEnum {
    case PerBasic = "PerBasic"
    case PerBSC = "PerBSC"
    case PerBonus = "PerBonus"
    case DirectOR = "DirectOR"
    case DirectBSC = "DirectBSC"
    case DirectBonus = "DirectBonus"
    case DistrictOR = "DistrictOR"
    case DistrictBSC = "DistrictBSC"
    case DistrictBonus = "DistrictBonus"
    case Other = "Other"
    case unknown = ""
    
    var chartColor: UIColor {
        switch self {
        case .PerBasic: return AIAColors.PerformanceIncomeCategoryColor.PerBasic
        case .PerBSC: return AIAColors.PerformanceIncomeCategoryColor.PerBSC
        case .PerBonus: return AIAColors.PerformanceIncomeCategoryColor.PerBonus
        case .DirectOR: return AIAColors.PerformanceIncomeCategoryColor.DirectOR
        case .DirectBSC: return AIAColors.PerformanceIncomeCategoryColor.DirectBSC
        case .DirectBonus: return AIAColors.PerformanceIncomeCategoryColor.DirectBonus
        case .DistrictOR: return AIAColors.PerformanceIncomeCategoryColor.DistrictOR
        case .DistrictBSC: return AIAColors.PerformanceIncomeCategoryColor.DistrictBSC
        case .DistrictBonus: return AIAColors.PerformanceIncomeCategoryColor.DistrictBonus
        case .Other: return AIAColors.PerformanceIncomeCategoryColor.Other
        case .unknown: return AIAColors.PerformanceIncomeCategoryColor.unknown
        }
    }
    
    var categoryDescription: String {
        switch self {
        case .PerBasic: return "Basic Comm (Personal)"
        case .PerBSC: return "BSC (Personal)"
        case .PerBonus: return "Bonus (Personal)"
        case .DirectOR: return "OR (Direct)"
        case .DirectBSC: return "BSC (Direct)"
        case .DirectBonus: return "Bonus (Direct)"
        case .DistrictOR: return "OR (District)"
        case .DistrictBSC: return "BSC (District)"
        case .DistrictBonus: return "Bonus (District)"
        case .Other: return "Other"
        case .unknown: return ""
        }
    }
}

//MARK: Performance - BalanceScoreCard
enum BalanceScoreCardChartTitle: String {
    case afyp = "AFYP/Cases"
    case cff = "CFF"
    case persistencyD1 = "Persistency D1"
    case persistencyD2 = "Persistency D2"
    case complaints = "Complaints"
    case mandatoryThcpd = "Mandatory/Total Hours CPD"
    
    func getChartColor()-> UIColor {
        switch self {
        case .afyp: return AIAColors.tertiaryRed
        case .cff: return AIAColors.primaryPurple
        case .persistencyD1: return AIAColors.tertiaryBlue
        case .persistencyD2: return UIColor.orange
        case .complaints: return AIAColors.tertiaryGreen
        case .mandatoryThcpd: return AIAColors.tertiaryGreen
        }
    }
}

enum EnumErrorPercentageCode: Double {
    case zeroTarget = -1.0
}
//MARK: Performance - ANP
typealias EnumPdPreviousANPMonth = EnumMonth
//MARK: Performance - MDRT
enum EnumMDRTAchievementTitle: String {
    case mdrt = "mdrt"
    case cot = "cot"
    case tot = "tot"

//    var iconImage: [UIImage]? {
//        switch self {
//        case .mdrt: return [R.image.vitality_Active()!]
//        case .cot: return [R.image.vitality_Active()!, R.image.vitality_Inactive()!]
//        case .tot: return [R.image.vitality_Active()!, R.image.vitality_Inactive()!, R.image.aiaBrandingLogo()!]
//        }
//    }
}
//MARK: Performance - Convention
enum EnumConventionTargetUnit: String, CaseInsensitiveStringEnum {
    case TPC = "TPC" //TPC
    case TPCC = "TPCC" //TPC Convention
    case FYC = "FYC" //FYC
    case FYP = "FYP" //FYP
    case ANP = "ANP" //ANP
    case AFYP = "AFYP" //AFYP
    case NR = "NR" //New Recruit
    case PR = "PR" //PR
    case CCC = "CCC" //Captured Case Count
    case SCC = "SCC" //Submitted Case Count
    case unknown = ""
}

enum EnumConventionCategory: String {
    case conventionTPC = "conventionTPC"
    case conventionANP = "conventionANP"
    case unknown = ""

    func getKey() -> String {
        switch self {
            case.conventionTPC: return "TPC"
            case .conventionANP: return "ANP"
            default : return ""
        }
    }
}


//MARK: StaffAccess
enum EnumRegionDropdownSelection {
    case region
    case subRegion
    case branch
    case notSelected
}

enum EnumRegionLevel: String {
   case allReg = "AllReg"
   case region = "Region"
   case subRegion = "SubRegion"
   case branch = "Branch"
   case staff = "Staff"
   case unknown = ""
    
    static func normalize(_ value:String) -> String {
        return value
            .replacingOccurrences(of: " ", with: "")
    }
    
    init?(rawValue:String) {
        let nRawValue = EnumRegionLevel.normalize(rawValue)
        if nRawValue.contains("AllReg") { self = .allReg }
        else if nRawValue.contains("Region") { self = .region }
        else if nRawValue.contains("SubRegion") { self = .subRegion }
        else if nRawValue.contains("Branch") { self = .branch }
        else if nRawValue.contains("Staff") { self = .staff }
        else { return nil }
    }
}


// MARK: - Contact Lead Module -

enum EnumEventDetailsRoute {
//    case appointmentDetail(intent: ContactLeadAppointmentDetailsViewModel.Intent)
//    case reminderDetail(intent: ContactLeadReminderDetailsViewModel.Intent)
//    case none
//
//    init(intent: ContactLeadAppointmentDetailsViewModel.Intent) {
//        self = EnumEventDetailsRoute.appointmentDetail(intent: intent)
//    }
//
//    init(intent: ContactLeadReminderDetailsViewModel.Intent) {
//        self = EnumEventDetailsRoute.reminderDetail(intent: intent)
//    }
//
//    init() {
//        self = EnumEventDetailsRoute.none
//    }
}

enum EnumEventType: Int {
    case appointment = 0
    case reminder = 1
    case otherEvent = 2
    
//    func image(subEvent: EnumOtherEventType? = nil) -> UIImage {
//        switch self {
//        case .appointment: return R.image.appointment_white()!
//        case .reminder: return R.image.reminder_white()!
//        case .otherEvent:
//            // FIXME: Pending icon
//            if let subEvent = subEvent {
//                switch subEvent {
//                case .birthday: return R.image.birthday_red()!
//                case .maturing: return R.image.negative()!
//                case .premiumTermEnding: return R.image.negative()!
//                }
//            } else {
//                return R.image.staff_alert()! // Shouldn't happen
//            }
//        }
//    }
}

enum EnumOtherEventType: String, CaseInsensitiveStringEnum {
    case birthday = "birthday"
    case maturing = "maturing"
    case premiumTermEnding = "premiumtermending"
}

enum EnumPhoneCallMessageOption: Int {
    case phone = 0
    case message = 1
    
    init(rawValue: Int) {
        switch rawValue {
        case 0: self = EnumPhoneCallMessageOption.phone
        case 1: self = EnumPhoneCallMessageOption.message
        default: self = EnumPhoneCallMessageOption.phone
        }
    }
    
    var settingTitle: String {
        switch self {
        case .phone: return "PHONE CALL SETTINGS"
        case .message: return "MESSAGE SETTINGS"
        }
    }
    
    var adbTitle: String {
        switch self {
        case .phone: return "phonecall"
        case .message: return "message"
        }
    }
}

enum EnumCalendarEventPurpose: String, CaseInsensitiveStringEnum {
    case sales = "SALES"
    case recruit = "RECRUIT"
    case service = "SERVICE"
    case event = "EVENT"
    case training = "TRAINING"
    case coach = "COACHING"
    case other = "OTHER"
    case personal = "PERSONAL"
    case reminder = "REMINDER" // Reminder is Odd case here, EnumCalendarEventPurpose actually for Appointment
    case unknown = ""
    
    init?(rawValue: String) {
        if let ret  = EnumCalendarEventPurpose.mapRawValue(rawValue) {
            self = ret
        } else {
            self = .unknown
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .sales: return UIColor(hexString: "39C089")!
        case .recruit: return UIColor(hexString: "F5A83B")!
        case .service: return UIColor(hexString: "E03572")!
        case .event: return UIColor(hexString: "1C7689")!
        case .training: return UIColor(hexString: "A03FB8")!
        case .coach: return UIColor(hexString: "1C8AED")!
        case .other: return UIColor(hexString: "5A6C80")!
        case .personal: return UIColor(hexString: "5367B4")!
        case .reminder: return UIColor(hexString: "9D9D9D")!
        case .unknown: return .black
        }
    }
    
    var displayText: String {
        switch self {
        case .coach: return "COACHING/REVIEW"
        default: return self.rawValue.uppercased()
        }
    }
}

enum EnumDefaultNotifyViaType: Int {
    case notset = 0
    case whatsapp = 1
    case phone = 2
    
    init(rawValue: Int) {
        switch rawValue {
        case 0: self = EnumDefaultNotifyViaType.notset
        case 1: self = EnumDefaultNotifyViaType.whatsapp
        case 2: self = EnumDefaultNotifyViaType.phone
        default: self = EnumDefaultNotifyViaType.notset
        }
    }
    
    var title: String {
        switch self {
        case .notset: return "Not Set"
        case .whatsapp: return "WhatsApp"
        case .phone: return "Phone"
        }
    }
}

//MARK: ContactLead

enum EnumContactModule:String,CaseInsensitiveStringEnum {
    case all = "ALL"
    case newLeads = "NEW LEADS"
    case existingCustomerLeads = "EXISTING CUSTOMER LEADS"
    case potential = "POTENTIAL"
    case transferred = "TRANSFERRED"
    case transferLead = "TRANSFER LEAD"
    case agentProfile = "AGENTPROFILE" //tis is for agent profile, doesn't exist in other contact modules
    
    var id: String {
        switch self {
        case .all: return "All"
        case .newLeads: return "NewLead"
        case .existingCustomerLeads: return "ExistingCustomerLeads"
        case .potential: return "Potential"
        case .transferred: return "Transferred"
        case .transferLead: return "TransferLead"
        case .agentProfile: return "Agent Profile"
        }
    }
    
    var pageNo: Int {
        switch self {
        case .all: return 0
        case .newLeads: return 1
        case .existingCustomerLeads: return 2
        case .potential: return 3
        case .transferred: return 4
        case .transferLead: return 99
        case .agentProfile: return 99
        }
    }
    
    static func getContactModuleByIndex(index: Int)->EnumContactModule {
        if(index == 0) {
            return EnumContactModule.all
        }
        else if(index == 1) {
           return EnumContactModule.newLeads
        }
        else if(index == 2) {
            return EnumContactModule.existingCustomerLeads
        }
        else if(index == 3) {
            return EnumContactModule.potential
        }
        else if(index == 4) {
            return EnumContactModule.transferred
        }
        return EnumContactModule.all
    }
    
    var title: String {
        switch self {
        case .all: return "ALL"
        case .newLeads: return "NEW LEADS"
        case .existingCustomerLeads: return "EXISTING CUSTOMER LEADS"
        case .potential: return "POTENTIAL"
        case .transferred: return "TRANSFERRED"
        case .transferLead: return "TRANSFER LEAD"
        case .agentProfile: return "AGENT PROFILE"
        }
    }
    
//    var tooltipText:String {
//        switch self {
//        case .newLeads: return R.string.main.contactlead_tooltip_newLeads()
//        case .existingCustomerLeads: return R.string.main.contactlead_tooltip_existingCustomerLeads()
//        case .potential: return R.string.main.contactlead_tooltip_potential()
//        case .transferred: return R.string.main.contactlead_tooltip_transferred()
//        default: return ""
//        }
//    }
}

enum EnumContactDetailsModule: String, CaseInsensitiveStringEnum {
    case info = "INFO"
    case salesOpportunity = "SALES OPPORTUNITY"
    case polices = "POLICIES"
    case notifications = "NOTIFICATIONS"
}

enum EnumCallRecordPurpose: String, CaseInsensitiveStringEnum, ComparableEnum {
    case sales = "Sales"
    case recruit = "Recruit"
    case service = "Service"
    case event = "Event"
    case training = "Training"
    case coach = "Coaching"
    case other = "Other"
    case unknown = ""
    
    init?(rawValue: String) {
        if let ret  = EnumCallRecordPurpose.mapRawValue(rawValue) {
            self = ret
        } else {
            self = .unknown
        }
    }

    var apiInput: String {
        return self.rawValue
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .sales: return self.colorWithHexString(hex: "39C089")
        case .recruit: return self.colorWithHexString(hex: "F5A83B")
        case .service: return self.colorWithHexString(hex: "E03572")
        case .event: return self.colorWithHexString(hex: "1C7689")
        case .training: return self.colorWithHexString(hex: "A03FB8")
        case .coach: return self.colorWithHexString(hex: "1C8AED")
        case .other: return self.colorWithHexString(hex: "5A6C80")
        case .unknown: return UIColor.black
        }
    }
    
    // FIXME: remove this , use AIAColor func later
    private func colorWithHexString(hex: String) -> UIColor {
        
        var cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.characters.count != 6) {
            return UIColor.gray
        }
        
        let rString = (cString as NSString).substring(to: 2)
        let gString = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        let bString = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    var optionText: String {
        switch self {
        case .recruit: return "RECRUIT"
        case .sales: return "SALES"
        case .service: return "SERVICE"
        case .event: return "EVENT"
        case .training: return "TRAINING"
        case .coach: return "COACHING / REVIEW"
        case .other: return "OTHER"
        case .unknown: return ""
        }
    }
    
    var capitalizedOptionText: String {
        return optionText.capitalized
    }
}
enum EnumContactGender: String, CaseInsensitiveStringEnum {
    case male = "MALE"
    case female = "FEMALE"
    case others = "OTHERS"
    
    var optionText: String {
        switch self {
        case .male: return "Male"
        case .female: return "Female"
        case .others: return "Others"
        }
    }
    
    init?(rawValue: String) {
        let nRawValue = EnumContactGender.normalize(rawValue)
        if ["MALE", "M"].contains(nRawValue) { self = .male }
        else if ["FEMALE", "FEMAL", "F"].contains(nRawValue) { self = .female }
        else if ["OTHER", "OTHERS", "OTH", "OTHS"].contains(nRawValue) { self = .others }
        else { return nil }
    }
}

// new, to replace EnumReminderTimeInterval
typealias EnumReminderTimeInterval = EnumReminderInterval
enum EnumReminderInterval: String, CaseIterable, CaseInsensitiveStringEnum {
    case interval15m = "15m"
    case interval30m = "30m"
    case interval1h = "1h"
    case interval2h = "2h"
    case interval3h = "3h"
    case interval1d = "1d"
    case interval1w = "1w"
    static var optionList: [String] { return EnumReminderInterval.allCases.map { $0.rawValue } }
    
    var optionText: String {
        switch self {
        case .interval15m: return "15 minutes before"
        case .interval30m: return "30 minutes before"
        case .interval1h: return "1 hour before"
        case .interval2h: return "2 hours before"
        case .interval3h: return "3 hours before"
        case .interval1d: return "1 day before"
        case .interval1w: return "1 week before"
        }
    }
    
    var descriptionText: String {
        switch self {
        case .interval15m: return "15 minutes"
        case .interval30m: return "30 minutes"
        case .interval1h: return "1 hour"
        case .interval2h: return "2 hours"
        case .interval3h: return "3 hours"
        case .interval1d: return "1 day"
        case .interval1w: return "1 week"
        }
    }
    
    var dateIntervalValue: Int {
        switch self {
        case .interval15m :
            return 15
        case .interval30m:
            return 30
        case .interval1h:
            return 1
        case .interval2h:
            return 2
        case .interval3h:
            return 3
        case .interval1d:
            return 1
        case .interval1w:
            return 7
        }
    }
}

enum EnumContactRace: String, CaseInsensitiveStringEnum {
    case malay = "MALAY"
    case chinese = "CHINESE"
    case indian = "INDIAN"
    case others = "OTHERS"
    
    var optionText: String {
        switch self {
        case .malay: return "Malay"
        case .chinese: return "Chinese"
        case .indian: return "Indian"
        case .others: return "Others"
        }
    }
    
    init?(rawValue: String) {
        let nRawValue = EnumContactRace.normalize(rawValue)
        if ["MALAY", "MAL"].contains(nRawValue) { self = .malay }
        else if ["CHINESE", "CHINE", "CHI"].contains(nRawValue) { self = .chinese }
        else if ["INDIAN", "INDIA", "IND"].contains(nRawValue) { self = .indian }
        else if ["OTHER", "OTHERS", "OTH", "OTHS"].contains(nRawValue) { self = .others }
        else { return nil }
    }
}

enum EnumContactRelationship: String, CaseInsensitiveStringEnum {
    case friend = "Friend"
    case family = "Family"
    case colleague = "Colleague"
    case other = "Other"
    
    var optionText: String { return self.rawValue }
}
enum EnumSalesOpportunityMoreOptions: Int, CaseIterable {
    
    case transferSalesOpportunity = 0
    case notContactable = 1
    case wrongNumber = 2
    case customerIsAnAgent = 3
    case customerNotInterested = 4
    case deleteContact = 5
    
    static var optionList: [String] = { return allCases.map { $0.option } }()
    
    var option: String {
        switch self {
        case .transferSalesOpportunity: return "  TRANSFER SALES OPPORTUNITY"
        case .notContactable: return "  NOT CONTACTABLE"
        case .wrongNumber: return "  WRONG NUMBER"
        case .customerIsAnAgent: return "  CUSTOMER IS AN AGENT"
        case .customerNotInterested: return "  CUSTOMER NOT INTERESTED"
        case .deleteContact: return "  DELETE CONTACT"
        }
    }
    
    var analyticsTitle: String {
        switch self {
        case .transferSalesOpportunity: return "Transfer Sales Opportunity"
        case .notContactable: return "Not Contactable"
        case .wrongNumber: return "Wrong Number"
        case .customerIsAnAgent: return "Customer Is An Agent"
        case .customerNotInterested: return "Customer Not Interested"
        case .deleteContact: return "Delete Contact"
        }
    }
    
//    var description: String {
//        return self.option.trimmed
//    }
//
//    var bannerMessage: String {
//        return self.option.trimmed.capitalized
//    }
}

enum EnumSalesOpportunityNotInterestedOptions: Int, CaseIterable {
    
    case comparingPrice = 0
    case notEligible = 1
    case financialConstraint = 2
    case otherReasons = 3
    case restoreOffer = 4
    
    static var optionList: [String] = { return allCases.map { $0.option } }()
    
    var option: String {
        switch self {
        case .comparingPrice: return "CUSTOMER COMPARING PRICE"
        case .notEligible: return "NOT ELIGIBLE / INSURABLE"
        case .financialConstraint: return "FINANCIAL CONSTRAINT"
        case .otherReasons: return "OTHER REASONS"
        case .restoreOffer: return "RESTORE OFFER"
        } 
    }
}

enum EnumSalesOpportunityCallOutcomeOptions: Int, CaseIterable {
    
    case notContactable = 0
    case wrongNumber = 1
    case customerNotInterested = 2
    
    static var optionList: [String] = { return allCases.map { $0.option } }()
    
    var option: String {
        switch self {
        case .notContactable: return "NOT CONTACTABLE"
        case .wrongNumber: return "WRONG NUMBER"
        case .customerNotInterested: return "*NOT INTERESTED"
        }
    }
    
//    var description: String {
//        return self.option.trimmed
//    }
//
//    var bannerMessage: String {
//        return self.option.trimmed.replacingOccurrences(of: "*", with: "").capitalized
//    }
}

// All other enum var apiInput must refer this enum rawValue
enum EnumOfferStatus: String {
    case offers = "0"
    case interested = "1"
    case capturedOffer = "2"
    case notInterested = "3"
}

typealias EnumLeadMainStatus = EnumContactMainStatus

typealias EnumLeadSubStatus = EnumContactSubStatus

typealias EnumLeadStatus = EnumContactStatus

enum EnumContactStatus: String, CaseInsenstiveAlphaNumericsStringEnum {
    case appointmentRecheduled = "Appointment Recheduled"
    case assignToOtherAgent = "Assign to Other Agent"
    case callBack = "Call back"
    case caseCaptured = "Case Captured"
    case comparingPrices = "Comparing Prices"
    case converted = "Converted"
    case customerIsAnAgent = "Customer is an Agent"
    case financialConstraint = "Financial Constraint"
    case followupCall = "Followup Call"
    case interested = ""
    case newLead = "New Lead"
    case newLeadByUser = "New lead by user"
    case noStatusUpdate = "No Status Update"
    case notContactableAfterMultipleAttempts = "Not contactable after multiple attempts"
    case notEligibleNotInsurableByAIA = "Not Eligible/Not Insurable by AIA"
    case offerExpiredDeletedFolder = "Offer Expired (Deleted folder)"
    case offerExpiringSoon = "Offer Expiring soon"
    case otherReason = "Other Reason"
    case proposalFilledPaymentMade = "Proposal filled & payment made"
    case proposalFilledButNoPayment = "Proposal filled but no payment"
    case reassignedBackToSource = "Reassigned (Back to Source)"
    case setAppointmentInterested = "Set Appointment [Interested]"
    case SQSGenerated = "SQSGenerated"
    case stale = "Stale"
    case subsequentAppointment = "Subsequent Appointment"
    case transferred = "Transferred"
//    case manualTransfer = "Mannual Transfer"
//    case systemTransfer = "System Transfer"
    case wrongNumber = "Wrong Number"
    case none = "none"
    
    var description : String {
        switch self {
        case .appointmentRecheduled: return "Appointment Recheduled"
        case .assignToOtherAgent: return "Assign to Other Agent"
        case .callBack: return "Call back"
        case .caseCaptured: return "Captured"
        case .comparingPrices: return "Comparing Prices"
        case .converted: return "Converted"
        case .customerIsAnAgent: return "Customer is an Agent"
        case .financialConstraint: return "Financial Constraint"
        case .followupCall: return "Followup Call"
        case .interested: return ""
        case .newLead: return "New Lead"
        case .newLeadByUser: return "New lead by user"
        case .noStatusUpdate: return "Pending Update"
        case .notContactableAfterMultipleAttempts: return "Not contactable after multiple attempts"
        case .notEligibleNotInsurableByAIA: return "Not Eligible/Not Insurable by AIA"
        case .offerExpiredDeletedFolder: return "Offer Expired (Deleted folder)"
        case .offerExpiringSoon: return "Offer Expiring soon"
        case .otherReason: return "Other Reason"
        case .proposalFilledPaymentMade: return "Proposal filled & payment made"
        case .proposalFilledButNoPayment: return "Proposal filled but no payment"
        case .reassignedBackToSource: return "Reassigned (Back to Source)"
        case .setAppointmentInterested: return "Set Appointment [Interested]"
        case .SQSGenerated: return ""
        case .stale: return "Stale"
        case .subsequentAppointment: return "Subsequent Appointment"
        case .transferred: return "Transferred"
        //    case .manualTransfer: return "Mannual Transfer"
        //    case .systemTransfer: return "System Transfer"
        case .wrongNumber: return "Wrong Number"
        case .none: return ""
        }
    }
}

enum EnumContactMainStatus: String,CaseInsenstiveAlphaNumericsStringEnum, CustomStringConvertible {
    case converted = "Converted"
    case customerIsAnAgent = "Customer is an agent"
    case deferred = "Deferred"
    case expiringSoon = "Expiring Soon"
    case interested = "Interested"
    case newLead = "New lead"
    case noAgentActionRemove = "No Agent Action (remove)"
    case none = ""
    case noStatusUpdate = "No Status Update"
    case notContactable = "Not Contactable"
    case notInterested = "Not Interested"
    case offeredExpired = "Offered Expired"
    case proposalFilledButNoPayment = "Proposal Filled but no payment"
    case proposalFilledPaymentMade = "Proposal filled & payment made"
    case reassignedToSourceAuto = "Reassigned to source [Auto]"
    case SQSGenerated = "SQS Generated"
    case transferred = "Transferred"
    case workInProgress = "Work In Progress"
    case wrongNumber = "Wrong Number"
    
    var description: String {
        return self.rawValue
    }
    
    init?(rawValue: String) {
        if rawValue == "" {
            self = .none
        } else if let ret = EnumContactMainStatus.mapRawValue(rawValue) {
            self = ret
        } else {
            return nil
        }
    }
}

enum EnumContactSubStatus: String,CaseInsenstiveAlphaNumericsStringEnum {
    case appointmentRecheduled = "Appointment Recheduled"
    case appointmentSet = "Appointment Set"
    case callBackScheduled = "Call Back Scheduled"
    case comparingPrice = "Comparing Price"
    case convertedAuto = "Converted [Auto]"
    case convertedManual = "Converted [Manual]"
    case createdByAgent = "Created by Agent"
    case CRMOfferAvailable  = "CRM Offer Available "
    case customerIsAnAgent = "Customer is an Agent"
    case financialConstraint = "Financial Constraint"
    case interested = "Interested"
    case manualTransfer = "Manual Transfer"
    case newLeadAssigned = "New lead assigned"
    case noAgentAction = "No Agent Action"
    case none = ""
    case noStatusUpdate = "No Status Update"
    case notContactable = "Not Contactable"
    case notEligible = "Not Eligible"
    case proposalSubmission = "Proposal Submission"
    case reasonNotStated = "Reason Not Stated"
    case reassigned = "Reassigned"
    case retainOriginalSubStatus = "[Retain Original Sub Status]"
    case SQSGenerated = "SQS Generated"
    case stale  = "Stale "
    case subsequentAppointment  = "Subsequent Appointment "
    case systemIdentifiedOpportunity = "System Identifiy Opportunity"
    case systemTransfer = "System Transfer"
    case transferred = "Transferred"
    case wrongNumber = "Wrong Number"

    init?(rawValue: String) {
        if rawValue == "" {
            self = .none
        } else if let ret = EnumContactSubStatus.mapRawValue(rawValue) {
            self = ret
        } else {
            return nil
        }
    }
}

enum EnumCampaignType: String,CaseInsensitiveStringEnum {
    case N = "N"
    case SIO = "SIO"
    case CRM = "CRM"
    case LIG = "LIG"
}

enum EnumLeadManagementContactTemperature: String,CaseInsensitiveStringEnum {
    case hot = "HOT"
    case warm = "WARM"
    case cold = "COLD"
    case unknown = ""
    
    var backgroundColor:UIColor {
        switch self {
        case .hot: return AIAColors.primaryRed
        case .warm: return AIAColors.darkOrange
        case .cold: return AIAColors.primaryLightBlue
        case .unknown: return .clear
        }
    }
    
    var tagString:String {
        switch self {
        case .hot: return "HOT"
        case .warm: return "WARM"
        case .cold: return "COLD"
        case .unknown: return ""
        }
    }
}

enum EnumActionFinishedRoute {
    case transferSalesOpp
    case addContact
    case deleteContact
    case importContact
    case editContact
    case addAppointment
    case editAppointment
    case deleteAppointment
    case addReminder
    case editReminder
    case deleteReminder
    case updateContactStatus
    case setNotes
    case acceptAppointment
    case rejectAppointment
    case attendAppointment
    case attendAppointmentOther
    case absentAppointment
}


enum EnumRankingBoardType: String,CaseInsensitiveStringEnum  {
    case direct = "Agency"
    case branch = "Branch"
    case region = "Region"
    case national = "National"
    
    var rankingBoardTitle:String{
        switch self {
        case .direct: return "DIRECT"
        case .branch: return "BRANCH"
        case .region: return "REGION"
        case .national: return "NATIONAL"
        }
    }
    
    var navigationBarTitle:String{
        switch self {
        case .direct: return "DIRECT RANK"
        case .branch: return "BRANCH RANK"
        case .region: return "REGION RANK"
        case .national: return "NATIONAL RANK"
        }
    }
}

enum EnumRankingSorting {
    case anp
    case achieve
    
    var apiValue:String {
        switch self {
        case .anp: return "ANP"
        case .achieve: return "Achieve"
        }
    }
    
    var title:String{
        switch self {
        case .anp: return "ANP (YTD)"
        case .achieve: return "Achievement vs. Target"
        }
    }
}

enum EnumRankingInputType {
    case partial
    case agencyFull
    
    var apiValue:String {
        switch self {
        case .partial: return "Partial"
        case .agencyFull: return "AgencyFull"
        }
    }
}

enum EnumActivitySummaryCategory {
    case personal
    case team
    
    var apiValue:String{
        switch self {
        case .personal: return "Personal"
        case .team: return "DirectPersonal"
        }
    }
}

enum EnumDashboardPerformanceModuleType:String,CaseInsenstiveAlphaNumericsStringEnum {
    case myPerformance = "MP"
    case teamAnalysis = "AN"
}
// MARK: - Calendar -
enum EnumCalendarMode: String, CaseIterable {
    case year = "YEAR"
    case month = "MONTH"
    case day = "DAY"
    
    static var optionList: [String] = { return EnumCalendarMode.allCases.map { $0.rawValue } }()
}

// MARK: - Appointment -

enum EnumAppointmentStatus: Equatable {
    case newInvitation(invitor: String)
    case expired
    case normal
}

enum EnumAttendeeStatus: String, CaseIterable {
    case accept = "A"
    case pending = "P"
    case rejected = "R"
    case attended = "AT"
    case absent = "AB"
}

enum EnumAttendeeLevel: String, CaseIterable {
    case owner = "OWNER"
    case coacher = "COACHER"
    case other = "OTHER"
    case customer = "CUSTOMER"
}

enum EnumAppointmentType: String, CaseInsensitiveStringEnum {
    case customer = "CUS" // Able to add Customer, LifePlanner, Other
    case lifePlanner = "LP" // Able to add LifePlanner Only
    case other = "OTH" // Able to add Other only
}

enum EnumReminderType: String, CaseInsensitiveStringEnum {
    case customer = "CUS"
    case lifePlanner = "LP"

}

enum EnumAgentPickerType {
    case myLifePlanner // Performance My Life Planner
    case downlineAccess // Calendar Downline Access
    case appointmentInviteLifePlanner // Appointment & Reminder
}

//enum EnumAgentPickerRouteId {
//    case agency(model:AgentPickerModel)
//    case agent(model:AgentPickerModel)
//}

enum EnumContactLeadListType {
    case salesOpportunity
    case vitality
    case others
}
enum EnumVitalityMemberStatus {
    case no
    case active
    case terminated
    
    var apiInput: String {
        switch self {
        case .no: return "N"
        case .active: return "Active"
        case .terminated: return "Terminated"
        }
    }
}
enum EnumSalesStatus {
    case today
    case expiringSoon
    case inProgress
    case pendingStatusUpdates
    case interested
    
    var APIValue:String {
        switch self {
        case .today: return "Today"
        case .expiringSoon: return "Expiring Soon"
        case .inProgress: return "Work In Progress"
        case .pendingStatusUpdates: return "Pending Updates"
        case .interested: return "Interested"
        }
    }
    
    var title:String {
        switch self {
        case .today: return "TODAY"
        case .expiringSoon: return "EXPIRING SOON"
        case .inProgress: return "IN PROGRESS"
        case .pendingStatusUpdates: return "PENDING UPDATES"
        case .interested: return "INTERESTED"
        }
    }
}

enum EnumMirrorAccessType:String {
    case staff = "staff"
    case agent = "agent"
    case calendar = "calendar"
    case others = "others"
}


enum EnumPerformanceDashboardTooltipKey:String,CaseInsenstiveAlphaNumericsStringEnum {
    case personalPersistency = "MP-P"
    case personalTargetVAchieve = "TVA"
    case personalBalancedScoreCard = "MP-BSC"
    case personalConvention = "MP-CVCT"
    case personalCaseCount = "MP-CC"
    case personalMDRT = "MP-MDRT"
    case personalTotalProductionCredit = "TPC"
    case personalRanking = "R"
    case personalIncome = "I"
    case personalVitality = "V"
    case personalAppointments = "MP-APPT"
    case personalCalls = "MP-CALLS"
    case personalSalesOpportunities = "MP-SO"
    
    case teamPersistency = "AN-P"
    case teamBalancedScoreCard = "AN-BSC"
    case teamAgentPerformance = "AG"
    case teamLeadCount = "LCOUNT"
    case teamCaptureCaseCount = "CCC"
    case teamNotMeetingMOC = "TNMM"
    case teamNotMeetingMOCTPC = "NMM"
    case teamSummitStarConvention = "SSC"
    case teamAppointments = "AN-APPT"
    case teamMDRT = "AN-MDRT"
    case teamCalls = "AN-CALLS"
    case teamSubmittedCaseCount = "SCC"
    case teamAgentIncome = "AI"
    case teamLeadConversion = "LCONV"
    case teamConvention = "AN-CVCT"
    case teamCaseCount = "AN-CC"
    case teamSalesOpportunities = "AN-SO"
}

enum EnumPerformanceModuleType {
    case myPerformance
    case teamAnalysis
    case myLifePlanner
    
    static func getPerformanceModuleTypeByIndex(index: Int)->EnumPerformanceModuleType {
        if(index == 0) {
            return EnumPerformanceModuleType.myPerformance
        }
        else if(index == 1) {
            return EnumPerformanceModuleType.teamAnalysis
        }
        else {
            return EnumPerformanceModuleType.myLifePlanner
        }
    }
    
    func getPerformanceModuleTitle() -> String {
        switch self {
        case .myPerformance: return "My Performance"
        case .teamAnalysis: return "Team Analysis"
        case .myLifePlanner: return "Life Planners"
        }
    }
}


enum EnumConventionName:String,CaseInsenstiveAlphaNumericsStringEnum {
    case risingStar = "Rising Star"
    case elite = "Elite"
    case unknown = "unknown"
}

enum EnumVitalityFlag:String, CaseInsenstiveAlphaNumericsStringEnum {
    case active = "Y"
    case terminated = "T"
    case nonVitalityMember = "N"
}

typealias EnumAppointmentsPurpose = EnumCallRecordPurpose
typealias EnumAppointmentAttendeeStatus = EnumAttendeeStatus
// MARK: - Cross Module -
enum EnumUpdateStatusModule: String, CaseIterable {
    case performance = "PFM"
    case calendar = "CAL"
    case peerGroup = "PEERGRP"
}

enum EnumUrlContentType: String {
    case plainText = "text/plain"
    case imageGif = "image/gif"
    case imagePng = "image/png"
    case imageJpeg = "image/jpeg"
    
    func getFileExtension() -> String {
        switch self {
        case .plainText: return ".txt"
        case .imageGif: return ".gif"
        case .imagePng: return ".png"
        case .imageJpeg: return ".jpeg"
        }
    }
}

enum EnumPeerGroupDetailActions {
    case editGroupName
    case addParticipant
    case removeParticipant
    case deleteGroup
    case exitGroup
    
    func title() -> String {
        switch self {
        case .editGroupName: return "Edit Group Name"
        case .addParticipant: return "Add Participant"
        case .removeParticipant: return "Remove Participant"
        case .deleteGroup: return "Delete Group"
        case .exitGroup: return "Exit Group"
        }
    }
}

enum EnumParticipantStatus:String,CaseInsenstiveAlphaNumericsStringEnum {
    case pending = "P"
    case accepted = "A"
    case rejected = "R"
    case left = "L"
    
    var apiInput:String{
        switch self{
        case .pending: return "P"
        case .accepted: return "A"
        case .rejected: return "R"
        case .left: return "L"
        }
    }
    
//    init?(rawValue: String) {
//        let nRawValue = EnumParticipantStatus.normalize(rawValue)
//        if ["N", "R"].contains(nRawValue) {
//            self = .rejected
//        } else {
//            if let ret = EnumParticipantStatus.mapRawValue(nRawValue) {
//                self = ret
//            } else {
//                return nil
//            }
//        }
//    }
}

enum EnumAddParticipantMode{
    case createGroup
    case addParticipant
    
    func footerButtonText() -> String {
        switch self {
        case .createGroup: return "CREATE"
        case .addParticipant: return "CONFIRM"
        }
    }
}

enum EnumPeerGroupCellSwipeAction {
    case delete
    case exit
}

enum EnumAddParticipantSearchBarMode:String,CaseInsenstiveAlphaNumericsStringEnum {
    case agentName = "agentName"
    case agentId = "agentId"
    
    var placeholderText:String{
        return ""
//        switch self {
//        case .agentName: return R.string.main.search_agentname()
//        case .agentId: return R.string.main.search_agentid()
//        }
    }
    
    var optionText:String{
        switch self {
        case .agentName: return "Agent Name"
        case .agentId: return "Agent ID"
        }
    }
    
    var apiInput:String{
        switch self {
        case .agentName: return "AN"
        case .agentId: return "AI"
        }
    }
}
