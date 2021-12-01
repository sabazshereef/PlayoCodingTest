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
        NetworkManager.shared.getHedalinesData(urlString: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f3021982eefa40fdba67a8a3b8a2f6c7", expecting: Headlines.self) { [weak self] result in
            switch result{
                
            case .success(let result):
                self?.listOfHeadlines = result.articles
                self?.reloadDataDelegate.refreshTable()
            case .failure(_):
                print("!error")
            }
        }
    }
    func resultCount() -> Int {
        return listOfHeadlines.count
    }
    
    func getAuthor(index: Int) -> String{
        return listOfHeadlines[index].author
        
    }
    func getTitle(index: Int) -> String {
        return listOfHeadlines[index].title
    }
    func getDescription(index: Int) -> String {
        return listOfHeadlines[index].articleDescription
    }
    func getImageUrl(index: Int) -> URL? {
        return URL(string: listOfHeadlines[index].urlToImage) 
    }
    
}
protocol ReloadDataDelegate {
    func refreshTable()
}
