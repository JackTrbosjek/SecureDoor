//
//  EventsViewController.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 04/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//

import UIKit

final class EventsViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: EventsPresenterInterface!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
	
}

// MARK: - Extensions -

extension EventsViewController: EventsViewInterface {
    func reloadData() {
        tableView.reloadData()
    }
}

extension EventsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOrItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        let item = presenter.item(at: indexPath)
        cell.configure(with: item)
        return cell
    }
    
}
