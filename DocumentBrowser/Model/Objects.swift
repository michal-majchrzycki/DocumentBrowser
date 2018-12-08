//
//  Objects.swift
//  DocumentBrowser
//
//  Created by Michal on 08/12/2018.
//  Copyright © 2018 MichalMajchrzycki. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class Document: Mappable {
    
    var category: String?
    var author: String?
    var text: String?
    var title: String?
    var id: Int?
    var created: Date?
    var headerImg: String?
    var thumbnailImg: String?
    
    public func mapping(map: Map) {
        category <- map["category"]
        author <- map["author"]
        text <- map["text"]
        title <- map["title"]
        id <- map["id"]
        var createdString: String?
        createdString <- map["created"]
        if let str = createdString {
            created = DateHelper.dateFrom(string: str)
        }
        headerImg <- map["headerImg"]
        thumbnailImg <- map["thumbnailImg"]
    }
    
    required init?(map: Map) { }
    
}

class DocumentsArray: Mappable {
    var array: [Document]?
    public func mapping(map: Map) {
        array <- map["documents"]
    }
    required init?(map: Map) { }
}
