//
//  ViewController.swift
//  CoinBase
//
//  Created by Abdulsamed Arslan on 25.10.2023.
//

import UIKit

class ViewController: UITableViewController, UINavigationControllerDelegate  {

    var model = CoinModel()


    override func viewDidLoad()  {

        super.viewDidLoad()
        tableView.register(UINib(nibName: "MessageCellTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MessageCell")
        // Do any additional setup after loading the view.
        tableView.dataSource = self


        navigationController?.title = "CoinPath"
        self.title = "CoinPath"
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.delegate = self




    }

    @IBAction func getData(_ sender: UIBarButtonItem)  {

//        model.dataTask()
//        tableView.reloadData()
        model.getData()
        tableView.reloadData()

    }

}




extension ViewController{
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        cell.transform = CGAffineTransform(scaleX: 1, y: 0)
        UIView.animate(withDuration: 0.5) {

            cell.transform = CGAffineTransform(scaleX: 1, y: 1)

        }


    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCellTableViewCell

        let currentCoin = model.results[indexPath.row]

        cell.price.text = "$" + String(format: "%.2f", currentCoin.quote.USD.price ?? 0)
        cell.coinName.text = currentCoin.name
        cell.coinCode.text = currentCoin.symbol
        cell.changePrice.text = String(format: "%.2f", currentCoin.quote.USD.percent_change_24h ?? 0)
        cell.coinPriceImage.image = Double(currentCoin.quote.USD.percent_change_24h ?? 0) >= 0.0 ? UIImage(systemName: "arrowshape.up.fill")?.withTintColor(.green, renderingMode: .alwaysOriginal) : UIImage(systemName: "arrowshape.down.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)

        
        cell.coinIcon.image = loadImage(from: URL(string: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(currentCoin.id).png")!)

        return cell
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.results.count
    }


    func loadImage(from url: URL) -> UIImage? {
        let semaphore = DispatchSemaphore(value: 0)
        var image: UIImage?

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            defer {
                semaphore.signal()
            }

            if let error = error {
                print("Error loading image: \(error)")
            } else if let data = data {
                image = UIImage(data: data)
            } else {
                image = UIImage(named: "Bitcoin")
            }
        }.resume()

        semaphore.wait()
        return image
    }


}

