//
//  ContactCardIconsView.swift
//  LeadManagementComponent
//
//  Created by UF-Jacky Liew on 20/08/2018.
//  Copyright © 2018 UF-Jacky Liew. All rights reserved.
//

import UIKit

class ContactLeadCardIconsView: UIView {

    @IBOutlet weak var vitalityButton: UIButton!
    @IBOutlet weak var lifeOwnerButton: UIButton!
    @IBOutlet weak var takafulButton: UIButton!
    @IBOutlet weak var paButton: UIButton!
    
    let nibName = "ContactLeadCardIconsView"
    var view : UIView!
    
    // MARK: - Implementation -
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetUp()
        config()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetUp()
        config()
    }
    
    func xibSetUp() {
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    func loadViewFromNib() ->UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func config() {
        self.vitalityButton.setImage(UIImage(named: "vitality"), for: UIControl.State.normal)
        self.lifeOwnerButton.setImage(UIImage(named: "life"), for: UIControl.State.normal)
        self.takafulButton.setImage(UIImage(named: "takaful"), for: UIControl.State.normal)
        self.paButton.setImage(UIImage(named: "pa"), for: UIControl.State.normal)
    }
}
