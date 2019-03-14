//
//  UIControl+Extension.swift
//  PinterestStyle
//
//  Created by HI-Wong Che Hsing on 24/02/2019.
//  Copyright © 2019 HI-Wong Che Hsing. All rights reserved.
//

import UIKit
extension UIControl {
    fileprivate struct AssociatedKey {
        static var setSelectedOnTouchUpInside = "setSelectedOnTouchUpInside"
        static var toggleSelectedOnTouchUpInside = "toggleSelectedOnTouchUpInside"
    }
    @IBInspectable var setSelectedOnTouchUpInside: Bool {
        get {
            let ret:Bool? = getAssociatedObject(self, associativeKey: &AssociatedKey.setSelectedOnTouchUpInside)
            return ret ?? false
        }
        
        set {
            setAssociatedObject(self, value: newValue, associativeKey: &AssociatedKey.setSelectedOnTouchUpInside, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            if newValue {
                self.addTarget(self, action: #selector(self.didTouchUpInside(sender:)), for: .touchUpInside)
            } else {
                self.removeTarget(self, action: #selector(self.didTouchUpInside(sender:)), for: .touchUpInside)
            }
        }
    }
    
    @objc func didTouchUpInside(sender:AnyObject) {
        if setSelectedOnTouchUpInside {
            isSelected = true
        }
    }
    
    @IBInspectable var toggleSelectedOnTouchUpInside: Bool {
        get {
            let ret:Bool? = getAssociatedObject(self, associativeKey: &AssociatedKey.toggleSelectedOnTouchUpInside)
            return ret ?? false
        }
        
        set {
            setAssociatedObject(self, value: newValue, associativeKey: &AssociatedKey.toggleSelectedOnTouchUpInside, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            if newValue {
                self.addTarget(self, action: #selector(self.didTouchUpInside2(sender:)), for: .touchUpInside)
            } else {
                self.removeTarget(self, action: #selector(self.didTouchUpInside2(sender:)), for: .touchUpInside)
            }
        }
    }
    
    @objc func didTouchUpInside2(sender:AnyObject) {
        if toggleSelectedOnTouchUpInside {
            isSelected = !isSelected
        }
    }
}

