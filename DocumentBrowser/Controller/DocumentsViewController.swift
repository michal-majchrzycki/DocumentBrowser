//
//  DocumentsViewController.swift
//  DocumentBrowser
//
//  Created by Michal on 08/12/2018.
//  Copyright © 2018 MichalMajchrzycki. All rights reserved.
//

import UIKit

class DocumentsViewController: BaseViewController {
    
    @IBOutlet weak var documentsTableView: UITableView!
    
    var documents: [Document] = []
    var selected: Document?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        documentsTableView.rowHeight = UITableView.automaticDimension
        documentsTableView.estimatedRowHeight = 60

        if isInternet() {
            Spinner.spin()
            loadData()
        }
    }
    
    func loadData() {
        Api.getDocuments { (documents) in
            self.documents = documents
            self.documentsTableView.reloadData()
            Spinner.stop()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDocumentDetails" {
            if let nextVc = segue.destination as? DocumentViewController {
                nextVc.document = self.selected
            }
        }
    }
}

extension DocumentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentTableViewCell", for: indexPath) as! DocumentTableViewCell
        cell.document = documents[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = documents[indexPath.row]
        performSegue(withIdentifier: "ShowDocumentDetails", sender: indexPath)
    }
    
}
