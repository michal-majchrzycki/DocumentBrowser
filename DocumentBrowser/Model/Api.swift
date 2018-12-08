//
//  Api.swift
//  DocumentBrowser
//
//  Created by Michal on 08/12/2018.
//  Copyright © 2018 MichalMajchrzycki. All rights reserved.
//

import Foundation
import Alamofire

public class Api {
    
    class func getDocuments(_ block: @escaping (([Document]) -> Void)) {
        let url = Urls().baseUrl + Urls().documents
        
        request(url, method: .get, parameters: nil, headers: nil).responseObject { (response: DataResponse<DocumentsArray>) -> Void in
            if let json = response.result.value?.array {
                block(json)
            }
        }
    }
    
    class func getDocument(id: Int, _ block: @escaping ((Document) -> Void)) {
        let url = Urls().baseUrl + Urls().documents + "/\(id)"
        request(url, method: .get, parameters: nil, headers: nil).responseObject { (response: DataResponse<Document>) in
            if let json = response.value {
                block(json)
            }
        }
    }
}
