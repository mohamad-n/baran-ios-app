//
//  loader view.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//




import Foundation

import UIKit




class LoaderView: UIView  {
    
    
    
    
    
    
    
    var backgroundView = UIView()
    
    var dialogView : UIView = {
        let view = UIView()
        //        view.backgroundColor = UIColor.headerBar
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    public let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.rowTextColor
        titleLabel.text = "در حال بارگزاری"
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
        public let loader : UIActivityIndicatorView = {
            let view = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
            view.alpha = 1.0
            view.hidesWhenStopped = true
            return view
        }()
    
    
//    public let loader : NVActivityIndicatorView = {
//        let view = NVActivityIndicatorView(frame: UIScreen.main.bounds, type: .ballScaleMultiple, color: UIColor.download_blue, padding: 0)
//
//        view.alpha = 1.0
//        //        view.hidesWhenStopped = true
//        return view
//    }()
    
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
        self.setupViews()
        
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = false
        
        
    }
    
    func setupViews(){
        
        dialogView.clipsToBounds = true
        dialogView.backgroundColor = .white
        
        backgroundView.frame = frame
        backgroundView.backgroundColor = UIColor.gray
        backgroundView.alpha = 0.2
        addSubview(backgroundView)
        //
        
        
        
        
        dialogView.addSubview(loader)
        loader.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(dialogView.snp.centerX)
            make.centerY.equalTo(dialogView.snp.centerY)
            make.width.height.equalTo(80)
        }
        
        
        
        
                dialogView.addSubview(titleLabel)
                titleLabel.snp.makeConstraints { (make) -> Void in
                    make.bottom.equalTo(dialogView.snp.bottom).offset(-10)
                    make.right.equalTo(dialogView.snp.right).offset(-2)
                    make.left.equalTo(dialogView.snp.left).offset(2)
                }
        
        
        
        
        
        
        
        
        
        
        
        let Dwidth = UIScreen.main.bounds.size.width * (1/3)
        let Dheight = Dwidth // + 20
        let SupperViewCenter = CGPoint(x: UIScreen.main.bounds.size.width/2 - Dwidth/2, y: UIScreen.main.bounds.size.height/2 - Dheight/2)
        let actionOrigin = SupperViewCenter
        dialogView.frame.size = CGSize(width: Dwidth, height: Dheight)
        
        
        dialogView.frame.origin = actionOrigin
        addSubview(dialogView)
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func show(){
                self.dialogView.alpha = 0
        self.loader.startAnimating()
        if var topController = UIApplication.shared.delegate?.window??.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.view.addSubview(self)
        }
        UIView.animate(withDuration: 0.2, animations: {
//            self.backgroundView.alpha = 0.2
                        self.dialogView.alpha = 1
            
        })
        
        
    }
    
    func dismiss(){
        
//        self.loader.stopAnimating()
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundView.alpha = 0
                        self.dialogView.alpha = 0
            self.loader.stopAnimating()
            
        }, completion: { (completed) in
            self.removeFromSuperview()
            
        })
        
        
    }
}


