//
//  register completion.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//



import Foundation
import UIKit
import SnapKit
import AdSupport
import DefaultsKit


class register_completion_page: UIViewController ,UINavigationControllerDelegate{
    
    
    
    var probable_user:userModel?
    
    
    let titleLabel : UILabel = {
        let label = UILabel ()
        label.text = "تکمیل ثبت نام "
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
    
    
    
    let register_label : UILabel = {
        let label = UILabel ()
//        label.text = "ثبت نام شما با موفقیت انجام شد. برای تجربه کاربری بهتر لطفا موارد زیر را تکمیل نمایید "
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    
    let full_name : UnderLineTextField = {
        let textfiled = UnderLineTextField ()
        textfiled.tintColor = .white
        textfiled.textColor = .white
        textfiled.textAlignment = .center
        textfiled.font = UIFont.systemFont(ofSize: 20)
        textfiled.placeholder = "نام کاربری"
        return textfiled
    }()
    
    
    
    
    
    
    
    
    
    let submit: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("تکمیل ثبت نام", for: .normal)
        button.setTitleColor(UIColor.download_blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setBorder(backgroundColor: UIColor.white, corner: 20, borderWidth: 0, borderColor: .gray)
        return button
        
    }()
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.download_blue
        self.setupView()
        self.hideKeyboardWhenTappedAround()
        
        
        
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
        
        view.addSubview(register_label)
        register_label.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(100)
        }
        
        
      
        
        view.addSubview(full_name)
        full_name.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(register_label.snp.bottom).offset(30)
            make.width.equalTo(200)
            make.height.equalTo(35)
        }
        
        
        
        
        
        
        view.addSubview(submit)
        submit.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(full_name.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        if let p_full_name = self.probable_user?.full_name {
                self.full_name.text = p_full_name
                self.full_name.isUserInteractionEnabled = false
                self.titleLabel.text = "تکمیل ثبت نام"
                self.register_label.text = ""
                
            }else{
                self.full_name.text = ""
            let _text = "ثبت نام شما با موفقیت انجام شد. برای تجربه کاربری بهتر لطفا موارد زیر را تکمیل نمایید "
                self.register_label.makeAttributeWithAlignment(fontSize: 18, text: _text,alignment:.center)
            }
        
        
        
        
        
        
        
        
        submit.addAction(for: .touchUpInside) {
            
            //            Defaults.shared.set(true, for: AppProperty.shared.isLoggedIn )
            //
            //            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateUserInfo"), object: nil,userInfo:nil)
            //             self.dismiss(animated: true, completion: nil)
            //
            
            if((self.full_name.text?.count)! == 0){
                let warning = toastView(text: "نام کاربری نمیتواند خالی باشد",type:"warning")
                warning.show()
            }else{
                
//                print(self.full_name.text!)
                
                let osv = ProcessInfo().operatingSystemVersion
                let ios_version:String = String(osv.majorVersion) + "." + String(osv.minorVersion) + "." + String(osv.patchVersion)
                let app_version :String = (Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String)!
                let device_model : String = UIDevice.modelName
                
                
                let notification_token = "pushhhhhhhh"/// Defaults.shared.get( for: AppProperty.shared.push_token)
                
                user_Api.update_info(full_name: self.full_name.text! , device_type: device_model, ios_version: ios_version, app_version: app_version,receive_notifications: true,notification_token:notification_token, completionHandler: { (Response) in
                    
                    if let Res = Response {
                        if Res.status! {
                            AlertManager.successfulHandlerAlert(title: "عملیات موفق", subtitle: "ثبت نام شما با موفقیت انجام شد", button:  "بسیار خب", secondSelector: {
                                Defaults.shared.set(true, for: AppProperty.shared.isLoggedIn )
//                                if(Res.user?.credit != nil){
//                                    Defaults.shared.set(true, for: AppProperty.shared.user_has_credit)
//
//                                }
//                                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateUserInfo"), object: nil,userInfo:nil)
//                                self.dismiss(animated: true, completion: nil)
                                Switcher.updateRootVC()
                            })
                        }else{
                            AlertManager.ErrorAlert(title: "مشکل", subtitle: Res.message!, button: "متوجه شدم")
                        }
                        
                    }
                })
                
            }
        }
        
        
        
        
        
        
        
        
        
    }
    
    
    func gather_user_data () {
        
    }
    
    
    func identifierForAdvertising() -> String? {
        // Check whether advertising tracking is enabled
        guard ASIdentifierManager.shared().isAdvertisingTrackingEnabled else {
            return nil
        }
        
        // Get and return IDFA
        return ASIdentifierManager.shared().advertisingIdentifier.uuidString
    }
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}



