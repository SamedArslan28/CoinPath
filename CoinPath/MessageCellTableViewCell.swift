//
//  MessageCellTableViewCell.swift
//  CoinBase
//
//  Created by Abdulsamed Arslan on 31.10.2023.
//

import UIKit

class MessageCellTableViewCell: UITableViewCell {


    @IBOutlet weak var coinName: UILabel!
    @IBOutlet weak var changePrice: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var coinCode: UILabel!

    @IBOutlet weak var coinPriceImage: UIImageView!
    @IBOutlet weak var coinIcon: UIImageView!

    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        coinCode.textColor = .secondaryLabel

        changePrice.textColor = Double(changePrice.text ?? "0") ?? 0.0 >= 0.0 ? .green : .red







//        coinIcon.image = UIImage(named: coinName.text ?? "Bitcoin")



    }
}



