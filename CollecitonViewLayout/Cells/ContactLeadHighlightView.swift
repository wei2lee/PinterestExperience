//
//  ContactLeadHighlightView.swift
//  AIAAgent
//
//  Created by Jacky Liew on 19/09/2018.
//  Copyright © 2018 lee yee chuan. All rights reserved.
//

import UIKit
//import NibDesignable
import RxSwift
import RxCocoa

class ContactLeadHighlightView: NibDesignable {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var appointmentView: EventAppointmentRowView!
    
    var viewModel: ContactLeadAppointmentRowViewModel?
    //var viewDidTapSubject: PublishSubject<ContactLeadAppointmentRowViewModel>?
    
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
        
    }
    
    func config(viewModel: ContactLeadAppointmentRowViewModel) {
        self.viewModel = viewModel
        self.baseView.backgroundColor = viewModel.backgroundColor
        self.appointmentView.config(viewModel: viewModel)
        
//        _ = self.appointmentView.rx.didTapRowDriver
//            .drive(onNext: { [weak self] (viewModel) in
//                guard let `self` = self else { return }
//                self.viewDidTapSubject?.onNext(viewModel)
//            })
    }
}
