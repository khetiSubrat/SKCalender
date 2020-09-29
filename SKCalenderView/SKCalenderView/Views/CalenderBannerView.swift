//
//  CalenderBannerView.swift
//  SKCalenderView
//
//  Created by Subrat Kheti on 27/09/20.
//  Copyright © 2020 Subrat Kheti. All rights reserved.
//

import UIKit

protocol CalendarDelegate: class {
    func calendarUpdateAction(date: Date)
}

class CalenderBannerView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
   
    let nibName = "CalenderBannerView"
    var contentView:UIView?
    
    @IBOutlet weak var monthTitle: UILabel!
    @IBOutlet weak var yearTitle: UILabel!
    
    let months = [1: "January",
                  2: "February",
                  3: "March",
                  4: "April",
                  5: "May",
                  6: "Jun",
                  7: "July",
                  8: "August",
                  9: "September",
                  10: "October",
                  11: "November",
                  12: "December"]
    
    private var date = Date()
    weak var delegate: CalendarDelegate?
    
    
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
        
        if let contentView = contentView {
            contentView.layer.shadowColor = UIColor.green.cgColor
            contentView.layer.shadowOpacity = 1
            contentView.layer.shadowOffset = .zero
            contentView.layer.shadowRadius = 3
        }
        
        self.refreshHeader()
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func refreshHeader() {
        self.monthTitle.text = months[self.date.getMonthFromDate()]!
        self.yearTitle.text = String(self.date.getYearFromDate())
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        self.date = sender.tag == 0 ? self.date.previousMonthFromCurrentDate()! : self.date.nextMonthFromCurrentDate()!
        
        self.refreshHeader()
        self.delegate?.calendarUpdateAction(date: self.date)
    }
}
