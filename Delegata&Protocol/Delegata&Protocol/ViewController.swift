//
//  ViewController.swift
//  Delegata&Protocol
//
//  Created by 이규빈 on 2022/04/08.
//

import UIKit

protocol Flyable {
    func fly()
}
protocol Runnable {
    func run()
}

class Person : Flyable, Runnable {
    func run() {
        print("I can run")
    }
    
    func fly() {
        print("I can fly")
    }
}

protocol ChangeLabelDelegate {
    func doChange()
}

class ViewController: UIViewController {
    
    let person = Person()

    @IBOutlet weak var label: UILabel!
    
    var deldgate: ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        person.fly()
        person.run()
    }

    @IBAction func ButtonDidTapped(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else {
            return
        }
        vc.previousViewController = self
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("sample"), object: nil)
    }
    
    @objc func dataReceived(_ notification: Notification) {
        if let text = notification.object as? String {
            label.text = text
        }
    }
}

