//
//  StaggerCollecitonViewLayout.swift
//  CollecitonViewLayout
//
//  Created by Yee Chuan Lee on 11/03/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import UIKit

func log(_ s: String) {
    print(s)
}
func profile(_ name: String, _ closure:()->()) {
    let start = Date().timeIntervalSince1970
    closure()
    let end = Date().timeIntervalSince1970
    print("\(name)duration=\(end-start)")
}

protocol StaggerCollecitonViewLayoutDelegate: class {
    func staggerCollectionViewLayoutItemHeight(for indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat
}
class StaggerCollecitonViewLayout : UICollectionViewLayout {
    typealias AttributesResult = (attributes: [IndexPath: StaggerCollectionViewLayoutAttributes], contentSize: CGSize)
    
    fileprivate var prepared: Bool = false
    fileprivate var attributesCache: [IndexPath: StaggerCollectionViewLayoutAttributes] = [:]
    fileprivate var contentSize = CGSize.zero
    fileprivate let columnNumber:Int = 3
    fileprivate let lineSpace:CGFloat = 10
    fileprivate var updateIsScrollingTimer: Timer? = nil
    var shouldInvalidateDuringScrolling: Bool = false
    var estimateItemHeight: CGFloat = 360
    weak var delegate: StaggerCollecitonViewLayoutDelegate? = nil
    var isScrolling: Bool = false {
        didSet {
            guard let collectionView = collectionView else { return }
            if !isScrolling {
                let context = StaggerCollectionViewLayoutInvalidationContext()
                context.invalidatedBounds = collectionView.bounds
                invalidateLayout(with: context)
            }
        }
    }
    
    deinit {
        self.updateIsScrollingTimer?.invalidate()
    }
    
    func setupTimerUpdateIsScrolling() {
        self.updateIsScrollingTimer?.invalidate()
        self.updateIsScrollingTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
            guard let `self` = self else { return }
            guard let collectionView = self.collectionView else { return }
            let newValue = collectionView.isDragging || collectionView.isDecelerating
            if newValue != self.isScrolling {
                self.isScrolling = newValue
            }
        }
        RunLoop.current.add(updateIsScrollingTimer!, forMode: .common)
    }
    
    override class var invalidationContextClass: AnyClass { return StaggerCollectionViewLayoutInvalidationContext.self }
    
    override class var layoutAttributesClass: AnyClass { return StaggerCollectionViewLayoutAttributes.self }
    
    override func prepare() {
        log("prepare")
        guard !prepared else { return }
        prepared = true
        guard self.collectionView != nil else { return }
        self.setupTimerUpdateIsScrolling()
        let (attributes, contentSize) = createLayout(isEstimateItemHeight: true)
        self.contentSize = contentSize
        self.attributesCache = attributes
    }
    
    func createAdjustedLayoutOriginY(attributesCache: [IndexPath: StaggerCollectionViewLayoutAttributes]) -> AttributesResult {
        
        
        var ret: [IndexPath: StaggerCollectionViewLayoutAttributes] = [:]
        var contentSize: CGSize = .zero
        profile("createAdjustedLayoutOriginY@") {
            let groupByColumnIndex: Dictionary<Int, [(key: IndexPath, value: StaggerCollectionViewLayoutAttributes)]> =
                Dictionary(grouping: attributesCache.enumerated().map { $0.element }, by: { return $0.key.item % columnNumber })
            for columnIndex in groupByColumnIndex.keys {
                let columnList = groupByColumnIndex[columnIndex]!
                let sortedColumnList = columnList.sorted(by: {  $0.key.item < $1.key.item })
                var yoffset: CGFloat = 0
                for (index, attr) in sortedColumnList.enumerated() {
                    let indexPath: IndexPath = attr.key
                    if index == 0 {
                        yoffset = attr.value.frame.maxY
                        ret[indexPath] = attr.value
                    } else {
                        var origin = attr.value.frame.origin
                        origin.y = yoffset + lineSpace
                        attr.value.frame.origin = origin
                        yoffset = attr.value.frame.maxY
                        ret[indexPath] = attr.value
                    }
                }
            }
        }
        
        contentSize = createContentSize(attributesCache: ret)
        
        return (attributes: ret, contentSize: contentSize)
    }
    
    func createContentSize(attributesCache: [IndexPath: StaggerCollectionViewLayoutAttributes]) -> CGSize {
        return attributesCache.values
            .map { $0.frame }
            .reduce(CGSize.zero, { CGSize(width: max($0.width, $1.maxX), height: max($0.height, $1.maxY)) })
    }
    
    func invalidateAllCachedIndexPaths(context: StaggerCollectionViewLayoutInvalidationContext) {
        let indexPaths = attributesCache.keys.sorted(by: { $0.item < $1.item })
        context.invalidateItems(at: indexPaths)
    }
    
