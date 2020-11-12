//
//  NewsCell.swift
//  BaseAFAPI
//
//  Created by ManhLD on 11/12/20.
//

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbFrom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgNews.roundCorners()
//        containerView.rounder()
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowOpacity = 0.7
        containerView.layer.shadowRadius = 3.0
        containerView.layer.masksToBounds = false
    }
    
    func setupCell(model : NewsModel) {
        
        guard let url = model.thumbImg else {
            return
        }
        
        if let author = model.author, author != "" {
            lbAuthor.text = "By: " + author
        } else {
            lbAuthor.text = "By: No Auth"
        }
        
        if let feed = model.feed, feed != "" {
            lbFrom.text = "Feed: " + feed
        } else {
            lbFrom.text = "By: No Feed"
        }
    
        imgNews.sd_setImage(with: URL(string: url)!, placeholderImage: UIImage(named: "noImage"), completed: nil)
        lbTime.text = model.updateAt
        lbTitle.text = model.title
    }
}
