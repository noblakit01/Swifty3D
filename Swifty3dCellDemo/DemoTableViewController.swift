//
//  DemoTableViewController.swift
//  Swifty3dCell
//
//  Created by Minh Luan Tran on 8/24/17.
//
//

import UIKit

class DemoTableViewController: UIViewController {

    var imageNames = [
        "dog-1",
        "dog-2",
        "dog-3",
        "dog-4",
        "dog-5",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension DemoTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DemoTableViewCell
        cell.contentImageView.image = UIImage(named: imageNames[indexPath.row])
        return cell
    }
}
