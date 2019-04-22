//
//  ProfilePicViewController.swift
//  TableTest
//
//  Created by Suraj Prasad on 01/03/19.
//  Copyright © 2019 Suraj Prasad. All rights reserved.
//

import UIKit

class ProfilePicViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    var pic : UIImage?
    var tableUpdateImageView = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        guard let profileImg = pic else {
            return
        }
        profileImage.image = profileImg
        
        //for pan gesture in Images
        let panImage = UIPanGestureRecognizer(target: self, action: #selector(panImageAction(_:)))
        self.profileImage.addGestureRecognizer(panImage)
        
        //for pinch gesture in Images
        let pinchImage = UIPinchGestureRecognizer(target: self, action: #selector(pinchImageAction(_:)))
        self.profileImage.addGestureRecognizer(pinchImage)
        
        //for rotate gesture in Images
        let rotateImage = UIRotationGestureRecognizer(target: self, action: #selector(rotateImageAction(_:)))
        self.profileImage.addGestureRecognizer(rotateImage)
    }
    //MARK:- Gesture Methods
    @objc func panImageAction(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: self.view)
        
        if let view = sender.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    @objc func pinchImageAction(_ sender: UIPinchGestureRecognizer) {
        if let view = sender.view{
            profileImage.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
        }
    }
    @objc func rotateImageAction(_ sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            profileImage.transform = view.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            vc.deleteCell = tableUpdateImageView
            print("Image View to main view \(vc.deleteCell)")
        }
    }
}
