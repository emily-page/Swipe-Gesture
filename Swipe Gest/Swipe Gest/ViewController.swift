//
//  ViewController.swift
//  Koala
//
//  Created by apcs2 on 3/8/18.
//  Copyright © 2018 apcs2. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var imageE: UIImageView!
    var swipeGesture  = UISwipeGestureRecognizer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imageE.translatesAutoresizingMaskIntoConstraints = false
        imageE.image = UIImage(named: "flower")
        imageE.contentMode = .scaleAspectFill
        imageE.clipsToBounds = true
        view.addSubview(imageE)
        imageE.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageE.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageE.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        imageE.heightAnchor.constraint(equalTo: imageE.widthAnchor, multiplier: 1).isActive = true
        
        let directions: [UISwipeGestureRecognizerDirection] = [.up, .down, .right, .left]
        for direction in directions
        {
            swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeGesture(_:)))
            imageE.addGestureRecognizer(swipeGesture)
            swipeGesture.direction = direction
            imageE.isUserInteractionEnabled = true
            imageE.isMultipleTouchEnabled = true
        }
    }

    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer)
    {
        UIView.animate(withDuration: 1.0) {
            if sender.direction == .right { // Swipe right action
                
                self.imageE.frame = CGRect(x: self.view.frame.size.width - self.imageE.frame.size.width, y: self.imageE.frame.origin.y , width: self.imageE.frame.size.width, height: self.imageE.frame.size.height)
            }else if sender.direction == .left{ // Swipe left action
                
                self.imageE.frame = CGRect(x: 0, y: self.imageE.frame.origin.y , width: self.imageE.frame.size.width, height: self.imageE.frame.size.height)
                
            }else if sender.direction == .up{ // Swipe up action
                
                self.imageE.frame = CGRect(x: self.view.frame.size.width - self.imageE.frame.size.width, y: 0 , width: self.imageE.frame.size.width, height: self.imageE.frame.size.height)
            }else if sender.direction == .down{ // Swipe down action
                
                self.imageE.frame = CGRect(x: self.view.frame.size.width - self.imageE.frame.size.width, y: self.view.frame.size.height - self.imageE.frame.height , width: self.imageE.frame.size.width, height: self.imageE.frame.size.height)
            }
            self.imageE.layoutIfNeeded()
            self.imageE.setNeedsDisplay()
        }
    }
    
    
    
}

