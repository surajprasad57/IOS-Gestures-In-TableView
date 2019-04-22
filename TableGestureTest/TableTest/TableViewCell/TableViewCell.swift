//
//  TableViewCell.swift
//  TableTest
//
//  Created by Suraj Prasad on 25/02/19.
//  Copyright © 2019 Suraj Prasad. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var myView:ViewController?
    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var personAddress: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        let tapName = UITapGestureRecognizer(target: self, action: #selector(tapPersonAction(_:)))
//        tapName.numberOfTapsRequired = 1
//        personName.addGestureRecognizer(tapName)
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressPersonAction(_:)))
//        personName.addGestureRecognizer(longPress)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
//    @objc func tapPersonAction(_ sender: UITapGestureRecognizer) {
//        if sender.state == .ended {
//            print("name tapped")
//            
//        }
//    }
//    @objc func longPressPersonAction(_ sender: UITapGestureRecognizer) {
//        if sender.state == .ended {
//            print("name long pressed")
//            
//            
//        }
//    }
    
}