    func createLayout(attributesCache: [IndexPath: StaggerCollectionViewLayoutAttributes], bounds: CGRect) -> (indexPaths: [IndexPath], contentSize: CGSize, attributes: [IndexPath: StaggerCollectionViewLayoutAttributes]) {
        let attributesInBound = attributesCache.values.filter { att in
            return bounds.intersects(att.frame)
        }
        var ret: [IndexPath: StaggerCollectionViewLayoutAttributes] = attributesCache
        let estimatedAttributes = attributesInBound.filter {$0.isEstimatedItemSize}
        if estimatedAttributes.count > 0 {
            let indexPaths = estimatedAttributes.map { $0.indexPath }
            for attributes in estimatedAttributes {
                let indexPath = attributes.indexPath
                let newAttributes = createAttribute(isEstimateItemHeight: false,
                                                    columnIndex: attributes.columnIndex,
                                                    yoffset: attributes.frame.minY-lineSpace,
                                                    indexPath: attributes.indexPath)
                ret[indexPath] = newAttributes
            }
            let (attributesCache, contentSize) = createAdjustedLayoutOriginY(attributesCache: attributesCache)
            return (attributes: attributesCache, contentSize: contentSize, indexPaths: indexPaths)
        } else {
            return (attributes: attributesCache, contentSize: self.contentSize, indexPaths: [])
        }
    }
    
    func createLayout(isEstimateItemHeight: Bool) -> AttributesResult {
        guard let collectionView = self.collectionView else { return (contentSize: .zero, attributes: [:]) }
        var contentSize: CGSize = .zero
        var attributesCache: [IndexPath: StaggerCollectionViewLayoutAttributes] = [:]
        
        var yoffset:[Int: CGFloat] = [:]
        profile("prepare@ create all with estimate height") {
            for i in 0..<collectionView.numberOfSections {
                for _j in 0..<collectionView.numberOfItems(inSection: i) {
                    let j = _j % columnNumber
                    let indexPath = IndexPath(item: _j, section: i)
                    let cellWidth:CGFloat = floor((collectionView.bounds.width - CGFloat(columnNumber-1) * lineSpace) / CGFloat(columnNumber))
                    let attributes = createAttribute(isEstimateItemHeight: isEstimateItemHeight,
                                                     columnIndex: j,
                                                     yoffset: yoffset[j] ?? 0,
                                                     indexPath: indexPath)
                    attributesCache[indexPath] = attributes
                    log("index = \(indexPath), attributes.frame = \(attributes.frame)")
                    contentSize.width = max(attributes.frame.maxX, contentSize.width)
                    contentSize.height = max(attributes.frame.maxY, contentSize.height)
                    
                    yoffset[j] = CGFloat(attributes.frame.maxY)
                }
            }
        }
        
        profile("prepare@ create visible bound height") {
            
        
            let attributesInBound = attributesCache.values.filter { att in
                return collectionView.bounds.intersects(att.frame)
            }
            let estimatedAttributes = attributesInBound.filter {$0.isEstimatedItemSize}
            if estimatedAttributes.count > 0 {
                for attributes in estimatedAttributes {
                    let indexPath = attributes.indexPath
                    let newAttributes = createAttribute(isEstimateItemHeight: false,
                                                        columnIndex: attributes.columnIndex,
                                                        yoffset: attributes.frame.minY-lineSpace,
                                                        indexPath: attributes.indexPath)
                    attributesCache[indexPath] = newAttributes
                }
                let (attributesCache, contentSize) = createAdjustedLayoutOriginY(attributesCache: attributesCache)
                self.attributesCache = attributesCache
                self.contentSize = contentSize
            }
        
        }
        return (contentSize: contentSize, attributes: attributesCache)
    }
    func createAttribute(isEstimateItemHeight:Bool, columnIndex: Int, yoffset: CGFloat, indexPath: IndexPath) -> StaggerCollectionViewLayoutAttributes {
        let attributes = StaggerCollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.isEstimatedItemSize = isEstimateItemHeight
        let cellWidth:CGFloat = floor((collectionView!.bounds.width - CGFloat(columnNumber-1) * lineSpace) / CGFloat(columnNumber))
        attributes.columnIndex = columnIndex
        attributes.frame = CGRect(x: CGFloat(columnIndex) * (cellWidth + lineSpace),
                                  y: yoffset + lineSpace,
                                  width: cellWidth,
                                  height: isEstimateItemHeight ? self.estimateItemHeight : getItemHeight(for: indexPath, width: cellWidth))
        return attributes
    }
    
