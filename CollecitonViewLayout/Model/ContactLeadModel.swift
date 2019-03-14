//
//  ContactLeadModel.swift
//  PinterestStyle
//
//  Created by HI-Wong Che Hsing on 25/02/2019.
//  Copyright © 2019 HI-Wong Che Hsing. All rights reserved.
//

import Foundation

class ContactLeadModel {
    var ownerNameText: String
    // temperature
    var raceText: String
    var genderText: String
    var ownerText: String
    var isMainStatusHidden: Bool = false
    var enableMainStatusTap: Bool = false
    // main status tag view
    
    // Content Row
    var isSubContentsHidden: Bool = false
    var isBottomLineHidden: Bool = false
    // create sub content
    
    var idNoText: String
    var showIdNo: String
    var dobText: String
    var showDOB: String
    var isVitalityStatusRowHidden: Bool = false
    var isVitalityAmountRowHidden: Bool = false
    var vitalityLevelText: String
    var vitalityAmountAttrStr: String
    
    var isIconViewHidden: Bool = false
    // icon view
    
    var isHighlightViewHidden: Bool = false
    // highlighted view
    
    var isReminderNoteHidden: Bool = false
    var reminderNoteText: String
    
//    var ownerNameHeight: CGFloat = 0.0
//    var raceHeight: CGFloat = 0f
//    var genderHeight: CGFloat = 0
//    var ownerNameHeight: CGFloat = 0
//    var ownerNameHeight: CGFloat = 0
//    var ownerNameHeight: CGFloat = 0
//    var ownerNameHeight: CGFloat = 0
    
    init(ownerNameText: String, raceText: String, genderText: String, ownerText: String, idNoText: String, showIdNo: String, dobText: String, showDOB: String, vitalityLevelText: String, vitalityAmountAttrStr: String, reminderNoteText: String) {
        self.ownerNameText = ownerNameText
        self.raceText = raceText
        self.genderText = genderText
        self.ownerText = ownerText
        self.idNoText = idNoText
        self.showIdNo = showIdNo
        self.dobText = dobText
        self.showDOB = showDOB
        self.vitalityLevelText = vitalityLevelText
        self.vitalityAmountAttrStr = vitalityAmountAttrStr
        self.reminderNoteText = reminderNoteText
    }
}
