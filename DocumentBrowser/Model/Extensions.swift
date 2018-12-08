//
//  Extensions.swift
//  DocumentBrowser
//
//  Created by Michal on 08/12/2018.
//  Copyright © 2018 MichalMajchrzycki. All rights reserved.
//

import Foundation

extension String {
    func htmlAttributed() -> NSAttributedString? {
        do {
            let htmlCSSString = "<style>" +
                "html *" +
                "{" +
                "font-size: 11pt !important;" +
                "color: #0000 !important;" +
                "font-family: Helvetica !important;" +
            "}</style> \(self)"
            
            guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
                return nil
            }
            
            return try NSAttributedString(data: data,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
}
