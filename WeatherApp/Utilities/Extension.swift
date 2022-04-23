//
//  Extension.swift
//  WeatherApp
//
//  Created by Raza on 23/04/22.
//

import UIKit

extension URLSession {
    
    enum CustomError:Error {
        case invalidURl
        case invalidData
    }
    
    func request<T:Codable>(url:URL?,
                            expecting:T.Type,
                            completion:@escaping(Result<T,Error>) -> Void )  {
        
        
        guard let  url = url else {
            completion(.failure(CustomError.invalidURl))
            return
            
        }
        
        let task = dataTask(with: url) { data, _, error in
            
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))

            }
            catch {
                completion(.failure(error))

            }
            
        }
        task.resume()
        
    }
    
}

