//
//  ViewController.swift
//  PlayoCodingTest
//
//  Created by sabaz shereef on 30/11/21.
//

import UIKit
import SDWebImage

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
        return viewModel.resultCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = headlinesTableView.dequeueReusableCell(withIdentifier: "cell") as! HeadlinesTableViewCell
        cell.newsAuthor.text = viewModel.getAuthor(index: indexPath.row)
        cell.newsTitle.text = viewModel.getTitle(index: indexPath.row)
        cell.newsImage.sd_setImage(with: viewModel.getImageUrl(index: indexPath.row), placeholderImage:UIImage(systemName: "questionmark"))
        cell.newsDescription.text = viewModel.getDescription(index: indexPath.row)
        return cell
    }
  
}
extension HeadlinesViewController: ReloadDataDelegate {
    func refreshTable() {
        DispatchQueue.main.async {
            self.headlinesTableView.reloadData()
        }
       
    }
    
    
}
