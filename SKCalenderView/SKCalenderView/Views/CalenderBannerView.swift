//
//  CalenderBannerView.swift
//  SKCalenderView
//
//  Created by Subrat Kheti on 27/09/20.
//  Copyright © 2020 Subrat Kheti. All rights reserved.
//

import UIKit

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
    
    let months = [1: "January", 2: "February", 3: "March", 4: "April", 5: "May",
                  6: "Jun", 7: "July", 8: "August", 9: "Septemeber", 10: "October", 11: "November", 12: "December"]
    
    
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
        
        self.monthTitle.text = months[Date().getMonthFromDate()]!
        self.yearTitle.text = String(Date().getYearFromDate())
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

}
