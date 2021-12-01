//
//  HeadlinesViewModel.swift
//  PlayoCodingTest
//
//  Created by sabaz shereef on 30/11/21.
//

import Foundation


class HeadlinesViewModel {
    
    var listOfHeadlines = [Article]()
    var reloadDataDelegate: ReloadDataDelegate!
    
    func getNewsData () {
        NetworkManager.shared.getHedalinesData(urlString: ApiEndpoints.headlinesEndpoint, expecting: Headlines.self) { [weak self] result in
            switch result{
                
            case .success(let result):
                self?.listOfHeadlines = result.articles
                self?.reloadDataDelegate.refreshTable()
            case .failure(let error):
                print(error)
            }
        }
    }
    func resultCount() -> Int? {
        return listOfHeadlines.count
    }
    
    func getAuthor(index: Int) -> String {
        
        return listOfHeadlines[index].author ?? "No Author"
        
    }
    func getTitle(index: Int) -> String {
        return listOfHeadlines[index].title ?? "No title"
    }
    func getDescription(index: Int) -> String {
        return listOfHeadlines[index].articleDescription ?? "No description available"
    }
    func getImageUrl(index: Int) -> String {
        return listOfHeadlines[index].urlToImage ?? ""
    }
    func getwebsiteAddress(index: Int) -> String{
        return  listOfHeadlines[index].url ?? ""
    }
    
}
protocol ReloadDataDelegate {
    func refreshTable()
}
