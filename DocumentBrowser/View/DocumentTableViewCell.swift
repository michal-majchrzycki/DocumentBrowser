//
//  DocumentTableViewCell.swift
//  DocumentBrowser
//
//  Created by Michal on 08/12/2018.
//  Copyright © 2018 MichalMajchrzycki. All rights reserved.
//

import UIKit
import SDWebImage

class DocumentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var document: Document? {
        didSet {
            setupView()
        }
    }
    
    private func setupView() {
        
        imageIcon.layer.cornerRadius = 20
        imageIcon.clipsToBounds = true
        
        if let image = document?.thumbnailImg {
            imageIcon.sd_setImage(with: URL(string: image))
        }
        titleLabel.text = document?.title ?? ""
        categoryLabel.text = document?.category ?? ""
    }
    
}
