//
//  DataViewModel.swift
//  PryanikTest
//
//  Created by Emil Shpeklord on 30.05.2022.
//

import Foundation

final class DataViewModel {

    var data: Sample?
    var modules: [String: DataClass]?

    func getData(completion: @escaping () -> Void) {
        URLCache.shared.removeAllCachedResponses()
        let urlString = "https://pryaniky.com/static/json/sample.json"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        APIManager.getData(request: request, completion: { sample in
            DispatchQueue.main.async {
                self.data = sample
                print(sample)
                self.convertData(data: sample)
                completion()
            }
        })
    }

    private func convertData(data: Sample) {
        modules = [:]
        guard let data = data.data else { return }
        for module in data {
            switch module.name {
            case "hz":
                modules?[module.name ?? ""] = module.data
            case "selector":
                modules?[module.name ?? ""] = module.data
            case "picture":
                modules?[module.name ?? ""] = module.data
            default:
                modules?[module.name ?? ""] = module.data
            }
        }
    }
}
