//
//  ViewController.swift
//  Animations - Larry
//
//  Created by admin on 02/02/2020.
//  Copyright © 2020 AM Kirsch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var allImages: [UIImage] = []
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func fadeIn(_ sender: Any) {
        
        imageView.alpha = 0

        UIView.animate(withDuration: 2, animations: {
            self.imageView.alpha = 1
        })
    }
    
    @IBAction func slideIn(_ sender: Any) {
        print("imageView.center.x == ", imageView.center.x)
        print("imageView.center.y == ", imageView.center.y)

        imageView.center = CGPoint(x: imageView.center.x - 500, y: imageView.center.y)
        UIView.animate(withDuration: 2, animations: {
            self.imageView.center = CGPoint(x: self.imageView.center.x + 500, y: self.imageView.center.y)
        })
    }
    
    @IBAction func grow(_ sender: Any) {
        print("imageView.frame == ", imageView.frame)

        imageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 2, animations: {
            self.imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        })
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allImages = createImageArray(total: 410)
        imageView.image = UIImage(named: "frames/frame_1.gif")
        
    }
    
    func createImageArray(total: Int ) -> [UIImage]{
        var imageArray:[UIImage] = []
        
        for index in 1...total {
            let imageName = "frames/frame_\(index).gif"
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        return imageArray
    }

    @IBAction func next(_ sender: Any) {
        if imageView.isAnimating {
            imageView.stopAnimating()
            button.setTitle("Start",  for: UIControl.State.normal )
        }
        else {
            imageView.animationImages = allImages
            imageView.animationDuration = 5
            imageView.animationRepeatCount = 1 //default is 0 loops continuously
            imageView.startAnimating()
            button.setTitle("Stop",  for: UIControl.State.normal )
        }
    }
    
    


}

