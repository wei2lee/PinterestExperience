//
//  LeadCountView.swift
//  AIAAgent
//
//  Created by Yee Chuan Lee on 11/10/2018.
//  Copyright © 2018 lee yee chuan. All rights reserved.
//

import UIKit
//import NibDesignable

class LeadCountView : NibDesignable {
    @IBOutlet var sourceLabel:UILabel!
    @IBOutlet var countLabel:UILabel!
    // MARK: - Implementation -
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        backgroundColor = .clear
    }
    func configure(sourceText:String, countText:String) {
        sourceLabel.text = sourceText
        countLabel.text = countText
    }
    
}
