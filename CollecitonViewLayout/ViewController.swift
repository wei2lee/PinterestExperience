//
//  ViewController.swift
//  CollecitonViewLayout
//
//  Created by Yee Chuan Lee on 11/03/2019.
//  Copyright © 2019 Yee Chuan Lee. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UICollectionViewDataSource,StaggerCollecitonViewLayoutDelegate {

    let nib = UINib(nibName: "ContactLeadNewCell", bundle: nil)
    lazy var sizingCell: Cell = { [unowned self] in return self.nib.instantiate(withOwner: nil, options: nil).first as! Cell }()
    @IBOutlet weak var collectionView : UICollectionView!
    var datas: [ContactLeadModel] = []
    var myCollectionLayout = StaggerCollecitonViewLayout()
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        myCollectionLayout.delegate = self
        func run() {
//            collectionView.collectionViewLayout = UICollectionViewFlowLayout()
            datas.append(contentsOf: createTempData())
            collectionView.isPrefetchingEnabled = false
            collectionView.prefetchDataSource = nil
            log("set collection view layout")
            collectionView.collectionViewLayout = myCollectionLayout
            log("set collection data source")
            collectionView.dataSource = self
            
        }
        
        //DispatchQueue.main.asyncAfter(deadline: .now() + 0, execute: {
        // Do any additional setup after loading the view, typically from a nib.
            run()
        //})    
    }
    //MARK: <UICollectionDataSource >
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        log("numberOfSections@")
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        defer {
            log("numberOfItemsInSection@ ret=\(datas.count)")
        }
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        log("cellForItemAt@\(indexPath)")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        let model = datas[indexPath.item]
        configureCell(cell: cell, model: model)
        return cell
    }
    //MARK: IBAction
    @IBAction func insertHead() {
        log("insertHead")
        let indexPath = IndexPath(item: 0, section: 0)
        datas.insert(createTempData1(), at: 0)
        collectionView.performBatchUpdates({
            log("insertHead-1")
            self.collectionView!.insertItems(at: [indexPath])
            log("insertHead-2")
        }, completion: nil)
    }
    @IBAction func insertTail()  {
        log("insertTail")
        let indexPath = IndexPath(item: datas.count, section: 0)
        datas.append(createTempData1())
        collectionView.performBatchUpdates({
            log("insertTail-1")
            self.collectionView!.insertItems(at: [indexPath])
            log("insertTail-2")
        }, completion: nil)
    }
    @IBAction func deleteHead()  {
        guard datas.count > 0 else { return }
        let indexPath = IndexPath(item: 0, section: 0)
        datas.removeFirst()
        collectionView.performBatchUpdates({
            self.collectionView!.deleteItems(at: [indexPath])
        }, completion: nil)
    }
    @IBAction func deleteTail() {
        guard datas.count > 0 else { return }
        let indexPath = IndexPath(item: datas.count-1, section: 0)
        datas.removeLast()
        collectionView.performBatchUpdates({
            self.collectionView!.deleteItems(at: [indexPath])
        }, completion: nil)
    }
    @IBAction func reload() {
        collectionView.reloadData()
    }
    @IBAction func toggleShouldInvalidateDuringScroll() {
        myCollectionLayout.shouldInvalidateDuringScrolling = !myCollectionLayout.shouldInvalidateDuringScrolling
    }
    
    func createTempData1() -> ContactLeadModel{
        let contact1 = ContactLeadModel(ownerNameText: "Leong Chee Ming 1", raceText: "Others", genderText: "Male", ownerText: "Owner", idNoText: "123445", showIdNo: "1", dobText: "12 Mar 1255", showDOB: "1", vitalityLevelText: "123132131sda asdas ad", vitalityAmountAttrStr: "asdasdas da asd", reminderNoteText: "asdsad adad adada asda asdas dsd asdas a sadasd asd adas asd asa a sd asd asd asd adas dasd asd aa dasd asd aa sd")
        return contact1
        
    }
    
    func configureCell(cell: Cell, model: ContactLeadModel) {
        //if false {
        cell.fullNameLabel.text = model.ownerNameText
        cell.raceLabel.text = model.raceText
        cell.genderLabel.text = model.genderText
        cell.ownerLabel.text = model.ownerText
        cell.idLabel.text = model.idNoText
        cell.dobLabel.text = model.dobText
        cell.vitalityStatusLabel.text = model.vitalityLevelText
        cell.reminderNotesValueLabel.text = model.reminderNoteText
        cell.highlightView.config(viewModel: "")
        //}
    }
    
    func createTempData() -> [ContactLeadModel] {
        var contacts: [ContactLeadModel] = []
        let contact1 = createTempData1()
        let contact2 = ContactLeadModel(ownerNameText: "Leong Chee Ming 2", raceText: "Others", genderText: "Male", ownerText: "Owner", idNoText: "123445", showIdNo: "1", dobText: "12 Mar 1255", showDOB: "1", vitalityLevelText: "asdasdasdasd", vitalityAmountAttrStr: "", reminderNoteText: "")
        
        let contact3 = ContactLeadModel(ownerNameText: "Leong Test Ming 3", raceText: "Others", genderText: "Female", ownerText: "Owner", idNoText: "123445", showIdNo: "1", dobText: "12 Mar 1255", showDOB: "1", vitalityLevelText: "sadasd", vitalityAmountAttrStr: "", reminderNoteText: "sdasdadsasdasdasd sadas dasda sdasda asd asda")
        
        let contact4 = ContactLeadModel(ownerNameText: "Leong Test Ming 4", raceText: "Others", genderText: "Female", ownerText: "Owner", idNoText: "123445", showIdNo: "1", dobText: "12 Mar 1255", showDOB: "1", vitalityLevelText: "sadasd", vitalityAmountAttrStr: "", reminderNoteText: "asdsad adad adada asda asdas dsd asdas a sadasd asd adas asd asa a sd asd asd asd adas dasd asd aa dasd asd aa sd sadasd adasd asd asd asdas dsa dasds adasd asd sad adasd sad asdasd asd asda das d asd aa sd sadasd adasd asd asd asdas dsa dasds adasd asd sad adasd sad asdasd asd asda das d")
        
        let contact5 = ContactLeadModel(ownerNameText: "Leong Test Ming 5", raceText: "Others", genderText: "Female", ownerText: "Owner", idNoText: "123445", showIdNo: "1", dobText: "12 Mar 1255", showDOB: "1", vitalityLevelText: "sadasd", vitalityAmountAttrStr: "", reminderNoteText: "sdasdadsasdasdasd sadas dasda sdasda asd asda")
        
        for _ in 1...50 {
            contacts.append(contact1)
            contacts.append(contact2)
            contacts.append(contact3)
            contacts.append(contact4)
            contacts.append(contact5)
        }
        
        return contacts
    }
    
    
    //MARK: <MyCollecitonViewLayoutDelegate>
    
    func staggerCollectionViewLayoutItemHeight(for indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        let model = datas[indexPath.item]
        configureCell(cell: sizingCell, model: model)
        let targetSize = CGSize(width: itemWidth, height: UIView.layoutFittingCompressedSize.height)
        let verticalPriority = UILayoutPriority(1)
        let size = sizingCell.containerView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: verticalPriority)
        return size.height
    }
}

