//
//  ViewController.swift
//  Alert
//
//  Created by 이규빈 on 2022/01/11.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(named: "light_on.png")
    let imgOff = UIImage(named: "light_off.png")
    let imgRemove = UIImage(named: "light_remove.jpg")

    var isLampOn = true
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if (isLampOn == true) {
            let lampOnAlert = UIAlertController(title: "Caution!", message: "It's On", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "Ok, I got it.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }
        else {
            imageView.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if (isLampOn == true) {
            let lampOffAlert = UIAlertController(title: "Turn Off", message: "Do you want to turn Off?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {ACTION in self.imageView.image = self.imgOff
                self.isLampOn = false
            })
            let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "Remove", message: "Do you want to remove?", preferredStyle: UIAlertController.Style.alert)
        
        let offAction = UIAlertAction(title: "No, turn off", style: UIAlertAction.Style.default, handler: {ACTION in self.imageView.image = self.imgOff
            self.isLampOn = false
        })
        let onAction = UIAlertAction(title: "No, turn on", style: UIAlertAction.Style.default, handler: {ACTION in self.imageView.image = self.imgOn
            self.isLampOn = true
        })
        let removeAction = UIAlertAction(title: "Yes, remove it.", style: UIAlertAction.Style.default, handler: {ACTION in self.imageView.image = self.imgRemove
            self.isLampOn = false
        })
        
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        
        present(lampRemoveAlert, animated:  true, completion: nil)
    }
}

