//
//  toast.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//


import Foundation

import UIKit
import SnapKit





class toastView: UIView {
    
    //    var backgroundView = UIView()
    
    var dummyView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    var mainView : UILabel = {
        let label = UILabel()
        
        label.clipsToBounds = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    
    convenience init(text:String,type:String) {
        self.init(frame: UIScreen.main.bounds)
        self.mainView.text = text
        
        switch type {
        case "warning":
            self.dummyView.backgroundColor = UIColor(red: 1.0, green: 0.749, blue: 0.2, alpha: 1.0)
        case "error":
            self.dummyView.backgroundColor = UIColor(red: 0.8, green: 0.027, blue: 0.0, alpha: 0.7)
        case "success":
            self.dummyView.backgroundColor = UIColor(red: 0.0, green: 0.718, blue: 0.424, alpha: 1.0)
        default:
            self.dummyView.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
            
        }
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = false
        NotificationCenter.default.addObserver(self, selector: #selector(self.remove_toast(_:)), name: NSNotification.Name(rawValue: "remove_toast"), object: nil)
        
        setupViews()
        
    }
    
    @objc func remove_toast(_ notification: NSNotification){
        
        
        self.dismiss()
    }
    
    func setupViews(){
        
        
        
        
        //        mainView.clipsToBounds = true
        
        //        backgroundView.frame = frame
        //        backgroundView.backgroundColor = UIColor.clear
        //        //        backgroundView.alpha = 0.6
        //        backgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTappedOnBackgroundView)))
        //        addSubview(backgroundView)
        //
        
        addSubview(dummyView)
        
        let width = (8*UIScreen.main.bounds.width)/10
        dummyView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-80)
            make.centerX.equalToSuperview()
            make.width.equalTo(width)
            
        }
        
        dummyView.addSubview(mainView)
        
        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(10)
            
        }
        
        //        let width = (8*UIScreen.main.bounds.width)/10
        //
        //                mainView.snp.makeConstraints { (make) in
        //                    make.width.equalTo(width)
        //                    make.height.equalTo(50)
        //                    make.centerX.equalToSuperview()
        //                    make.bottom.equalToSuperview().offset(-80)
        //
        //                }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTappedOnBackgroundView(){
        dismiss()
    }
    
    
    //    var dialogHeight:CGFloat = 200
    
    
    func show(){
        //        self.backgroundView.alpha = 0
        self.dummyView.alpha = 0
        //        mainView.frame.size = CGSize(width: mainView.frame.width, height: 0)
        
        if var topController = UIApplication.shared.delegate?.window??.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.view.addSubview(self)
        }
        
        
        
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            //            self.backgroundView.alpha = 1
            self.dummyView.alpha = 1
            //
            //            self.mainView.frame.size = CGSize(width: self.mainView.frame.width, height: self.dialogHeight)
        }, completion: { (completed) in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                self.dismiss()
            })
            
        })
        
    }
    
    func dismiss(){
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            //            self.backgroundView.alpha = 0
            self.dummyView.alpha = 0
            //            self.mainView.frame.size = CGSize(width: self.mainView.frame.width, height: 0)
        }, completion: { (completed) in
            self.removeFromSuperview()
        })
        
        
    }
}




