//
//  register.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import DefaultsKit


class registerVC : UIViewController,UITextFieldDelegate,UITextViewDelegate   {
    
        
        
        
        let titleLabel : UILabel = {
            let label = UILabel ()
            label.text = "به باشکاه مشتریان باران خوش آمدید"
            label.textColor = .white
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 20)
            return label
        }()
        
        
        var issue_title : UILabel = {
            let label = UILabel ()
            label.textColor = .white
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont.systemFont(ofSize: 18)
            return label
        }()
        
    
        
        
        
        let register_label : UILabel = {
            let label = UILabel ()
            label.text = "لطفا شماره تلفن همراه خود را وارد نمایید"
            label.textColor = .white
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 18)
            label.numberOfLines = 0
            return label
        }()
        
        public let phone_icon: UIButton = {
            let button = UIButton()
            let image = #imageLiteral(resourceName: "back").mask(with:UIColor.white)
            button.setImage(image, for: .normal)
            
            return button
        }()
        let phone_number : UnderLineTextField = {
            let textfiled = UnderLineTextField ()
            textfiled.tintColor = .white
            textfiled.textColor = .white
            textfiled.textAlignment = .center
            textfiled.font = UIFont.systemFont(ofSize: 24)
            textfiled.keyboardType = .numberPad
            textfiled.placeholder = "09120000000"
            return textfiled
        }()
        
        
    
        
//        let agreement_label : UITextView = {
//            let textview = UITextView()
//            textview.isEditable = false
//            textview.backgroundColor = .clear
//            textview.textColor = .white
//            textview.textAlignment = .right
//            return textview
//        }()
    
        //    let agreement_label : UILabel = {
        //        let textview = UILabel()
        //        textview.backgroundColor = .clear
        //        textview.textColor = .white
        //        textview.text = "قوانین و مقررات را خوانده ام و با آن موافقم"
        //        return textview
        //    }()
        
        let submit: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("دریافت کد یکبار مصرف", for: .normal)
            button.setTitleColor(UIColor.download_blue, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.setBorder(backgroundColor: UIColor.white, corner: 20, borderWidth: 0, borderColor: .gray)
            return button
            
        }()
        
        
        
        
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            guard let stringRange = Range(range, in: currentText) else { return false }
            
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            return updatedText.count <= 11
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor.download_blue
            self.setupView()
            
            
            
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(true)
            self.navigationController?.setNavigationBarHidden(true, animated: true)
            
        }
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
//            view.setGradientBackground(ColorOne:Colors.Fadedblue , Colortwo: Colors.Bluish, Colorthree: Colors.Aquamarine)
            
            
        }
        
        
    
        
        func setupView(){
            self.hideKeyboardWhenTappedAround()
            
            
            view.addSubview(titleLabel)
            titleLabel.snp.makeConstraints { (make) -> Void in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().inset(80)
                
            }
            
            
            
            view.addSubview(register_label)
            register_label.snp.makeConstraints { (make) -> Void in
                make.centerY.centerX.equalToSuperview()
            }
            
            view.addSubview(issue_title)
            issue_title.snp.makeConstraints { (make) -> Void in
                make.centerX.equalToSuperview()
                make.bottom.equalTo(register_label.snp.top).offset(-50)
                make.width.equalToSuperview().multipliedBy(0.8)
            }
            
            
            view.addSubview(phone_number)
            phone_number.snp.makeConstraints { (make) -> Void in
                make.centerX.equalToSuperview()
                make.top.equalTo(register_label.snp.bottom).offset(50)
                make.width.equalTo(300)
                make.height.equalTo(35)
            }
            view.addSubview(phone_icon)
            phone_icon.snp.makeConstraints { (make) -> Void in
                make.centerY.equalTo(phone_number.snp.centerY)
                make.right.equalTo(phone_number.snp.right)
                make.height.width.equalTo(40)
            }
            phone_number.delegate = self
            
            
            
            
            
            
            view.addSubview(submit)
            submit.snp.makeConstraints { (make) -> Void in
                make.centerX.equalToSuperview()
                make.top.equalTo(phone_number.snp.bottom).offset(20)
                make.width.equalTo(200)
                make.height.equalTo(40)
            }
            
            submit.addAction(for: .touchUpInside) {
                
                if((self.phone_number.text?.count)! < 11){
                    let warning = toastView(text: "شماره وارد شده بایستی ۱۱ رقم باشد",type:"warning")
                    warning.show()
                }else{
                    
                    let _phone_number =  self.phone_number.text!.convertToEnglish()
                    
                    //                print(_phone_number)
                    user_Api.register(phone_number: _phone_number, completionHandler: { (Response) in
                        if let  Res = Response{
                            if(Res.status!){
                                let code_verify_view = code_verify_page()
                                code_verify_view.phone_number =  _phone_number
                                self.navigationController?.pushViewController(code_verify_view, animated: true)
                            }else{
                                AlertManager.ErrorAlert(title: "اشکال", subtitle: "شماره وارد شده معتبر نیست . لطفا شماره را با دقت بیشتری وارد نمایید", button: "متوجه شدم")
                            }
                        }
                    })
                    
                }
            }
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }
    
    
    
    
    extension UILabel {
        ///Find the index of character (in the attributedText) at point
        func indexOfAttributedTextCharacterAtPoint(point: CGPoint) -> Int {
            assert(self.attributedText != nil, "This method is developed for attributed string")
            let textStorage = NSTextStorage(attributedString: self.attributedText!)
            let layoutManager = NSLayoutManager()
            textStorage.addLayoutManager(layoutManager)
            let textContainer = NSTextContainer(size: self.frame.size)
            textContainer.lineFragmentPadding = 0
            textContainer.maximumNumberOfLines = self.numberOfLines
            textContainer.lineBreakMode = self.lineBreakMode
            layoutManager.addTextContainer(textContainer)
            
            let index = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
            return index
        }
}

