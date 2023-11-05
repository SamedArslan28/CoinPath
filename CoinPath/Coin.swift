import Foundation

struct Coin: Codable {
    let data: [CryptoInfo]
}

struct CryptoInfo: Codable {
    let id: Int
    let name: String
    let symbol: String
    

    let quote: Quote
}



struct Quote: Codable {
    let USD: QuoteDetails
}

struct QuoteDetails: Codable {
    let price: Double?
    let percent_change_24h: Double?



}
