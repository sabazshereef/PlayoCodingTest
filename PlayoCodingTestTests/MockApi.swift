//
//  MockApi.swift
//  AdevintaCodeChallengeTests
//
//  Created by sabaz shereef on 17/11/21.
//

import Foundation
class MockApi {
  
    static let shared = MockApi()

    enum errors : Error {
        case InvalidUrl
        case NoData
        
    }
    func getHedalinesData <T: Codable> (expecting: T.Type, completion: @escaping(Result<T,Error>) -> Void){

        
        guard let url = Bundle(for: MockApi.self).url(forResource: "MockApiResponse", withExtension: "json") else {
            completion(.failure(errors.InvalidUrl))
            return
        }
        do{
        
            let data = try Data(contentsOf: url)
          
            let result = try JSONDecoder().decode(expecting, from: data)
            print(result)
            completion(.success(result))
        }
        catch {
          
            
            completion(.failure(errors.NoData))
        }
        
    }
    

}
