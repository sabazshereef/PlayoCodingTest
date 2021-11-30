//
//  HeadlinesViewModel.swift
//  PlayoCodingTest
//
//  Created by sabaz shereef on 30/11/21.
//

import Foundation


class HeadlinesViewModel {
    
    func getNewsData () {
        NetworkManager.shared.getHedalinesData(urlString: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f3021982eefa40fdba67a8a3b8a2f6c7", expecting: Headlines.self) { result in
            switch result{
                
            case .success(let headlineNews):
                print("headline news - ", headlineNews)
            case .failure(_):
                print("!error")
            }
        }
    }
}
