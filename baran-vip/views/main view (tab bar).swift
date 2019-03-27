//
//  main view.swift
//  baran-vip
//
//  Created by alfy on 3/28/19.
//  Copyright © 2019 isibland. All rights reserved.
//



import Foundation
import UIKit


class mainView : UITabBarController  {
    
    
    //    let cartVC = cartView()
    //
    //    var shopCatModel : shopCategory?
    
    var tabBarImageIcon = [#imageLiteral(resourceName: "home"),#imageLiteral(resourceName: "home"), #imageLiteral(resourceName: "home"), #imageLiteral(resourceName: "home")]
//    var tabBarImageIconOn = [#imageLiteral(resourceName: "home"),#imageLiteral(resourceName: "game"), #imageLiteral(resourceName: "blog"), #imageLiteral(resourceName: "profile-page")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.view.backgroundColor = .red
        
        self.setupViews()
        
    }
    
    
    //    init(shopCatModel:shopCategory){
    //        super.init(nibName: nil, bundle: nil)
    //        self.shopCatModel = shopCatModel
    //        self.setupViews(type: "normal", search_term: "")
    //    }
    //
    //
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupViews(){
        let home = homeVC()
        home.title = "خانه"
        
        
        
        let product_view = productVC()
        product_view.title = "محصولات"
        
        let service_view = serviceVC()
        service_view.title = "سرویس"
        
        let blog_view = blogVC()
        blog_view.title = "اخبار"
        
        
        
        
        home.tabBarItem = UITabBarItem()
        product_view.tabBarItem = UITabBarItem()
        service_view.tabBarItem = UITabBarItem()
        blog_view.tabBarItem = UITabBarItem()
        
        //        userVC.tabBarItem = UITabBarItem()
        
        
        
        let controllers = [home, product_view, service_view,blog_view]
        //        self.viewControllers = controllers
        
        
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0 )}
        
        if let count = self.tabBar.items?.count {
            for i in 0...(count-1) {
                let imageNameForSelectedState   = tabBarImageIcon[i]
//                let imageNameForUnselectedState = tabBarImageIconOff[i]
                
//                self.tabBar.items?[i].selectedImage = imageNameForSelectedState.withRenderingMode(.alwaysOriginal)
                self.tabBar.items?[i].image = imageNameForSelectedState
            }
        }
        
        
        
        self.selectedIndex = 0
        self.tabBar.backgroundColor = .white
        
        
    }
    
    
    
    
    
    
    
    
    
}
