//
//  ForgetPassViewController.swift
//  Opportunities
//
//  Created by youssef on 12/18/20.
//  Copyright © 2020 youssef. All rights reserved.
//

import UIKit

class ConframCodeViewController: BaseWireFrame<comformViewModel> {
    
    @IBOutlet weak var textViewNumber1: UITextField!
    
    @IBOutlet weak var textViewNumber2: UITextField!
    @IBOutlet weak var textViewNumber3: UITextField!
    @IBOutlet weak var textviewNumber4: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SetDelget()
        
        // Do any additional setup after loading the view.
    }
    
    func SetDelget(){
        
        textViewNumber1.delegate = self
        textViewNumber2.delegate = self
        textViewNumber3.delegate = self
        textviewNumber4.delegate = self
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func bind(ViewModel: comformViewModel) {
        
    }
    @IBAction func verifyBtn(_ sender: Any) {
        guard let text = textViewNumber1.text, text.isEmpty ,let text2 = textViewNumber2.text, text2.isEmpty,let text3 = textViewNumber3.text, text3.isEmpty,let text4 = textviewNumber4.text, text4.isEmpty else {
            return
        }
        let viewc = coordinator.MainStoryBordNavigator.viewController(for: .haveAcountView)
        present(viewc, animated: true, completion: nil)
        
    }
    
}

extension ConframCodeViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(editChanged(textField:)), for: .editingChanged)
    }
    
    @objc func editChanged(textField : UITextField){
        textField.placeholder = ""
        
        textField.backgroundColor = DesignSystem.Colors.SelectedColor.color
        textField.textColor = DesignSystem.Colors.white.color
        if textField == textViewNumber1 {
            if (textField.text?.count)! == 1 {
                textViewNumber2?.becomeFirstResponder()
            }
        }
        else if textField == textViewNumber2 {
            if (textField.text?.count)! == 1 {
                textViewNumber3.becomeFirstResponder()
            }
        }else{
            if (textField.text?.count)! == 1 {
                textviewNumber4.becomeFirstResponder()
            }
        }
    }
    
}