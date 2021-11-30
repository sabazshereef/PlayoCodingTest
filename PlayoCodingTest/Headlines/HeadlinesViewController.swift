//
//  ViewController.swift
//  PlayoCodingTest
//
//  Created by sabaz shereef on 30/11/21.
//

import UIKit

class HeadlinesViewController: UIViewController {

    @IBOutlet weak var headlinesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        headlinesTableView.delegate = self
        headlinesTableView.dataSource = self
        
    }


}
extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = headlinesTableView.dequeueReusableCell(withIdentifier: "cell") as! HeadlinesTableViewCell
        return cell
    }
    
    
    
    
}

