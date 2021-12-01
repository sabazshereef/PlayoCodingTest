//
//  NetworkManager.swift
//  PlayoCodingTest
//
//  Created by sabaz shereef on 30/11/21.
//

import Foundation


final class NetworkManager {
    
    static let shared = NetworkManager()
   
    enum errors : Error {
        case InvalidUrl
        case NoData
        
    }
    
    func getHedalinesData <T: Codable> (urlString: String, expecting: T.Type, completion: @escaping(Result<T,Error>) -> Void){
        
        
        guard let url = URL(string: urlString) else{
            completion(.failure(errors.InvalidUrl))
            return
        }
    
        let dataTask = URLSession.shared.dataTask(with: url) { data,_,error in
            guard let jsonData = data else{
                completion(.failure(errors.NoData))
                return
            }
            do {
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(expecting, from: jsonData)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
        };
        dataTask.resume()

       
        
    }
}
