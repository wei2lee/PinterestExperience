//
//  UIButton+Extension.swift
//  PinterestStyle
//
//  Created by HI-Wong Che Hsing on 24/02/2019.
//  Copyright © 2019 HI-Wong Che Hsing. All rights reserved.
//

import UIKit

// MARK: Get parent (UITableViewCell) of UIView
extension UIView {
    var parentTableViewCell:UITableViewCell? {
        var ret:UIView? = self
        repeat {
            if let cell = ret as? UITableViewCell {
                return cell
            }
            ret = ret?.superview
        } while(ret != nil);
        return nil
    }
}

extension UIView {
    @IBInspectable var cornerRadius:CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor:UIColor? {
        get {
            return layer.borderColor.map { UIColor(cgColor: $0) }
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    func makeCircular() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.clipsToBounds = true
    }
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

extension UIView {
    fileprivate struct AssociatedKey {
        static var link = "link"
        static var data = "data"
        static var pdRetryView = "pdRetryView"
    }
    @IBInspectable var name:String? {
        get {
            return layer.name
        }
        set {
            layer.name = newValue
        }
    }
    
    @IBInspectable var link: String? {
        get {
            let ret:String? = getAssociatedObject(self, associativeKey: &AssociatedKey.link)
            return ret
        }
        
        set {
            setAssociatedObject(self, value: newValue, associativeKey: &AssociatedKey.link, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var data: Any? {
        get {
            let ret:Any? = getAssociatedObject(self, associativeKey: &AssociatedKey.data)
            return ret
        }
        
        set {
            setAssociatedObject(self, value: newValue, associativeKey: &AssociatedKey.data, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension UIView {
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: CGFloat {
        get {
            return CGFloat(layer.shadowOpacity)
        }
        set {
            layer.shadowOpacity = Float(newValue)
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    var isShow: Bool {
        set { isHidden = !newValue }
        get { return !isHidden }
    }
}
//extension Reactive where Base : UIView {
//    var isShow: Binder<Bool> {
//        return Binder<Bool>(base, binding: { (target, value) in
//            target.isShow = value
//        })
//    }
//}
extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

extension UIView {
    func layoutIfNeeded(width:CGFloat) {
        var f = self.frame
        f.size.width = width
        self.frame = f
        layoutIfNeeded()
    }
}
