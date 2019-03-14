//
//  AIAMetrics.swift
//  AIA
//
//  Created by lee yee chuan on 5/6/17.
//  Copyright © 2017 tiny. All rights reserved.
//

import Foundation
import UIKit

struct AIAMetrics {
//    static let arialBoldFontName:String = "Arial-BoldMT"
//    static let arialRegularFontName:String = "Arial"
//
//    static let pageTitleFontSize:CGFloat = 25
//    static var pageTitleFont:UIFont { return R.font.aiaEverestCondensedMedium(size: pageTitleFontSize)! }//Upper case
//    static let heading1FontSize:CGFloat = 40
//    static var heading1Font:UIFont { return R.font.aiaEverestCondensedMedium(size: heading1FontSize)! } //Upper case
//    static let heading2FontSize:CGFloat = 18
//    static var heading2Font:UIFont { return UIFont(name: arialBoldFontName, size: heading2FontSize)! } //Upper case
//    static let bodyTextFontSize:CGFloat = 13
//    static var bodyTextFont:UIFont { return UIFont(name: arialRegularFontName, size: bodyTextFontSize)! }
//    static let primaryButtonTextFontSize:CGFloat = 24
//    static var primaryButtonTextFont:UIFont { return R.font.aiaEverestCondensedMedium(size: primaryButtonTextFontSize)! } // Upper case
//    static let defaultButtonTextFontSize:CGFloat = 17
//    static var defaultButtonTextFont:UIFont { return R.font.aiaEverestCondensedMedium(size: defaultButtonTextFontSize)! }
//
//    static let menuTitleFontSize:CGFloat = 25
//    static var menuTitleFont:UIFont { return R.font.aiaEverestCondensedMedium(size: menuTitleFontSize)! } // Upper case
//    static let menuItemFontSize:CGFloat = 18
//    static var menuItemFont:UIFont { return UIFont(name: arialRegularFontName, size: menuItemFontSize)! }
//
//    static let tabLabelFontSize:CGFloat = 20
//    static var tabLabelFont:UIFont { return R.font.aiaEverestCondensedMedium(size: tabLabelFontSize)! } // Upper case
//    static let dropDownFontSize:CGFloat = 15
//    static var dropDownFont:UIFont { return UIFont(name: arialRegularFontName, size: dropDownFontSize)! }
//
//    static let accordingOnLabelFontSize:CGFloat = 20
//    static var accordingOnLabelFont:UIFont { return UIFont(name: arialRegularFontName, size: accordingOnLabelFontSize)! }
//
//
//    //MARK: navigation bar
//    static let navBarFontSize:CGFloat = pageTitleFontSize
//    static let navBarTitleFont:UIFont = pageTitleFont
//    static var navBarTemperatureFont: UIFont { return R.font.aiaEverestExtraBold(size: 14.0)! }
//
//    //MARK: dialog
//    static let dialogViewCornerRadius:CGFloat = 6
//
//    static let dialogMargin:CGFloat = 24
//    static let dialogTitleTop:CGFloat = 50
//    static let dialogTitleFontSize:CGFloat = heading1FontSize
//    static let dialogTitleFont:UIFont = heading1Font
//
//    static let dialogTextFontSize:CGFloat = bodyTextFontSize
//    static let dialogTextFont:UIFont = bodyTextFont
//
//    static let dialogButtonRowHeight:CGFloat = 40
//    static let dialogButtonHeight:CGFloat = 40
//    static let dialogButtonFontSize:CGFloat = primaryButtonTextFontSize
//    static let dialogButtonFont:UIFont = primaryButtonTextFont
//    static let dialogButtonCornerRadius:CGFloat = 15
//    //MARK: text field
//    static let textFieldDefaultHeight:CGFloat = 46
//    static let textFieldDefaultLeftPadding:CGFloat = 16
//    static let textFieldDefaultRightPadding:CGFloat = 16
//    static let textFieldBoxedBorderWidth:CGFloat = 2
//    static let textFieldBoxedHeight:CGFloat = 46
//    static let textFieldBoxedLeftPadding:CGFloat = 16
//    static let textFieldBoxedRightPadding:CGFloat = 16
//    //MARK: button
//    static let buttonEdgePadding:CGFloat = 16
//    static let blockButtonHeight:CGFloat = 51
//    static let buttonHeight:CGFloat = 46
//    static let buttonFontSize:CGFloat = primaryButtonTextFontSize
//    static let buttonFont:UIFont = primaryButtonTextFont
//    static let clearButtonFontSize:CGFloat = 17
//    static let clearButtonFont:UIFont = defaultButtonTextFont
//    static let buttonCornerRadius:CGFloat = 15
//    //MARK: pagemenu
//    static let pageMenuTitleFontSize:CGFloat = 16
//    static var pageMenuTitleFont:UIFont { return UIFont(name: arialBoldFontName, size: pageMenuTitleFontSize)! }
//
//    //MARK: notification banner
//    static let notificationBannerHeight:CGFloat = 150
//
//    static let cardTitleLabelSmallFontSize:CGFloat = 10 //Small screens
//    static let cardTitleLabelFontSize:CGFloat = 12 //Normal screens
//
//    //MARK: notification badge number
//    static let badgeNumberFontSize:CGFloat = 12
//    static var badgeNumberFont:UIFont { return R.font.aiaEverestRegular(size: badgeNumberFontSize)! }
//    //MARK: Option UISwitch
//    static let defaultSwitchTitleFontSize: CGFloat = 16
//    static var defaultSwitchTitleFont: UIFont { return R.font.aiaEverestRegular(size: defaultSwitchTitleFontSize)! }
//    static let settingGroupHeaderSwitchFontSize: CGFloat = 17
//    static var settingGroupHeaderSwitchFont: UIFont { return R.font.aiaEverestCondensedMedium(size: defaultSwitchTitleFontSize)! }
//
//    //MARK: Bar Chart
//    static let barChartTitleFontSize: CGFloat = 13
//    static let barChartMarkerFontSize: CGFloat = 15
//    static var barChartTitleFont: UIFont { return R.font.aiaEverestRegular(size: barChartTitleFontSize)! }
//    static var barChartMarkerRegularFont: UIFont { return R.font.aiaEverestRegular(size: barChartMarkerFontSize)! }
//    static var barChartMarkerBoldFont: UIFont { return R.font.aiaEverestBold(size: barChartMarkerFontSize)! }
//
//    static var barChartMainTitleFont: UIFont { return R.font.aiaEverestRegular(size: 18.0)! }
//    static var barChartMainTitleBoldFont: UIFont { return R.font.aiaEverestBold(size: 18.0)! }
//    static var barChartSubTitleFont: UIFont { return R.font.aiaEverestRegular(size: 15.0)! }
//    static var barChartFooterTitleFont: UIFont { return R.font.aiaEverestRegular(size: 14.0)! }
//
//    //MARK: Drop Down
//    static let dropDownTextCellHeight:CGFloat = 46
//
//    //MARK: separator
//    struct SeparatorStyle {
//        let top:CGFloat
//        let bottom:CGFloat
//        let widthPercentage:CGFloat
//        let height:CGFloat
//        let color:UIColor
//    }
//    static let defaultSeparator = SeparatorStyle(top: 15.0, bottom: 15.0, widthPercentage: 0.89, height: 2.0, color: .lightGray)
//    static let settingHeaderSeparator = SeparatorStyle(top: 15.0, bottom: 15.0, widthPercentage: 1.0, height: 1.0, color: .lightGray)
//    static let settingModulesSeparator = SeparatorStyle(top: 15.0, bottom: 15.0, widthPercentage: 1.0, height: 0.5, color: .lightGray)
//
//    // MARK: Components Input
//    static let inputTextFieldFontSize: CGFloat = 16
//    static var inputTextFieldFont:UIFont { return R.font.aiaEverestRegular(size: inputTextFieldFontSize)! }
//    static let inputTextFieldErrorFontSize: CGFloat = 14
//    static var inputTextFieldErrorFont:UIFont { return R.font.aiaEverestRegular(size: inputTextFieldErrorFontSize)! }
//
//    // MARK: AIATagView
//    static let contactLeadThinPaddingEdgeInsets = UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
//    static let contactLeadWidthTemperaturePaddingEdgeInsets = UIEdgeInsets(top: 3, left: 8, bottom: 3, right: 8)
//    static let contactLeadListingTemperatureFontSize: CGFloat = 10.0
//    static var contactLeadListingTemperatureFont:UIFont { return R.font.aiaEverestMedium(size: contactLeadListingTemperatureFontSize)! }
//    static var contactLeadListingTemperaturePadding:UIEdgeInsets { return  contactLeadWidthTemperaturePaddingEdgeInsets }
//    static let contactLeadPurposeFontSize: CGFloat = 12.0
//    static var contactLeadPurposeFont:UIFont { return R.font.aiaEverestMedium(size: contactLeadPurposeFontSize)! }
//    static var contactLeadPurposePadding:UIEdgeInsets { return  contactLeadThinPaddingEdgeInsets }
}
