//
//  CollectionViewAutoHeightService.swift
//  PinterestStyle
//
//  Created by HI-Wong Che Hsing on 25/02/2019.
//  Copyright © 2019 HI-Wong Che Hsing. All rights reserved.
//

import UIKit

class CollectionViewAutoHeightService<ModelType, CellType: UICollectionViewCell> {
    let nib:UINib
    let configCell:(ModelType, CellType)->()
    let cardCollectionView:UICollectionView
    let heightCollectionViewConstraint:NSLayoutConstraint
    var maxHeight:CGFloat = 0
    
    init(collectionView: UICollectionView, cvHeightConstraint: NSLayoutConstraint, nib: UINib, configCell: @escaping (ModelType, CellType)->()) {
        self.nib = nib
        self.configCell = configCell
        self.heightCollectionViewConstraint = cvHeightConstraint
        self.cardCollectionView = collectionView
    }
    
    func calculateContactLeadHeight(models: [ModelType]) {
        let cell = nib.instantiate(withOwner: nil, options: nil).first as! CellType
        var maxHeight:CGFloat = 0
        models.forEach({ model in
            self.configCell(model, cell)
            var fittingSize: CGSize = UIView.layoutFittingCompressedSize;
            let verticalFittingPriority: UILayoutPriority = UILayoutPriority(rawValue: Float(1))
            fittingSize.width = getItemWidthForContactLead()
            let size = cell.contentView.systemLayoutSizeFitting(fittingSize, withHorizontalFittingPriority: UILayoutPriority.required, verticalFittingPriority: verticalFittingPriority)
            maxHeight = max(maxHeight, size.height)
        })
        self.maxHeight = maxHeight
    }
    
    fileprivate func getItemWidthForContactLead() -> CGFloat {
        return cardCollectionView.bounds.size.width / 2
    }
    
    func updateHeightContactLeadCollectionView() {
        let itemWidth = cardCollectionView.bounds.size.width / 2
        //let layout = self.cardCollectionView.collectionViewLayout as! ContactLayout
        //layout.itemSize = CGSize(width: itemWidth, height: self.maxHeight)
        self.heightCollectionViewConstraint.constant = self.maxHeight
    }
}