    func getItemHeight(for indexPath: IndexPath, width: CGFloat) -> CGFloat {
        return delegate?.staggerCollectionViewLayoutItemHeight(for:indexPath, itemWidth: width) ?? 0
    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var start = Date().timeIntervalSince1970
        let bounds = collectionView!.bounds
        let ret = attributesCache.values.filter { att in
            return rect.intersects(att.frame)
        }
        var end = Date().timeIntervalSince1970
        log("layoutAttributesForElements(\(end-start))@ rect=\(rect), \(ret.count), collectionView.bounds = \(collectionView!.bounds)")
        return ret
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        log("layoutAttributesForItem@ \(indexPath)")
        return attributesCache[indexPath]
    }
    
    
    override var collectionViewContentSize: CGSize {
        log("collectionViewContentSize@ \(contentSize), collectionView.bounds = \(collectionView!.bounds)")
        return contentSize
    }
    //////
    
    override func invalidateLayout() {
        log("invalidateLayout")
        super.invalidateLayout()
    }
    
    
    override func invalidateLayout(with context: UICollectionViewLayoutInvalidationContext) {
        let context = context as! StaggerCollectionViewLayoutInvalidationContext
        log("invalidateLayoutWithContext@ \(context.debugDescription)")
        if context.invalidateEverything {
            prepared = false
        }
        if context.invalidatedBounds != .zero {
            let attributesInBound = attributesCache.values.filter { att in
                return context.invalidatedBounds.intersects(att.frame)
            }
            let estimatedAttributes = attributesInBound.filter {$0.isEstimatedItemSize}
            if estimatedAttributes.count > 0 {
                for attributes in estimatedAttributes {
                    let indexPath = attributes.indexPath
                    let newAttributes = createAttribute(isEstimateItemHeight: false,
                                                        columnIndex: attributes.columnIndex,
                                                        yoffset: attributes.frame.minY-lineSpace,
                                                        indexPath: attributes.indexPath)
                    self.attributesCache[indexPath] = newAttributes
                }
                
                
                context.invalidateItems(at:
                    estimatedAttributes.map { $0.indexPath })
                
                let (attributesCache, contentSize) = createAdjustedLayoutOriginY(attributesCache: self.attributesCache)
                self.attributesCache = attributesCache
                self.contentSize = contentSize
                invalidateAllCachedIndexPaths(context: context)
            }
        }
        super.invalidateLayout(with: context)
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        log("shouldInvalidateLayout(forBoundsChange@ \(newBounds)")
        if shouldInvalidateDuringScrolling {
            return newBounds.origin != collectionView!.bounds.origin
        } else {
            return newBounds.size != collectionView!.bounds.size
        }
    }
    
    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let ret = super.invalidationContext(forBoundsChange: newBounds) as! StaggerCollectionViewLayoutInvalidationContext
        log("invalidationContext(forBoundsChange@ ret = \(ret.debugDescription)")
        if shouldInvalidateDuringScrolling {
            if newBounds.origin != collectionView!.bounds.origin {
                ret.boundOriginChanged = true
                ret.invalidatedBounds = newBounds
            }
        }
        return ret
    }
    
    
    
    override func shouldInvalidateLayout(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) -> Bool {
        let ret = super.shouldInvalidateLayout(forPreferredLayoutAttributes: preferredAttributes, withOriginalAttributes: originalAttributes)
        log("shouldInvalidateLayout(forPreferredLayoutAttributes@ ret=  \(ret)")
        return ret
    }
    
    override func invalidationContext(forPreferredLayoutAttributes preferredAttributes: UICollectionViewLayoutAttributes, withOriginalAttributes originalAttributes: UICollectionViewLayoutAttributes) ->
        UICollectionViewLayoutInvalidationContext {
        let ret = super.invalidationContext(forPreferredLayoutAttributes: preferredAttributes, withOriginalAttributes: originalAttributes)
            log("invalidationContext(forPreferredLayoutAttributes@ ret = \(ret.debugDescription)")
            return ret
    }


    override func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem]) {
        log("prepare(forCollectionViewUpdates@ \(updateItems)")
        super.prepare(forCollectionViewUpdates: updateItems)
    }

}

extension UICollectionViewLayoutInvalidationContext {
    override open var debugDescription: String {
        return
        "invalidateEverything = \(self.invalidateEverything), " +
        "invalidateDataSourceCounts = \(self.invalidateDataSourceCounts), " +
        "invalidatedItemIndexPaths = \(self.invalidatedItemIndexPaths), " +
        "contentOffsetAdjustment = \(self.contentOffsetAdjustment), " +
        "contentSizeAdjustment = \(self.contentSizeAdjustment), "
    }
}

class StaggerCollectionViewLayoutInvalidationContext: UICollectionViewLayoutInvalidationContext {
    var boundOriginChanged: Bool = false
    var invalidatedBounds: CGRect = .zero
    override func invalidateItems(at indexPaths: [IndexPath]) {
        log("invalidateItemsAtIndexPath@ \(indexPaths)")
        return super.invalidateItems(at: indexPaths)
    }
}

class StaggerCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var isEstimatedItemSize: Bool = false
    var columnIndex: Int = 0
}
