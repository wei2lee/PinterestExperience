//
//  UIColor+Extension.swift
//  CollecitonViewLayout
//
//  Created by Yee Chuan Lee on 14/03/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init?(hexString: String) {
        if let n = Int(hexString, radix: 16) {
            let r = (n & 0xff0000) >> 16
            let g = (n & 0x00ff00) >> 8
            let b = (n & 0x0000ff) >> 0
            self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: 1.0)
        }
        return nil
    }
}
