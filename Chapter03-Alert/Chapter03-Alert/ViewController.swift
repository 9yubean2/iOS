//
//  ViewController.swift
//  Chapter03-Alert
//
//  Created by 이규빈 on 2022/05/01.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Properties
    
    let btnAlert = UIButton(type: .system)
    let btnMap = UIButton(type: .system)
    let btnImage = UIButton(type: .system)
    let btnSlider = UIButton(type: .system)
    let btnList = UIButton(type: .system)

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonAttribute()
        allLayout()
        
    }
    
    //MARK: - Helper
    
    func buttonAttribute() {
        btnAlert.frame = CGRect(x: 0, y: 100, width: 100, height: 30)
        btnAlert.center.x = self.view.frame.width / 2
        btnAlert.setTitle("Default Alert", for: .normal)
        btnAlert.addTarget(self, action: #selector(defaultAlert(_:)), for: .touchUpInside)
        
        btnMap.frame = CGRect(x: 0, y: 150, width: 100, height: 30)
        btnMap.center.x = self.view.frame.width / 2
        btnMap.setTitle("Map Alert", for: .normal)
        btnMap.addTarget(self, action: #selector(mapAlert(_:)), for: .touchUpInside)
        
        btnImage.frame = CGRect(x: 0, y: 200, width: 100, height: 30)
        btnImage.center.x = self.view.frame.width / 2
        btnImage.setTitle("Image Alert", for: .normal)
        btnImage.addTarget(self, action: #selector(imageAlert(_:)), for: .touchUpInside)
        
        btnSlider.frame = CGRect(x: 0, y: 250, width: 100, height: 30)
        btnSlider.center.x = self.view.frame.width / 2
        btnSlider.setTitle("Slider Alert", for: .normal)
        btnSlider.addTarget(self, action: #selector(sliderAlert(_:)), for: .touchUpInside)
        
        btnList.frame = CGRect(x: 0, y: 300, width: 100, height: 30)
        btnList.center.x = self.view.frame.width / 2
        btnList.setTitle("List Alert", for: .normal)
        btnList.addTarget(self, action: #selector(listAlert(_:)), for: .touchUpInside)
    }
    
    func allLayout() {
        self.view.addSubview(btnMap)
        self.view.addSubview(btnImage)
        self.view.addSubview(btnSlider)
        self.view.addSubview(btnList)
        self.view.addSubview(btnAlert)
    }
    
    func didSelectRowAt (indexPath: IndexPath){
        print(">>> Selected row at \(indexPath.row)")
    }
    
    //MARK: - Actions
    
    @objc func defaultAlert(_ sender: Any){
        let contentVC = UIViewController()
        contentVC.view.backgroundColor = .red
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let btnCancel = UIAlertAction(title: "Cancel", style: .cancel)
        let btnOk = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(btnCancel)
        alert.addAction(btnOk)
        alert.setValue(contentVC, forKey: "contentViewController")
        self.present(alert, animated: false)
    }
    
    @objc func mapAlert(_ sender: Any){

        let alert = UIAlertController(title: nil, message: "Is This Right?", preferredStyle: .alert)
    
        let contentVC = MapKitViewController()
        
        let btnCancel = UIAlertAction(title: "Cancel", style: .cancel)
        let btnOk = UIAlertAction(title: "OK", style: .default)
        
        self.present(alert, animated: false)
        alert.setValue(contentVC, forKey: "contentViewController")
        
        alert.addAction(btnCancel)
        alert.addAction(btnOk)
        
    }
    
    @objc func imageAlert(_ sender: Any){
 
        let alert = UIAlertController(title: nil, message: "Ratings for this article", preferredStyle: .alert)
    
        let contentVC = ImageViewController()
        alert.setValue(contentVC, forKey: "contentViewController")
        
        let btnOk = UIAlertAction(title: "OK", style: .default)
        alert.addAction(btnOk)
        
        
    }

    @objc func sliderAlert(_ sender: Any){
 
        let alert = UIAlertController(title: nil, message: "Enter ratings for this article", preferredStyle: .alert)
        
        let contentVC = ControllViewController()
        
        let btnOk = UIAlertAction(title: "OK", style: .default) {
            (_) in print(">>> sliderValue = \(contentVC.sliderValue)")
        }
        
        self.present(alert, animated: false)
        alert.setValue(contentVC, forKey: "contentViewController")
        alert.addAction(btnOk)

    }
    
    @objc func listAlert(_ sender: Any){
 
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        
        let contentVC = ListViewController()
        contentVC.delegate = self
        
        let btnOk = UIAlertAction(title: "OK", style: .default)
        
        self.present(alert, animated: false)
        alert.setValue(contentVC, forKey: "contentViewController")
        alert.addAction(btnOk)
        
    }

}

