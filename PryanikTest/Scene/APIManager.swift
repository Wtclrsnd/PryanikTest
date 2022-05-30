//
//  NetworkManager.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 30.05.2022.
//

import Foundation

enum APIManager {
    static func getData(request: URLRequest, completion: @escaping (Sample) -> Void) {
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil else {
                print(String(describing: error?.localizedDescription))
                return
            }
            guard let data = data else {
                return
            }

            print(data)

            let jsonDecoder = JSONDecoder()

            do {
                let responseObject = try jsonDecoder.decode(
                    Sample.self,
                    from: data
                )
                completion(responseObject)
            } catch let error {
                print(String(describing: error.localizedDescription))
            }
        }
        .resume()
    }
}
