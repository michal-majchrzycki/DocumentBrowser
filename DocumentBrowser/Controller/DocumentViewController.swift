//
//  DocumentViewController.swift
//  DocumentBrowser
//
//  Created by Michal on 08/12/2018.
//  Copyright © 2018 MichalMajchrzycki. All rights reserved.
//

import UIKit
import WebKit
import SDWebImage

class DocumentViewController: BaseViewController {
    
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentText: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var document: Document?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isInternet() {
            Spinner.spin()
            loadData()
        }
    }
    
    private func loadData() {
        navigationTitle.title = document?.category
        titleLabel.text = document?.title ?? ""
        guard let id = document?.id else { return }
        Api.getDocument(id: id) { (document) in
            
            if let image = document.headerImg {
                self.imageIcon.sd_setImage(with: URL(string: image))
            }
            self.authorLabel.text = document.author ?? ""
            if let date = document.created {
                self.dateLabel.text = DateHelper.stringFrom(date: date)
            }
            self.loadWebContentFrom(string: document.text)
        }
    }
    
    private func loadWebContentFrom(string: String?) {
        if let text = string {
            self.contentText.attributedText = text.htmlAttributed()
            Spinner.stop()
        }
    }
}
