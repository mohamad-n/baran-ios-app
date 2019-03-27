//
//  verify code page.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//


import Foundation
import UIKit
import SnapKit
import DefaultsKit


class code_verify_page: UIViewController,UITextFieldDelegate {
    
    
    
    
    let titleLabel : UILabel = {
        let label = UILabel ()
        label.text = ""
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    
    var phone_number:String?
    
    public let backButton: UIButton = {
        let button = UIButton()
        let image = #imageLiteral(resourceName: "back").mask(with:UIColor.white)
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    public let code_icon: UIButton = {
        let button = UIButton()
        let image = #imageLiteral(resourceName: "back").mask(with:UIColor.white)
        button.setImage(image, for: .normal)
        
        return button
    }()
    
    
    
    
    let register_label : UILabel = {
        let label = UILabel ()
        label.text = "لطفا کد دریافتی را وارد نمایید"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    
    let recieved_code : UnderLineTextField = {
        let textfiled = UnderLineTextField ()
        textfiled.tintColor = .white
        textfiled.textColor = .white
        textfiled.textAlignment = .center
        textfiled.font = UIFont.systemFont(ofSize: 24)
        textfiled.keyboardType = .numberPad
        textfiled.placeholder = "----"
        return textfiled
    }()
    
    
    let submit: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ثبت کد", for: .normal)
        button.setTitleColor(UIColor.download_blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setBorder(backgroundColor: UIColor.white, corner: 20, borderWidth: 0, borderColor: .gray)
        return button
        
    }()
    
    
    let number_correction: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("تصحیح شماره تلفن", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        //        button.setBorder(backgroundColor: UIColor.download_blue, corner: 20, borderWidth: 0, borderColor: .gray)
        return button
        
    }()
    
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= 4
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
//        view.setGradientBackground(ColorOne:Colors.Fadedblue , Colortwo: Colors.Bluish, Colorthree: Colors.Aquamarine)
        
        
    }
    
    
    
    func setupView(){
        
        self.hideKeyboardWhenTappedAround()
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.right.equalToSuperview().inset(25)
            make.top.equalToSuperview().inset(35)
            
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { (make) -> Void in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(35)
            
            make.height.width.equalTo(25)
        }
        
        backButton.addAction(for: .touchUpInside) {
            self.navigationController?.popViewController(animated: true)
        }
        let _text = "لطفا کد چهار رقمی ارسال شده به شماره " + (self.phone_number?.convertToPersian())! + " را وارد نمایید"
        
        register_label.makeAttributeWithAlignment(fontSize: 18, text: _text,alignment:.center)
        
        
        view.addSubview(register_label)
        register_label.snp.makeConstraints { (make) -> Void in
            make.centerY.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        view.addSubview(recieved_code)
        recieved_code.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(register_label.snp.bottom).offset(50)
            make.width.equalTo(140)
            make.height.equalTo(35)
        }
        
        view.addSubview(code_icon)
        code_icon.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(recieved_code.snp.centerY)
            make.right.equalTo(recieved_code.snp.right)
            make.height.width.equalTo(20)
        }
        
        recieved_code.delegate = self
        
        view.addSubview(submit)
        submit.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(recieved_code.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        view.addSubview(number_correction)
        number_correction.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        number_correction.addAction(for: .touchUpInside) {
            self.navigationController?.popViewController(animated: true)
        }
        
        submit.addAction(for: .touchUpInside) {
            
            if((self.recieved_code.text?.count)! < 4){
                let warning = toastView(text: "کد تایید بایستی ۴ رقم باشد",type:"warning")
                warning.show()
            }else{
                
                let _code = self.recieved_code.text!.convertToEnglish()
                user_Api.verify(phone_number: self.phone_number!, code:_code , completionHandler: { (Response) in
                    if let Res = Response {
                        if Res.status! {
                            Defaults.shared.set(Res.user!.token!, for: AppProperty.shared.token )
                            let completion_page_view = register_completion_page()
                            completion_page_view.probable_user = Res.user
                            self.navigationController?.pushViewController(completion_page_view, animated: true)
                        }else{
                            AlertManager.ErrorAlert(title: "مشکل", subtitle: Res.message!, button: "متوجه شدم")
                        }
                        
                    }
                })
            }
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}



