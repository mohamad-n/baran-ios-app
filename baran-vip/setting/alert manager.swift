//
//  alert manager.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//


import Foundation
import UIKit
import SCLAlertView

class AlertManager : UIViewController {
    class func ErrorHandlerAlert(title : String , subtitle : String ,button : String, secondSelector:@escaping MethodHandler) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(button) {
            secondSelector()
        }
        
        
        _ = alert.showError(title, subTitle: subtitle)
        
    }
    class func ErrorAlert(title : String , subtitle : String ,button : String) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            //            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            //            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            //            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(button) {
        }
        
        
        _ = alert.showError(title, subTitle: subtitle)
        
    }
    class func successfulHandlerAlert(title : String , subtitle : String ,button : String, secondSelector:@escaping MethodHandler) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(button) {
            secondSelector()
        }
        
        
        _ = alert.showSuccess(title, subTitle: subtitle)
        
    }
    class func warningHandlerAlert(title : String , subtitle : String ,extraButton : String,cancelButton:String, secondSelector:@escaping MethodHandler) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(extraButton) {
            secondSelector()
        }
        _ = alert.addButton(cancelButton) {
        }
        
        
        _ = alert.showWarning(title, subTitle: subtitle)
        
    }
    class func successfulAlert(title : String , subtitle : String ,button : String) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(button) {
        }
        
        
        _ = alert.showSuccess(title, subTitle: subtitle)
        
    }
    
    func customAlert(title : String , subtitle : String ,button : String) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        // _ = alert.addButton("First Button", target:self, selector:#selector(self.firstButton))
        _ = alert.addButton(button) {
            // print("Second button tapped")
        }
        
        let icon = UIImage(named:"custom_icon.png")
        let color = UIColor.orange
        
        _ = alert.showCustom(title , subTitle: subtitle , color: color, icon: icon!)
        
        
    }
    
    func errorAlert(title : String , subtitle : String ,button : String) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(button) {
        }
        
        
        _ = alert.showError(title, subTitle: subtitle)
        
    }
    
    
    func inputTextAlert(title : String  ,button : String ,completionHandler : @escaping ((_ Response : String) -> Void)) {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        let subview = UIView (frame: CGRect(x: 0, y: 0, width: 217, height: 70))
        //    UIView(frame: CGRect   (x=0,y=0,width=216,height=70))
        let x = (subview.frame.width - 180) / 2
        
        let textfield1 = UITextField(frame: CGRect(x:x,y:30,width:180,height:25))
        textfield1.layer.borderColor = UIColor.green.cgColor
        textfield1.layer.borderWidth = 1.5
        textfield1.layer.cornerRadius = 5
        textfield1.placeholder = "متن نظر"
        textfield1.textAlignment = NSTextAlignment.center
        subview.addSubview(textfield1)
        
        _ = alert.addButton(button) {
            
        }
        
        
        _ = alert.showSuccess(title, subTitle: "")
        
    }
    
    func characterCountErrorAlert(title : String , subtitle : String ,button : String) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(button) {
        }
        
        
        _ = alert.showError(title, subTitle: subtitle)
        
    }
    
    func successAlert(title : String , subtitle : String ,button : String) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(button) {
        }
        
        
        _ = alert.showSuccess(title, subTitle: subtitle)
        
    }
    
    func SimpleWarningAlert(title : String , subtitle : String ,button : String) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(button) {
        }
        
        
        _ = alert.showWarning(title, subTitle: subtitle)
        
    }
    typealias MethodHandler = ()  -> Void
    
    func WarningAlert(title : String , subtitle : String ,button : String , secondSelector:@escaping MethodHandler) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(button) {
            secondSelector()
        }
        
        
        _ = alert.showWarning(title, subTitle: subtitle)
        
    }
    
    
    func newSuccessAlert(title : String , subtitle : String ,button : String , secondSelector:@escaping MethodHandler) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        
        _ = alert.addButton(button) {
            secondSelector()
        }
        
        
        _ = alert.showSuccess(title, subTitle: subtitle)
        
    }
    
    func WarningSelectAlert(title : String , subtitle : String ,button : String , secondSelector:@escaping MethodHandler , CancelSelector:@escaping MethodHandler) -> Void {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "IRANYekanMobile", size: 20)!,
            kTextFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            kButtonFont: UIFont(name: "IRANYekanMobile", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: false,
            buttonsLayout: .horizontal
        )
        let alert = SCLAlertView(appearance: appearance)
        _ = alert.addButton("لغو") {
            CancelSelector()
        }
        _ = alert.addButton(button) {
            secondSelector()
        }
        
        
        
        _ = alert.showWarning(title, subTitle: subtitle)
        
    }
    
    
    
    
    static func showToast(text:String,type:String){
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "remove_toast"), object: nil,userInfo:nil)
        let toast = toastView(text: text,type:type)
        toast.show()
    }
    
}
