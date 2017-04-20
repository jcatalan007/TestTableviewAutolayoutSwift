//
//  ViewController.swift
//  TestAutolayoutSwift
//
//  Created by Juan Catalan on 4/20/17.
//  Copyright © 2017 Bitcrafters, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dynamicTVHeight: NSLayoutConstraint!
    
    let numberOfRows = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = min(self.view.bounds.size.height, tableView.contentSize.height)
        dynamicTVHeight.constant = height
        self.view.layoutIfNeeded()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndetifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndetifier, for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = "Cell \(indexPath.row)"
        return cell
    }


}

