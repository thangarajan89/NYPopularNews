//
//  NYArcticleListTableViewCell.swift
//  NYTimesMostPopularArticles
//
//  Created by Thangarajan K on 08/08/18.
//  Copyright © 2018 Thangarajan K. All rights reserved.
//

import UIKit
import SDWebImage

class NYArcticleListTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var headLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
        profileImageView.clipsToBounds = true
        circleView.layer.cornerRadius = circleView.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func updateCell(_ resultData: Results?) {
        headLabel.text = resultData?.title
        descLabel.text = resultData?.abstract
        authorLabel.text = resultData?.source
        dateLabel.text = resultData?.publishedDate
        if let media = resultData?.media?.first, let url = media.mediaMetadata?.first?.url {
            profileImageView.sd_setImage(with: URL(string: url), completed: nil)
        }
    }
}
