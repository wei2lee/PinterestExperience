//
//  AIANumbers.swift
//  AIA
//
//  Created by lee yee chuan on 5/19/17.
//  Copyright © 2017 tiny. All rights reserved.
//

import Foundation
import UIKit
struct AIANumbers {
    static var slidingVerticalMaskAnimatonDuration:Double { return 0.5 }
    static let animationFadeDurationShort:TimeInterval = 0.25
    
    static let notificationInAppDismissDuration:TimeInterval = 99999
    
    static let sideMenuLeftMenuRatio:CGFloat = 190.0/220.0
    
    static func iconButtonAlphaForEnable(_ value:Bool) -> CGFloat { return value ? 1.0 : 0.3 }
    
    static func buttonAlphaForEnable(_ value:Bool) -> CGFloat { return value ? 1.0 : 0.5 }
    
    static func listItemAlphaForEnable(_ value:Bool) -> CGFloat { return value ? 1.0 : 0.5 }
    
    static func tagsViewAlphaForEnable(_ value:Bool) -> CGFloat { return value ? 1.0 : 0.3 }
    
    static func pagerTabTitleAlphaForEnable(_ value:Bool) -> CGFloat { return value ? 1.0 : 0.3 }
    
    static func sideMenuItemAlphaForEnable(_ value:Bool) -> CGFloat { return value ? 1.0 : 0.2 }
    
    static let circleGraphViewPendingClientBorderWidth:CGFloat = 5.0
    static let circleGraphViewActiveClientBorderWidth:CGFloat = 4.0
    static let circleGraphViewNewClientBorderWidth:CGFloat = 6.0
    static let circleGraphViewDormantClientBorderWidth:CGFloat = 3.0
    static let circleGraphViewBorderWidth:CGFloat = 14.0
    
    static let cardComponentGapBetween:CGFloat = 10
    static let cardComponentEdgeSpaceValue:CGFloat = 30
    static let cardWidthHeightAspectRatio:CGFloat = (345/134)
    
    static let cardListTableViewTopContentInset:CGFloat = 16
    
    static let estimateRowHeightForContactCardTableViewCell:CGFloat = 224
    static let topPaddingForContactCardTableViewCell:CGFloat = 16
    
    static let reloadPageIndex = "1"
    
    static let minHeightOfDetailPaging:CGFloat = 144
    static let maxHeightOfDetailPaging:CGFloat = 600
    
    static let groupingHeaderViewHeight:CGFloat = 57
    static let groupingBlankHeaderViewHeight:CGFloat = 30
    
    static let listingHeaderViewHeight:CGFloat = 40
    
    static let maxRecentSearchHistory:Int = 5
    
    static let inputValidationErrorUnderlineThickness: CGFloat = 2.0
    static let numberOfEventsMultipler: Int = 3
    static let contactUpfrontFilterOptionTextMaxCharacter:Int = 25
    
    // Calendar
    static let timelineViewBottomInset: CGFloat = 66 // TimelineView height + padding = 50 + 16
}
