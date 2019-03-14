//
//  AIAColors.swift
//  AIA
//
//  Created by lee yee chuan on 5/9/17.
//  Copyright © 2017 tiny. All rights reserved.
//

import Foundation
//import ChameleonFramework
import UIKit

struct AIAColors {
    //MARK: Styling Color
    static var primaryRed:UIColor { return UIColor(hexString: "D31145")! }
    static var tertiaryRed:UIColor { return UIColor(hexString: "B8123E")! }
    static var primaryBrown:UIColor { return UIColor(hexString: "554344")! }
    static var secondaryBlue:UIColor { return UIColor(hexString: "596C80")! }
    static var tertiaryBlue:UIColor { return UIColor(hexString: "2E6E91")! }
    static var primaryBlack:UIColor { return UIColor(hexString: "363E3F")! }
    static var tertiaryGreen:UIColor { return UIColor(hexString: "65962E")! }
    static var lightGray:UIColor { return UIColor(hexString:"BDBDBD")! }
    static var darkGray:UIColor { return UIColor.darkGray }
    static var viewAsAgentHeader:UIColor { return UIColor(hexString:"9a62d3")! }
    static var primaryYellowBackground:UIColor { return UIColor(hexString:"F2EEE2")! }
    static var secondaryYellowBackground: UIColor { return UIColor(hexString: "FEFEC7")! }
    static var primaryYellow: UIColor { return UIColor(hexString: "FFF5E3")! }
    static var clearBlue: UIColor { return UIColor(hexString: "22A8DA")! }
    
    //MARK: Styling Component
    static let pageTitle = primaryWhite
    static let search = primaryWhite
    static let subTitle = primaryWhite
    static let heading1 = primaryBrown
    static let bodyText = primaryBrown
    static let textLink = primaryLightBlue
    static let buttonText = primaryWhite
    //MARK: Styling Other
    static var clearColor: UIColor { return UIColor.clear }
    static var primaryBlue:UIColor { return UIColor(hexString: "596C80")! }
    static var darkBeige:UIColor { return UIColor(hexString: "F0EEE1")! }
    
    static var thirdRed:UIColor { return UIColor(hexString: "c30e2d")! }
    static var secondaryRed:UIColor { return UIColor(hexString: "b5123d")! }
    static var primaryLightBlue:UIColor { return UIColor(hexString: "22a8da")! }

    static let primaryGray = darkBeige
    static var secondaryBlack:UIColor { return UIColor(hexString: "000000")! }
    static var primaryWhite:UIColor { return UIColor(hexString: "ffffff")! }
    static var thirdBlueBackGround:UIColor { return UIColor(hexString: "d2ebef")! }
    static var primaryLightGray:UIColor { return UIColor(hexString: "b1afa6")! }
    static var primaryRedOverlay:UIColor { return UIColor(hexString: "28090e")! }
    
    static var primaryPurple:UIColor { return UIColor(hexString: "6c37a8")! }
    static var primaryPink:UIColor { return UIColor(hexString: "e56687")! }
    
    static var lightOrange: UIColor { return UIColor(hexString: "F9E1B8")! }
    static var darkOrange: UIColor { return UIColor(hexString: "FF5500")! }
    

    //MARK: label
    static let labelTextColor = darkGray
    static var valuePrimaryTextColor: UIColor { return UIColor(hexString: "43423E")! }
    static var valueSecondaryTextColor: UIColor { return UIColor(hexString: "555555")! }
    //MARK: navigation bar
    static let navBarTitle = primaryWhite
    static let navBarBackground = primaryRed
    static let navBarBackgroundOverlay = primaryRedOverlay
    //MARK: text field
    static let textFieldCursor = primaryBrown
    static let textFieldTextColor = primaryBrown
    static let textFieldBorderGray = lightGray //UIColor(hexString: "#DEDDDA")
    static var textFieldPlaceholderColor:UIColor { return UIColor(hexString: "d6c7c8")! }
    static var textFieldPlaceholderColorPink:UIColor { return UIColor(hexString: "E86487")! }
    //MARK: button
    static let buttonPositiveTextColor = buttonText
    static let buttonPositiveBackgroundColor = primaryRed
    static let buttonNegativeTextColor = buttonText
    static let buttonNegativeBackgroundColor = primaryBlue
    static let buttonDefaultTextColor = buttonText
    static let buttonDefaultBackgroundColor = UIColor.lightGray
    static let buttonDarkTextColor = buttonText
    static let buttonDarkBackgroundColor = UIColor.gray
    static let buttonClearBackgroundPositiveTextColor = primaryRed
    static let buttonClearBackgroundNegativeTextColor = primaryBlue
    //MARK: dialog
    static let dialogViewBackgroundColor = primaryWhite
    static let dialogTitleColor = secondaryBlack
    static let dialogTextColor = primaryBlue
    static let dialogPositiveButtonTextColor = primaryWhite
    static let dialogPositiveButtonBackgroundColor = secondaryRed
    static let dialogNegativeButtonTextColor = primaryWhite
    static let dialogNegativeButtonBackgroundColor = primaryBlue
    //MARK: badge
    static var bagdeNumberBlueBackground:UIColor { return UIColor(hexString:"26a5dc")! }
    //MARK: Dashboard
    static let sideMenuBackgroundColor = UIColor(hexString: "302F2C")!
    static let dashboardCardLineColor = UIColor(hexString: "302F2C")!
    static let dashboardPieChartZeroColor = UIColor(hexString: "DBDAD4")!
    
