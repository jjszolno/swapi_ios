//
//  CategoriesViewController.swift
//  SWAPI
//
//  Created by Bruno Berisso on 2/22/16.
//  Copyright © 2016 Bruno Berisso. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let menu_options = ["People", "Planets", "Species", "Starships", "Vehicles", "Films"]


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MenuOptionCell")
    }

}


extension CategoriesViewController: UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu_options.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuOptionCell", forIndexPath: indexPath)
        cell.textLabel?.text = menu_options[indexPath.row]
        return cell
    }

}


extension CategoriesViewController: UITableViewDelegate {

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        let detailViewController = ObjectDetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}