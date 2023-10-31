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
        // Do any additional setup after loading the view.

        tableView.dataSource = self
        model.dataTask()
        tableView.reloadData()

        tableView.register(UINib(nibName: "MessageCellTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "MessageCell")
        


    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCellTableViewCell

        cell.price.text = "$" + String(format:"%.2f" ,model.results[indexPath.row].quote.USD.price ?? 0)
        cell.coinName.text = String(model.results[indexPath.row].name)
        cell.coinCode.text = String(model.results[indexPath.row].symbol)
        cell.changePrice.text = String(model.results[indexPath.row].quote.USD.percent_change_1h ?? 0)


        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.results.count
    }
    
    
    @IBAction func getData(_ sender: UIBarButtonItem) {
        model.dataTask()
        tableView.reloadData()


        }
    }

