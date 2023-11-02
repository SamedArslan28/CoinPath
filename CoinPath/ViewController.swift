//
//  ViewController.swift
//  CoinBase
//
//  Created by Abdulsamed Arslan on 25.10.2023.
//

import UIKit

class ViewController: UITableViewController, UINavigationControllerDelegate { 

    var model = CoinModel()

    override func viewDidLoad() {

        super.viewDidLoad()
        tableView.register(UINib(nibName: "MessageCellTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MessageCell")
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.reloadData()

    }
    

    
    
    @IBAction func getData(_ sender: UIBarButtonItem) {

        model.dataTask()
        
        tableView.reloadData()


        }


    }

extension ViewController{
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //        cell.alpha = 0
        cell.transform = CGAffineTransform(scaleX: 1, y: 0)
        UIView.animate(withDuration: 0.5) {
            //            cell.alpha = 1
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)

        }


    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCellTableViewCell

        cell.price.text = "$" + String(format:"%.2f" ,model.results[indexPath.row].quote.USD.price ?? 0)
        cell.coinName.text = String(model.results[indexPath.row].name)
        cell.coinCode.text = String(model.results[indexPath.row].symbol)
        cell.changePrice.text = String(format:"%.2f" ,model.results[indexPath.row].quote.USD.percent_change_24h ?? 0)
        cell.coinPriceImage.image =  Double(model.results[indexPath.row].quote.USD.percent_change_24h ?? 0) >= 0.0 ? UIImage(systemName:  "arrowshape.up.fill")?.withTintColor(.green,renderingMode: .alwaysOriginal) : UIImage(systemName:  "arrowshape.down.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)


        return cell
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.results.count
    }

}

