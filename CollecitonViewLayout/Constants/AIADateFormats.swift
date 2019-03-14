//
//  AIADateFormat.swift
//  AIA
//
//  Created by lee yee chuan on 5/26/17.
//  Copyright © 2017 tiny. All rights reserved.
//

import Foundation

struct AIADateFormats {
    //ADB Analytics
    static let ddMMyyyyWithForwardSplash_EEE_HHmmss = "dd/MM/yyyy EEE HH:mm:ss"
    //dd/mm/yyyy dayOfWeek HH:MM:SS
    
    //Http Header
    static let httpHeaderDate = "ddMMyyyy"
    static let ddMMyyyy = "ddMMyyyy"
    //Http Header
    static let httpHeaderRespDateTime = "ddMMyyyyHHmmss"
    static let ddMMyyyyHHmmss = "ddMMyyyyHHmmss"
    
    //response body tokenExpiryDate for aia API call
    static let iso8601 = "yyyy-MM-dd'T'HH:mm:ss"
    static let iso8601WithMili = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    
    static let hhmmssa__d_MMM_yyyy = "hh:mm:ssa, dd MMM yyyy"
    static let HHmm__d_MMM_yyyy = "HH:mm, d MMM yyyy"
    
    static let yyyyMMdd = "yyyyMMdd"
    static let yyyyMM = "yyyyMM"
    static let yyyyMMddWithDash = "yyyy-MM-dd"
    static let yyyy_MM_dd = "yyyy MM dd"
    static let ddMMMyyyyWithDash = "dd-MMM-yyyy"
    static let ddMMMMyyyyWithDash = "dd-MMMM-yyyy"
    static let dd_MMMM_yyyy = "dd MMMM yyyy"
    static let dd_MMM_yyyy = "dd MMM yyyy"
    static let d_MMM_yyyy = "d MMM yyyy"
    static let ddMMyyyyWithForwardSlash = "dd/MM/yyyy"
    static let ddMMyyWithForwardSlash = "dd/MM/yy"
    static let HHmm__dd_MMM_yyyy = "HH:mm, dd MMM yyyy"
    static let HHmmssSSS = "HH:mm:ss.SSS"
    static let hhmmssSSS = "hh:mm:ss.SSS"
    static let hmm_a = "h:mm a"
    static let hhmm_a = "hh:mm a"
    static let HHmmss = "HH:mm:ss"
    static let HHmm = "HH:mm"
    static let dd_MMM = "dd MMM"
    static let dd = "dd"
    static let MM = "MMM"
    static let yyyyMMddHHmma = "yyyy-MM-dd h:mm a"
    
    // ContactLead
    static let eeee_dd_MMMM = "EEEE, dd MMMM"
    static let eeee_dd_MMMM_h_mm_a = "EEEE, dd MMMM h:mm a"
    static let eee_dd_MMMM___h_mm_a = "EEE, dd MMMM    h:mm a"
    static let eee_dd_MMMM = "EEE, dd MMMM"
    
    // Calendar
    static let EEEE_dd_MMM = "EEEE, dd MMM"
    static let MMMM = "MMMM"
}


// MARK: DATE FORMATS
public struct EnumUIDateFormats {
    static var displayCellLongDate:String { return AIADateFormats.HHmm__dd_MMM_yyyy }
    static var displayCellShortDate:String { return AIADateFormats.dd_MMM_yyyy }
    static var displayDateTime:String { return AIADateFormats.yyyyMMddHHmma }
//    static var displayCellTime:String { return AIADateFormats.hmm_a }
//    static var displayLongDate:String { return AIADateFormats.dd_MMMM_yyyy }
//    static var displayShortDate:String { return AIADateFormats.d_MMM_yyyy }
//    static var displayTime:String { return AIADateFormats.hmm_a }
//    static var displayCheckInDate:String { return AIADateFormats.dd_MMMM_yyyy }
//    static var displayCheckInTime:String { return AIADateFormats.hmm_a }
    
    static var asOfDate:String { return AIADateFormats.dd_MMM }
}

enum EnumMonth: Int, CaseIterable {
    case jan = 1
    case feb = 2
    case mar = 3
    case apr = 4
    case may = 5
    case jun = 6
    case jul = 7
    case aug = 8
    case sep = 9
    case oct = 10
    case nov = 11
    case dec = 12
    
    var shortMonthName: String {
        switch self {
        case .jan: return "Jan"
        case .feb: return "Feb"
        case .mar: return "Mar"
        case .apr: return "Apr"
        case .may: return "May"
        case .jun: return "Jun"
        case .jul: return "Jul"
        case .aug: return "Aug"
        case .sep: return "Sep"
        case .oct: return "Oct"
        case .nov: return "Nov"
        case .dec: return "Dec"
        }
    }
    
    var fullMonthName: String {
        switch self {
        case .jan: return "January"
        case .feb: return "February"
        case .mar: return "March"
        case .apr: return "April"
        case .may: return "May"
        case .jun: return "June"
        case .jul: return "July"
        case .aug: return "August"
        case .sep: return "September"
        case .oct: return "October"
        case .nov: return "November"
        case .dec: return "December"
        }
    }
}
