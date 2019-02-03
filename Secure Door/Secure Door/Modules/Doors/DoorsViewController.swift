//
//  DoorsViewController.swift
//  Secure Door
//
//  Created by UHP Mac 5 on 03/02/2019.
//  Copyright (c) 2019 Jakov. All rights reserved.
//
//

import UIKit

final class DoorsViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: DoorsPresenterInterface!
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Doors"
        presenter.viewDidLoad()
    }
	
}

// MARK: - Extensions -

extension DoorsViewController: DoorsViewInterface {
    func reloadData() {
        tableView.reloadData()
    }
}

extension DoorsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOrItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "doorCell", for: indexPath) as! DoorTableViewCell
        let item = presenter.item(at: indexPath)
        cell.configure(with: item)
        return cell
    }
    
}

extension DoorsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectItem(at: indexPath)
    }
}