    static let policyStatusLapsedColor = UIColor(hexString: "B8123E")! // read
    static let policyStatusInForceColor = UIColor(hexString: "65962E")! // green
    static let policyStatusPendingColor = UIColor(hexString: "FF5500")! // orange
    
    
    // Recent Activities
    static let recentActivitiesBackground = UIColor(hexString: "D3EDF1")!
    
    static let policyTopLineColor = UIColor(hexString: "46D3BD")!
    static let policyMiddleLineColor = UIColor(hexString: "A6E8DE")!
    static let newBusinessTopLineColor = UIColor(hexString: "FBBF56")!
    static let newBusinessMiddleLineColor = lightOrange
    
    // Contact
    static let contactCardInactiveColor = UIColor(hexString: "DBDAD4")!
    static let contactCardActiveColor = primaryRed
    
    static let policyDetailTopLineColor = UIColor(hexString:"1bc7ac")!
    static let policyDetailMiddleLineColor = UIColor(hexString:"9ed6eb")!
    
    // UISwitch
    static let settingOptionSwitchColor = UIColor(hexString:"#4cd964")!
    static let settingOptionSwitchOffColor = UIColor(hexString:"6a6a6a")!

    static let tooltipBackgroundColor = UIColor(hexString:"#fff5e3")!
    
    static let dropDownBorderColor = UIColor(hexString: "#EBEBF1")!
    static let shadowColor = UIColor(hexString: "#EBEBF1")!

    //Performance Dashboard
    static let conventionProgressColor = UIColor(hexString: "#4e50ad")!
    static let performancePreviousANPColor = UIColor(hexString: "#9CD7EB")!
    static let performanceCurrentANPColor = UIColor(hexString: "#C70034")!
    static var homePersistencyGreen:UIColor { return UIColor(hexString: "94C971")! }
    static var mdrtAchievedGreen:UIColor { return UIColor(hexString: "558920")! }
    static var mdrtAchievedOrange:UIColor { return UIColor(hexString: "FB3C06")! }
    static var mdrtAchievedRed:UIColor { return UIColor(hexString: "C80034")! }
    
    //Performance Income
    struct PerformanceIncomeCategoryColor {
        static let PerBasic = UIColor(hexString: "#23A8DB")!
        static let PerBSC = UIColor(hexString: "#F9E2B8")!
        static let PerBonus = UIColor(hexString: "#E76486")!
        static let DirectOR = UIColor(hexString: "#5B6E7F")!
        static let DirectBSC = UIColor(hexString: "#FCBF56")!
        static let DirectBonus = UIColor(hexString: "#97CC5C")!
        static let DistrictOR = UIColor(hexString: "#158C7B")!
        static let DistrictBSC = UIColor(hexString: "#A9DCEF")!
        static let DistrictBonus = UIColor(hexString: "#561892")!
        static let Other = UIColor(hexString: "#9862D2")!
        static let unknown = UIColor.white
    }
    
    //ProgessHUD
    static let mbProgressHUDBackgroundColor = UIColor.white
    
    // Sales Opportunity Offers
    static let topBarBlue = UIColor(hexString: "#3584CE")
    static let topBarGreen = UIColor(hexString: "#A2C869")
    static let topBarGray = UIColor(hexString: "#B4B4B4")
    static let iconsGray = UIColor(hexString: "#5C6C7F")
    static let captureOfferViewBackground = lightOrange
    
    // Ranking
    static let badgeLightGray = UIColor(hexString: "#dcdbdf")!
    static let textFieldDisabled = UIColor(hexString: "F3F3F3")
    
    // Performance Charts
    static var performanceRed = primaryRed
    static var performanceDarkBlue = secondaryBlue
    static var performanceBeige = lightOrange
    static var performanceTurquoise: UIColor { return UIColor(hexString: "44D4BE")! }
    static var performanceDarkGreen: UIColor { return UIColor(hexString: "36c18e")! }
    static var performanceOrange = newBusinessTopLineColor
    static var performanceDarkPurple: UIColor { return UIColor(hexString: "551893")! }
    static var performanceLightBlue = primaryLightBlue
    
    // Calendar Event
    static var otherTypeEmptyPurposeColor: UIColor { return UIColor(hexString: "C56519")! }
    
}
