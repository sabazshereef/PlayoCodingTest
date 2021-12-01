//
//  ViewController.swift
//  PlayoCodingTest
//
//  Created by sabaz shereef on 30/11/21.
//

import UIKit
import SDWebImage
import SafariServices

class HeadlinesViewController: UIViewController {
    
    @IBOutlet weak var headlinesTableView: UITableView!
    
    var viewModel = HeadlinesViewModel()
    var refreshingData = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        headlinesTableView.delegate = self
        headlinesTableView.dataSource = self
        viewModel.reloadDataDelegate = self
        viewModel.getNewsData()
        self.showSpinner(onView: self.view)
        refreshingData.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        headlinesTableView.addSubview(refreshingData)
    }
    @objc func refresh(sender: UIRefreshControl){
        
        viewModel.getNewsData()
        refreshingData.endRefreshing()
        
    }
    
}
extension HeadlinesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.resultCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = headlinesTableView.dequeueReusableCell(withIdentifier: "cell") as! HeadlinesTableViewCell  
        cell.configureCell(index: indexPath.row, viewModel: viewModel)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = URL(string: viewModel.getwebsiteAddress(index: indexPath.row)  ){
            let safariVc = SFSafariViewController(url: url)
            present(safariVc,animated: true, completion: nil)
        }
        else{
            print("website not found")
        }
                
    }
}
extension HeadlinesViewController: ReloadDataDelegate {
    func refreshTable() {
        DispatchQueue.main.async {
            self.headlinesTableView.reloadData()
            self.removeSpinner()
        }
        
    }
    
    
}
