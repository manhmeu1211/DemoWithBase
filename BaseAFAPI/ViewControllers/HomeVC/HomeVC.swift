//
//  HomeVC.swift
//  BaseAFAPI
//
//  Created by ManhLD on 11/12/20.
//

import UIKit
import MXSegmentedPager

class HomeVC: BaseViewController {
    
    @IBOutlet weak var segmentPager: MXSegmentedPager!
    @IBOutlet weak var headerView: CustomHeader!
    
    var listVC : [UIViewController] = [NewsVC(), EventsVC()]
    var listMenu : [String] = ["News", "Events"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegment()
    }
    
    private func setupSegment() {
        segmentPager.segmentedControl.textColor = .gray
        segmentPager.segmentedControl.selectedTextColor = .purple
        segmentPager.segmentedControl.indicatorColor = .purple
        segmentPager.segmentedControl.indicatorHeight = 3
        segmentPager.delegate = self
        segmentPager.dataSource = self
        headerView.headerTitle = "Trang chủ"
    }
}

extension HomeVC: MXSegmentedPagerDataSource, MXSegmentedPagerDelegate {
    
    func segmentedPager(_ segmentedPager: MXSegmentedPager, viewForPageAt index: Int) -> UIView {
        return listVC.count > 0 ? listVC[index].view : UIView()
    }
    
    func numberOfPages(in segmentedPager: MXSegmentedPager) -> Int {
        return listMenu.count
    }
    
    func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        if index < listMenu.count {
            return listMenu[index]
        }
        return ""
    }
    
}

