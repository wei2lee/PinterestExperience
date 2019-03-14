//
//  String+Extension.swift
//  PinterestStyle
//
//  Created by HI-Wong Che Hsing on 25/02/2019.
//  Copyright © 2019 HI-Wong Che Hsing. All rights reserved.
//

import UIKit

extension String {
    static var emptyReplacement: String { return "" }
    
    var orEmptyReplacement: String {
        if self.isNilOrEmptyString {
            return ""
        } else {
            return self
        }
    }
    
    var isNilOrEmptyString:Bool {
        if self.count == 0 {
            return true
        } else {
            return false
        }
    }
    var isNilOrEmptyReplacementOrEmptyString:Bool {
        if self.count == 0 {
            return true
        } else {
            return "" == self
        }
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        
        return ceil(boundingBox.width)
    }
}

extension Optional {
    var isNilOrEmptyString : Bool {
        switch self {
        case .some(let value):
            return String(describing: value).isNilOrEmptyString
        case _:
            return true
        }
    }
    var isNilOrEmptyReplacementOrEmptyString : Bool {
        switch self {
        case .some(let value):
            return String(describing: value).isNilOrEmptyReplacementOrEmptyString
        case _:
            return true
        }
    }
}


extension Optional where Wrapped == String {
    var isNilOrEmptyString : Bool {
        switch self {
        case .some(let value):
            return value.isNilOrEmptyString
        case _:
            return true
        }
    }
    var isNilOrEmptyReplacementOrEmptyString : Bool {
        switch self {
        case .some(let value):
            return value.isNilOrEmptyReplacementOrEmptyString
        case _:
            return true
        }
    }
}

extension Optional where Wrapped == String {
    var orEmptyReplacement : String {
        switch self {
        case .some(let value):
            return value.orEmptyReplacement
        case _:
            return String.emptyReplacement
        }
    }
    var orEmpty : String {
        switch self {
        case .some(let value):
            return value
        case _:
            return ""
        }
    }
}



extension String {
    //static var emptyReplacement: String { return "" }
    func height(font: UIFont, width: CGFloat) -> CGFloat {
        let rect = NSString(string: self).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(rect.height)
    }
}
