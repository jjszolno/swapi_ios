//
//  ObjectDetailViewController.swift
//  SWAPI
//
//  Created by Bruno Berisso on 2/22/16.
//  Copyright © 2016 Bruno Berisso. All rights reserved.
//

import UIKit


class ObjectDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var objectList: [Object]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "ObjectCell")
    }
}


extension ObjectDetailViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectList?.count ?? 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ObjectCell", forIndexPath: indexPath)

        if let object = objectList?[indexPath.row] {
            cell.textLabel?.text = object.name
        }

        return cell
    }
}