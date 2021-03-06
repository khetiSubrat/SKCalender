//
//  CalenderCollectionView.swift
//  SKCalenderView
//
//  Created by Subrat Kheti on 27/09/20.
//  Copyright © 2020 Subrat Kheti. All rights reserved.
//

import UIKit

class CalenderCollectionView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    let nibName = "CalenderCollectionView"
    var contentView:UIView?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var calendarViewModel =  CalendarViewModel(date: Date())
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        
        
        let nib = UINib(nibName: "DayCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.calendarViewModel.refreshCalendar = { [weak self] ()->() in
            self?.collectionView.reloadData()
        }
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func updateCalender(date: Date) {
        self.calendarViewModel.date = date
    }

}

extension CalenderCollectionView: UICollectionViewDataSource,UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.calendarViewModel.numberofRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DayCollectionViewCell
        
        cell.contentView.backgroundColor = .clear
        cell.day = self.calendarViewModel.configureCell(for: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var reusbaleView: UICollectionReusableView?
        
        if kind == UICollectionView.elementKindSectionHeader {
            let bundle = Bundle(for: type(of: self))
            let nib = UINib(nibName: "CalendarCollectionHeaderView", bundle: bundle)
            reusbaleView = nib.instantiate(withOwner: self, options: nil).first as? UICollectionReusableView
        }
        
        return reusbaleView!
    }
}
