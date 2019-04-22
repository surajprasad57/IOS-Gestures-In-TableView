//
//  ViewController.swift
//  TableTest
//
//  Created by Suraj Prasad on 25/02/19.
//  Copyright © 2019 Suraj Prasad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    //MARK:- Global Variables
    var reqIndex :[IndexPath?] = []
    var rowNo = 0
    var deleteCell = [Int]()
    var personDictArray = [[String:String]]()
    let person1 = ["Name":"Suraj Prasad",
                   "Address":" Shiva Apartments, Block B, New Ashok Nagar - 110096 ",
                   "Picture":"Suraj"]
    let person2 = ["Name":"Deepshikha Garg",
                   "Address":" P-4, block 3, Greater Noida - 201306 ",
                   "Picture":"Deep"]
    let person3 = ["Name":"Ayushya Srivastava",
                   "Address":" Shiva Apartments, Block B, New Ashok Nagar - 110096 ",
                   "Picture":"Ayushya"]
    let person4 = ["Name":"Tushar Dubey",
                    "Address":" Noida Sector-18 near Atta Market ",
                    "Picture":"Tushar"]
    let person5 = ["Name":"Pratap Biswas",
                   "Address":" Noida Sec - 57 near Hanuman Mandir",
                   "Picture":"Pratap"]
    let person6 = ["Name":"Rajesh Ranjan",
                   "Address":" Shiva Apartments, Block B, New Ashok Nagar - 110096 ",
                   "Picture":"Rajesh"]
    let person7 = ["Name":"Shristi Sinha",
                   "Address":" Shiva Apartments, Block B, New Ashok Nagar - 110096 ",
                   "Picture":"Shristi"]
    let person8 = ["Name":"Prerna Singh",
                  "Address":" SadarPur Sec-45 ",
                  "Picture":"Prerna"]
    let person9 = ["Name":"Kritika Tiwari",
                   "Address":" Noida Sector-62 near Shiv Mandir ",
                   "Picture":"Kritika"]
    let person10 = ["Name":"Shirin Tikoo",
                   "Address":"East End Apartments near yamuna Bank ",
                   "Picture":"Shirin"]
    
    
    //MARK:- LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        personDictArray.append(person1)
        personDictArray.append(person2)
        personDictArray.append(person3)
        personDictArray.append(person4)
        personDictArray.append(person5)
        personDictArray.append(person6)
        personDictArray.append(person7)
        personDictArray.append(person8)
        personDictArray.append(person9)
        personDictArray.append(person10)
        print(deleteCell)
        for cellNo in deleteCell {
                personDictArray.remove(at: cellNo)
                print("cell \(cellNo) not loaded")
            }
    }
    //MARK:- TableViewDelegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personDictArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as?TableViewCell{
            cell.personName.text = personDictArray[indexPath.row]["Name"]
            cell.personAddress.text = personDictArray[indexPath.row]["Address"]
            cell.personImage.image = UIImage(named: personDictArray[indexPath.row]["Picture"]!)
            cell.isMultipleTouchEnabled = false
            
            //for tap gesture in name label
            let tapName = UITapGestureRecognizer(target: self, action: #selector(tapPersonAction(_:)))
            tapName.numberOfTapsRequired = 1
            cell.personName.addGestureRecognizer(tapName)
            
            //for longPress gesture in name label
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressPersonAction(_:)))
            cell.addGestureRecognizer(longPress)
            
            //for tap on Table cell image
            let tapImage = UITapGestureRecognizer(target: self, action: #selector(tapImageAction(_:)))
            tapImage.numberOfTapsRequired = 1
            cell.personImage.addGestureRecognizer(tapImage)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    // MARK:- Gesture Methods
    @objc func tapPersonAction(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("name tapped")
            let location = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: location) {
                print("tapped row \(indexPath.row)")
                self.rowNo = indexPath.row
            }
            performSegue(withIdentifier:"toNameViewController", sender: self)
        }
    }
    @objc func longPressPersonAction(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("name long pressed")
            let location = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: location) {
                print(indexPath.row)
                print(indexPath.section)
                self.rowNo = indexPath.row
                self.reqIndex = [indexPath]
            }
            let alertController = UIAlertController(title: "Action Sheet", message: "What would you like to do?", preferredStyle: .actionSheet)
            
            let  deleteButton = UIAlertAction(title: "Delete forever", style: .destructive, handler: { (action) -> Void in
                print("Delete button tapped")
                
                let deleteAlert = UIAlertController(title: "Delete Permanently", message: "Are you sure..???", preferredStyle: .alert)
                
                let YesButton = UIAlertAction(title: "Yes", style: .destructive, handler: { (action) -> Void in
                    print("Yes button tapped")
                    // Deletes tablerow
                    self.deleteCell.append(self.rowNo)
                    
                    self.personDictArray.remove(at: self.rowNo)
                    self.tableView.deleteRows(at: self.reqIndex as! [IndexPath], with: UITableView.RowAnimation.fade)
                    print(self.deleteCell)
                   self.tableView.reloadData()
                    
                })
                let NoButton = UIAlertAction(title: "No", style: .cancel, handler: { (action) -> Void in
                    print("No button tapped")
                })
                deleteAlert.addAction(YesButton)
                deleteAlert.addAction(NoButton)
                self.present(deleteAlert,animated: true,completion: nil)
            })
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
                print("Cancel button tapped")
            })
            alertController.addAction(deleteButton)
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
        }
    }
    
    @objc func tapImageAction(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            print("Image tapped")
            let location = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: location) {
                print("tapped row \(indexPath.row)")
                self.rowNo = indexPath.row
            }
            performSegue(withIdentifier:"profilePic", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? NameViewController {
            print("running")
            print("selected row : \(self.rowNo) ")
            vc.profileName =  self.personDictArray[rowNo]["Name"]
            vc.tableUpdateNameView = self.deleteCell
            
        }
        if let vci = segue.destination as? ProfilePicViewController {
            print("running")
            print("selected row : \(self.rowNo) ")
            vci.pic =  UIImage(named:self.personDictArray[self.rowNo]["Picture"]!)
            vci.tableUpdateImageView = self.deleteCell
        }
    }
}
