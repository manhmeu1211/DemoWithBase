//
//  CustomHeader.swift
//  BaseAFAPI
//
//  Created by ManhLD on 11/12/20.
//

import UIKit

class CustomHeader: CustomView {
    
    @IBOutlet weak var lbTitle: UILabel!
    
    var headerTitle: String? {
        didSet {
            lbTitle.text = headerTitle
        }
    }
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
  
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 0, height: 130)
    }
}
