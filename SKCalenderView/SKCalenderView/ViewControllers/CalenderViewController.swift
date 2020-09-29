//
//  ViewController.swift
//  SKCalenderView
//
//  Created by Subrat Kheti on 27/09/20.
//  Copyright © 2020 Subrat Kheti. All rights reserved.
//

import UIKit

class CalenderViewController: UIViewController {
    
    @IBOutlet weak var calenderBannerView: CalenderBannerView!
    @IBOutlet weak var collectionView: CalenderCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.calenderBannerView.delegate = self
    }

}

extension CalenderViewController: CalendarDelegate {
    func calendarUpdateAction(date: Date) {
        self.collectionView.updateCalender(date: date)
    }
}

