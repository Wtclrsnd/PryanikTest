//
//  DataViewModel.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 30.05.2022.
//

import Foundation

final class DataViewModel {

    var data: Sample?

    func getData(completion: @escaping () -> Void) {
        let urlString = "https://pryaniky.com/static/json/sample.json"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        APIManager.getData(request: request, completion: { sample in
            DispatchQueue.main.async {
                self.data = sample
                completion()
            }
        })
    }
}
