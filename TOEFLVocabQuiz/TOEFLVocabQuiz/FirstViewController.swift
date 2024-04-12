//
//  FirstViewController.swift
//  TOEFLVocabQuiz
//
//  Created by LinaLiu on 4/11/24.
//

import UIKit

var name = ""

extension UIButton {
    func display() {
        self.layer.cornerRadius = self.frame.height/2
    }
}

class FirstViewController: UIViewController {
    @IBOutlet weak var enterName: UITextField!
    @IBOutlet weak var btnStart: UIButton!
    @IBAction func showMainView(_ sender: Any) {
        name = enterName.text!
        enterName.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        btnStart.display()
        enterName.layer.cornerRadius = 20
    }
}
