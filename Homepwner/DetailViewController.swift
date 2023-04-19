//
//  DetailViewController.swift
//  Homepwner
//
//  Created by BrainX Technologies on 18/04/2023.
//

import Foundation
import UIKit


class DetailViewController: UIViewController{
    
   
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var flexibleViewTwo: UIView!
    @IBOutlet weak var flexibleViewOne: UIView!
    @IBOutlet weak var fixedViewTwo: UIView!
    @IBOutlet weak var fixedViewOne: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fixedViewOne.backgroundColor = .green
        flexibleViewTwo.backgroundColor = .systemPink
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tapGesture)
        
    }
    
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear method called")
    }
}
