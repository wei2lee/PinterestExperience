//
//  AIATimeIntervalFormats.swift
//  AIAAgent
//
//  Created by Yee Chuan Lee on 25/11/2018.
//  Copyright © 2018 lee yee chuan. All rights reserved.
//

import Foundation
import SwiftDate

struct AIATimeIntervalFormats {
//    fileprivate static let buildConfig = DIContainer.resolve(AIABuildConfigType.self)!
    static let hh_mm:TimeInterval.ComponentsFormatterOptions = {
        var ret = TimeInterval.ComponentsFormatterOptions()
        ret.unitsStyle = .abbreviated
        ret.allowedUnits = [.hour, .minute]
//        ret.locale = buildConfig.numberFormatLocale
        return ret
    }()
    
    static let mm:TimeInterval.ComponentsFormatterOptions = {
        var ret = TimeInterval.ComponentsFormatterOptions()
        ret.unitsStyle = .abbreviated
        ret.allowedUnits = [.minute]
//        ret.locale = buildConfig.numberFormatLocale
        return ret
    }()
}
