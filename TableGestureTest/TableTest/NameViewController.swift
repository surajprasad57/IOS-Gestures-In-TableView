//
//  ImageViewController.swift
//  TableTest
//
//  Created by Suraj Prasad on 01/03/19.
//  Copyright © 2019 Suraj Prasad. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {
    
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var fullImage: UIImageView!
    var tableUpdateNameView = [Int]()
    var profileName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let name = profileName else {
            return
        }
        imageName.text = name
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            vc.deleteCell = tableUpdateNameView
            print("Name View to main view \(vc.deleteCell)")
        }
    }
}
