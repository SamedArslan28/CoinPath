//
//  CoinModel.swift
//  CoinBase
//
//  Created by Abdulsamed Arslan on 27.10.2023.
//

import Foundation

class CoinModel {
    var results =  [CryptoInfo]()

    func dataTask() {
        let apiUrl = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?cryptocurrency_type=coins&sort=market_cap&limit=20"  // Replace with your API endpoint URL

        if let url = URL(string: apiUrl) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            // Add headers to the request
            request.addValue("9eb5a421-c765-455a-a3cf-fc1727cc5099", forHTTPHeaderField: "X-CMC_PRO_API_KEY")
            request.addValue("application/json", forHTTPHeaderField: "Accept")

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        if let decodedData = try? decoder.decode(Coin.self, from: data) {
                            // Access and use the decoded data
                            // Handle other properties as needed
                            self.results = decodedData.data
                            


                        } else {
                            print("Failed to decode JSON data.")
                        }
                    }
                }
            }
            task.resume()
        } else {
            print("Invalid URL")
        }
    }
}
