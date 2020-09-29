//
//  DayCollectionViewCell.swift
//  SKCalenderView
//
//  Created by Subrat Kheti on 27/09/20.
//  Copyright © 2020 Subrat Kheti. All rights reserved.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    
     var day: DayViewModel? {
        didSet {
            self.dayLabel.text = String(day!.todayDate)
            self.dayLabel.isHidden = day!.isShow
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
